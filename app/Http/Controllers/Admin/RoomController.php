<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Room;
use App\Models\RoomTranslation;
use App\Models\CategoryRoom;
use App\Models\RoomImage;
use App\Models\Language;
use App\Models\Key;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Constants\Status;
use Illuminate\Support\Facades\DB;

class RoomController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Rooms';
        $rooms = Room::withTranslation()->with('category')->orderBy('sort_order', 'asc')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.room.index', compact('pageTitle', 'rooms'));
    }

    public function create()
    {
        $pageTitle = 'Create Room';
        $languages = Language::all();
        $categories = CategoryRoom::withTranslation()->get();
        $relatedRooms = Room::withTranslation()->orderBy('id', 'desc')->get();
        return view('admin.room.create', compact('pageTitle', 'languages', 'categories', 'relatedRooms'));
    }

    public function edit($id)
    {
        $room = Room::with(['translations', 'images', 'introImages', 'relatedRooms'])->findOrFail($id);
        $pageTitle = 'Edit Room';
        $languages = Language::all();
        $categories = CategoryRoom::withTranslation()->get();
        $relatedRooms = Room::withTranslation()->where('id', '!=', $id)->orderBy('id', 'desc')->get();
        return view('admin.room.edit', compact('pageTitle', 'room', 'languages', 'relatedRooms'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'image_input'           => [$id ? 'nullable' : 'required', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'intro_gallery.*'       => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'category_id'           => 'nullable|integer',
            'price'                 => 'required|numeric',
            'is_hot'                => 'required|in:0,1',
            'sort_order'            => 'nullable|integer|min:0',
            'translations'          => 'required|array',
            'translations.*.name'   => 'required|string|max:255',
            'translations.*.slug' => [
                'required', 'string', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    $exists = Key::where('slug', $value)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_ROOM)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
            'translations.*.additional_info' => 'nullable|array',
            'gallery'               => 'nullable|array',
            'gallery.*'             => ['image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'related_rooms'         => 'nullable|array',
            'related_rooms.*'       => 'integer|exists:rooms,id',
        ]);

        DB::beginTransaction();
        try {
            $room = Room::find($id) ?: new Room();
            $room->category_id = $request->category_id;
            $room->price = $request->price;
            $room->is_hot = $request->is_hot;
            $room->sort_order = $request->sort_order ?? 0;
            $room->admin_id = auth()->guard('admin')->id();

            if ($request->hasFile('image_input')) {
                try {
                    $room->image = fileUploader($request->image_input, getFilePath('room'), getFileSize('room'), $room->image);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload thumbnail image');
                }
            }

            $room->save();

            foreach ($request->translations as $langCode => $data) {
                $translation = $room->translations()->where('lang_code', $langCode)->first() ?: new RoomTranslation();
                $translation->room_id = $room->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = $data['slug'];
                $translation->description = $data['description'] ?? null;
                $translation->content = $data['content'] ?? null;

                // New & existing fields
                $translation->acreage = $data['acreage'] ?? null;
                $translation->direction = $data['direction'] ?? null;
                $translation->bed = $data['bed'] ?? null;
                $translation->capacity = $data['capacity'] ?? null;
                $translation->bathroom = $data['bathroom'] ?? null;

                $translation->others = $data['others'] ?? null;
                $translation->suite_highlights = $data['suite_highlights'] ?? null;
                $translation->technology = $data['technology'] ?? null;
                $translation->bed_bath = $data['bed_bath'] ?? null;

                $translation->seo_keywords = $data['seo_keywords'] ?? null;

                // Handle additional_info repeater
                $additionalInfo = $data['additional_info'] ?? [];
                if ($additionalInfo && is_array($additionalInfo)) {
                    foreach ($additionalInfo as $index => &$item) {
                        $iconFileInput = "translations.{$langCode}.additional_info.{$index}.icon_file";
                        if ($request->hasFile($iconFileInput)) {
                            try {
                                $item['icon'] = fileUploader($request->file($iconFileInput), getFilePath('room_icon'), getFileSize('room_icon'), @$item['icon']);
                            } catch (\Exception $exp) {
                                // Continue if icon upload fails
                            }
                        }
                    }
                }
                $translation->additional_info = $additionalInfo;
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_ROOM)
                    ->where('key_id', $room->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();

                $key->slug = $data['slug'];
                $key->type = Key::TYPE_ROOM;
                $key->key_id = $room->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            // Introduction gallery
            if ($request->hasFile('intro_gallery')) {
                foreach ($request->file('intro_gallery') as $file) {
                    try {
                        $image = new RoomImage();
                        $image->room_id = $room->id;
                        $image->image = fileUploader($file, getFilePath('room'));
                        $image->type = 2; // Intro gallery
                        $image->save();
                    } catch (\Exception $exp) {
                        continue;
                    }
                }
            }

            // Gallery images
            if ($request->hasFile('gallery')) {
                foreach ($request->file('gallery') as $file) {
                    try {
                        $image = new RoomImage();
                        $image->room_id = $room->id;
                        $image->image = fileUploader($file, getFilePath('room'));
                        $image->type = 1; // Main gallery
                        $image->save();
                    } catch (\Exception $exp) {
                        continue;
                    }
                }
            }

            $room->relatedRooms()->sync($request->related_rooms ?? []);

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }

        $notify[] = ['success', 'Room saved successfully'];
        return to_route('admin.room.index')->withNotify($notify);
    }

    public function status($id)
    {
        $room = Room::findOrFail($id);
        $room->status = $room->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $room->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
    }

    public function imageRemove($id)
    {
        $image = RoomImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('room') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $room = Room::findOrFail($id);

        // Remove files
        fileManager()->removeFile(getFilePath('room') . '/' . $room->image);

        // Remove gallery images
        foreach ($room->images as $img) {
            fileManager()->removeFile(getFilePath('room') . '/' . $img->image);
            $img->delete();
        }

        // Remove keys
        Key::where('type', Key::TYPE_ROOM)->where('key_id', $room->id)->delete();

        // Remove translations
        $room->translations()->delete();

        // Final delete
        $room->delete();

        $notify[] = ['success', 'Room deleted successfully'];
        return back()->withNotify($notify);
    }
}
