<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CategoryRoom;
use App\Models\CategoryRoomTranslation;
use App\Models\Language;
use App\Models\Key;
use App\Components\Recursive;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Constants\Status;

class RoomCategoryController extends Controller
{
    public function index()
    {
        $pageTitle = 'Room Categories';
        $categories = CategoryRoom::withTranslation()->orderBy('order', 'asc')->paginate(getPaginate());
        
        return view('admin.room.category.index', compact('pageTitle', 'categories'));
    }

    public function create()
    {
        $pageTitle = 'Add Room Category';
        $languages = Language::all();

        $categories = CategoryRoom::all();
        $recursive = new Recursive($categories);
        $options = $recursive->categoryRecursive();

        return view('admin.room.category.create', compact('pageTitle', 'languages', 'options'));
    }

    public function edit($id)
    {
        $pageTitle = 'Edit Room Category';
        $category = CategoryRoom::with('translations')->findOrFail($id);
        $languages = Language::all();

        $categories = CategoryRoom::where('id', '!=', $id)->get();
        $recursive = new Recursive($categories);
        $options = $recursive->categoryRecursive($category->parent_id);

        return view('admin.room.category.edit', compact('pageTitle', 'category', 'languages', 'options'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'image_input' => [$id ? 'nullable' : 'required', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'parent_id' => 'nullable|integer',
            'order' => 'nullable|integer',
            'translations' => 'required|array',
            'translations.*.name' => 'required|string|max:255',
            'translations.*.slug' => [
                'required', 'string', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    $exists = Key::where('slug', $value)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_CATEGORY_ROOM)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
        ]);

        $category = CategoryRoom::find($id) ?: new CategoryRoom();
        $category->parent_id = $request->parent_id ?: 0;
        $category->order = $request->order ?: 0;
        $category->admin_id = auth()->guard('admin')->id();

        if ($request->hasFile('image_input')) {
            try {
                $category->image = fileUploader($request->image_input, getFilePath('room_category'), getFileSize('room_category'), $category->image);
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $category->save();

        foreach ($request->translations as $langCode => $data) {
            $translation = $category->translations()->where('lang_code', $langCode)->first() ?: new CategoryRoomTranslation();
            $translation->category_room_id = $category->id;
            $translation->lang_code = $langCode;
            $translation->name = $data['name'];
            $translation->slug = $data['slug'];
            $translation->description = $data['description'] ?? null;
            $translation->save();

            // Sync with keys table
            $key = Key::where('type', Key::TYPE_CATEGORY_ROOM)
                ->where('key_id', $category->id)
                ->where('lang_code', $langCode)
                ->first() ?: new Key();
            
            $key->slug = $data['slug'];
            $key->type = Key::TYPE_CATEGORY_ROOM;
            $key->key_id = $category->id;
            $key->lang_code = $langCode;
            $key->save();
        }

        $notify[] = ['success', 'Category saved successfully'];
        return to_route('admin.room.category.index')->withNotify($notify);
    }

    public function status($id)
    {
        $category = CategoryRoom::findOrFail($id);
        $category->status = $category->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $category->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
    }
}
