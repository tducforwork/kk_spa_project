<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\MiceEvent;
use App\Models\MiceEventImage;
use App\Models\MiceEventTranslation;
use App\Models\Language;
use App\Models\Key;
use App\Constants\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class MiceEventController extends Controller
{
    public function index()
    {
        $pageTitle = 'MICE & Events';
        $events = MiceEvent::with('translations')->orderBy('sort_order', 'asc')->latest()->paginate(getPaginate());
        return view('admin.mice_event.index', compact('pageTitle', 'events'));
    }

    public function create()
    {
        $pageTitle = 'Create MICE & Event';
        $languages = Language::all();
        return view('admin.mice_event.create', compact('pageTitle', 'languages'));
    }

    public function store(Request $request, $id = 0)
    {
        $this->validation($request, $id);

        DB::beginTransaction();
        try {
            if ($id) {
                $event = MiceEvent::findOrFail($id);
                $notification = 'MICE & Event updated successfully';
            } else {
                $event = new MiceEvent();
                $notification = 'MICE & Event created successfully';
            }

            if ($request->hasFile('image_input')) {
                try {
                    $old = $event->avatar;
                    $event->avatar = fileUploader($request->image_input, getFilePath('mice_event'), getFileSize('mice_event'), $old);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload your avatar image');
                }
            }

            $event->is_featured = $request->is_featured ? 1 : 0;
            $event->status = $request->status ? 1 : 0;
            $event->sort_order = $request->sort_order ?? 0;
            $event->save();

            // Handle Introduction Gallery (Type 2)
            if ($request->hasFile('intro_gallery')) {
                foreach ($request->intro_gallery as $file) {
                    try {
                        $eventImage = new MiceEventImage();
                        $eventImage->mice_event_id = $event->id;
                        $eventImage->image = fileUploader($file, getFilePath('mice_event'), getFileSize('mice_event'));
                        $eventImage->type = 2;
                        $eventImage->save();
                    } catch (\Exception $exp) {
                    }
                }
            }

            // Handle Main Gallery (Type 1)
            if ($request->hasFile('gallery')) {
                foreach ($request->gallery as $file) {
                    try {
                        $eventImage = new MiceEventImage();
                        $eventImage->mice_event_id = $event->id;
                        $eventImage->image = fileUploader($file, getFilePath('mice_event'), getFileSize('mice_event'));
                        $eventImage->type = 1;
                        $eventImage->save();
                    } catch (\Exception $exp) {
                    }
                }
            }

            // Handle Translations
            foreach ($request->translations as $langCode => $data) {
                $translation = MiceEventTranslation::where('mice_event_id', $event->id)->where('lang_code', $langCode)->first() ?: new MiceEventTranslation();
                $translation->mice_event_id = $event->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = Str::slug($data['slug']);
                $translation->card_content = $data['card_content'];
                $translation->content = $data['content'];
                $translation->short_description = $data['short_description'];

                // New fields
                $translation->seo_title = $data['seo_title'] ?? null;
                $translation->seo_description = $data['seo_description'] ?? null;
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
                            }
                        }
                    }
                }
                $translation->additional_info = $additionalInfo;
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_MICE_EVENT)
                    ->where('key_id', $event->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();

                $key->slug = Str::slug($data['slug']);
                $key->type = Key::TYPE_MICE_EVENT;
                $key->key_id = $event->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            DB::commit();
            $notify[] = ['success', $notification];
            return to_route('admin.mice.event.index')->withNotify($notify);
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }
    }

    public function edit($id)
    {
        $event = MiceEvent::with(['translations', 'images', 'introImages'])->findOrFail($id);
        $pageTitle = 'Edit MICE & Event';
        $languages = Language::all();
        return view('admin.mice_event.edit', compact('pageTitle', 'event', 'languages'));
    }

    public function imageRemove($id)
    {
        $image = MiceEventImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('mice_event') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $event = MiceEvent::with(['images', 'introImages'])->findOrFail($id);

        // Remove avatar
        fileManager()->removeFile(getFilePath('mice_event') . '/' . $event->avatar);

        // Remove gallery images (both types)
        $allImages = MiceEventImage::where('mice_event_id', $event->id)->get();
        foreach ($allImages as $img) {
            fileManager()->removeFile(getFilePath('mice_event') . '/' . $img->image);
            $img->delete();
        }

        // Remove keys
        Key::where('type', Key::TYPE_MICE_EVENT)->where('key_id', $event->id)->delete();

        // Remove translations
        $event->translations()->delete();

        $event->delete();

        $notify[] = ['success', 'MICE & Event deleted successfully'];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        return MiceEvent::changeStatus($id);
    }

    protected function validation($request, $id)
    {
        $request->validate([
            'image_input' => [$id ? 'nullable' : 'required', 'image', 'mimes:jpeg,jpg,png'],
            'intro_gallery.*' => ['nullable', 'image', 'mimes:jpeg,jpg,png'],
            'gallery.*' => ['nullable', 'image', 'mimes:jpeg,jpg,png'],
            'sort_order' => 'nullable|integer|min:0',
            'translations.*.name' => 'required|max:255',
            'translations.*.slug' => [
                'required', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    $exists = Key::where('slug', $value)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_MICE_EVENT)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
            'translations.*.card_content' => 'nullable',
            'translations.*.content' => 'nullable',
            'translations.*.short_description' => 'nullable',
            'translations.*.suite_highlights' => 'nullable',
            'translations.*.technology' => 'nullable',
            'translations.*.bed_bath' => 'nullable',
            'translations.*.others' => 'nullable',
            'translations.*.additional_info' => 'nullable|array',
        ]);
    }
}
