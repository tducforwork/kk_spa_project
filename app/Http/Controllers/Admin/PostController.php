<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Post;
use App\Models\PostImage;
use App\Models\PostTranslation;
use App\Models\CategoryPost;
use App\Models\Language;
use App\Models\Key;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Constants\Status;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class PostController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Posts';
        $posts = Post::withTranslation()->with('category')->orderBy('sort_order', 'asc')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.post.index', compact('pageTitle', 'posts'));
    }

    public function create()
    {
        $pageTitle = 'Create Post';
        $languages = Language::all();
        $categories = CategoryPost::withTranslation()->get();
        return view('admin.post.create', compact('pageTitle', 'languages', 'categories'));
    }

    public function edit($id)
    {
        $post = Post::with(['translations', 'images'])->findOrFail($id);
        $pageTitle = 'Edit Post';
        $languages = Language::all();
        $categories = CategoryPost::withTranslation()->get();
        return view('admin.post.edit', compact('pageTitle', 'post', 'languages', 'categories'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'image_input' => [$id ? 'nullable' : 'required', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'gallery.*' => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'category_id' => 'nullable|integer',
            'is_hot' => 'required|in:0,1',
            'sort_order' => 'nullable|integer|min:0',
            'translations' => 'required|array',
            'translations.*.name' => 'required|string|max:255',
            'translations.*.slug' => [
                'required', 'string', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    $exists = Key::where('slug', $value)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_POST)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
            'translations.*.toc' => 'nullable|array',
        ]);

        DB::beginTransaction();
        try {
            $post = Post::find($id) ?: new Post();
            $post->category_id = $request->category_id;
            $post->is_hot = $request->is_hot;
            $post->sort_order = $request->sort_order ?? 0;
            $post->admin_id = auth()->guard('admin')->id();

            if ($request->hasFile('image_input')) {
                try {
                    $post->image = fileUploader($request->image_input, getFilePath('post'), getFileSize('post'), $post->image);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload your image');
                }
            }

            $post->save();

            // Handle Gallery
            if ($request->hasFile('gallery')) {
                foreach ($request->gallery as $file) {
                    try {
                        $postImage = new PostImage();
                        $postImage->post_id = $post->id;
                        $postImage->image = fileUploader($file, getFilePath('post'), getFileSize('post'));
                        $postImage->save();
                    } catch (\Exception $exp) {
                    }
                }
            }

            foreach ($request->translations as $langCode => $data) {
                $translation = $post->translations()->where('lang_code', $langCode)->first() ?: new PostTranslation();
                $translation->post_id = $post->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = Str::slug($data['slug']);
                $translation->description = $data['description'] ?? null;
                $translation->content = $data['content'] ?? null;
                $translation->toc = $data['toc'] ?? null;
                $translation->seo_title = $data['seo_title'] ?? null;
                $translation->seo_description = $data['seo_description'] ?? null;
                $translation->seo_keywords = $data['seo_keywords'] ?? null;
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_POST)
                    ->where('key_id', $post->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();
                
                $key->slug = Str::slug($data['slug']);
                $key->type = Key::TYPE_POST;
                $key->key_id = $post->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            DB::commit();
            $notify[] = ['success', 'Post saved successfully'];
            return to_route('admin.post.index')->withNotify($notify);
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }
    }

    public function imageRemove($id)
    {
        $image = PostImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('post') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        $post = Post::findOrFail($id);
        $post->status = $post->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $post->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
    }
}
