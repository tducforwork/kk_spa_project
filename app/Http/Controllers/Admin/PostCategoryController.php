<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\CategoryPost;
use App\Models\CategoryPostTranslation;
use App\Models\Language;
use App\Models\Key;
use App\Components\Recursive;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Constants\Status;

class PostCategoryController extends Controller
{
    public function index()
    {
        $pageTitle = 'Post Categories';
        $categories = CategoryPost::withTranslation()->orderBy('order', 'asc')->paginate(getPaginate());
        
        return view('admin.post.category.index', compact('pageTitle', 'categories'));
    }

    public function create()
    {
        $pageTitle = 'Add Post Category';
        $languages = Language::all();

        $categories = CategoryPost::all();
        $recursive = new Recursive($categories);
        $options = $recursive->categoryRecursive();

        return view('admin.post.category.create', compact('pageTitle', 'languages', 'options'));
    }

    public function edit($id)
    {
        $pageTitle = 'Edit Post Category';
        $category = CategoryPost::with('translations')->findOrFail($id);
        $languages = Language::all();

        $categories = CategoryPost::where('id', '!=', $id)->get();
        $recursive = new Recursive($categories);
        $options = $recursive->categoryRecursive($category->parent_id);

        return view('admin.post.category.edit', compact('pageTitle', 'category', 'languages', 'options'));
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
                            $q->where('type', Key::TYPE_CATEGORY_POST)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
        ]);

        $category = CategoryPost::find($id) ?: new CategoryPost();
        $category->parent_id = $request->parent_id ?: 0;
        $category->order = $request->order ?: 0;
        $category->admin_id = auth()->guard('admin')->id();

        if ($request->hasFile('image_input')) {
            try {
                $category->image = fileUploader($request->image_input, getFilePath('post_category'), getFileSize('post_category'), $category->image);
            } catch (\Exception $exp) {
                $notify[] = ['error', 'Couldn\'t upload your image'];
                return back()->withNotify($notify);
            }
        }

        $category->save();

        foreach ($request->translations as $langCode => $data) {
            $translation = $category->translations()->where('lang_code', $langCode)->first() ?: new CategoryPostTranslation();
            $translation->category_post_id = $category->id;
            $translation->lang_code = $langCode;
            $translation->name = $data['name'];
            $translation->slug = $data['slug'];
            $translation->description = $data['description'] ?? null;
            $translation->content = $data['content'] ?? null;
            $translation->seo_title = $data['seo_title'] ?? null;
            $translation->seo_description = $data['seo_description'] ?? null;
            $translation->seo_keywords = $data['seo_keywords'] ?? null;
            $translation->save();

            // Sync with keys table for routing
            $key = Key::where('type', Key::TYPE_CATEGORY_POST)
                ->where('key_id', $category->id)
                ->where('lang_code', $langCode)
                ->first() ?: new Key();
            
            $key->slug = $data['slug'];
            $key->type = Key::TYPE_CATEGORY_POST;
            $key->key_id = $category->id;
            $key->lang_code = $langCode;
            $key->save();
        }

        $notify[] = ['success', 'Category saved successfully'];
        return to_route('admin.post.category.index')->withNotify($notify);
    }

    public function status($id)
    {
        $category = CategoryPost::findOrFail($id);
        $category->status = $category->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $category->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
    }
}
