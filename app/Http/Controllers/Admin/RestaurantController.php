<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Restaurant;
use App\Models\RestaurantTranslation;
use App\Models\CategoryRestaurant;
use App\Models\RestaurantImage;
use App\Models\Language;
use App\Models\Key;
use Illuminate\Http\Request;
use App\Rules\FileTypeValidate;
use App\Constants\Status;
use Illuminate\Support\Facades\DB;

class RestaurantController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Restaurants';
        $restaurants = Restaurant::withTranslation()->with('category')->orderBy('sort_order', 'asc')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.restaurant.index', compact('pageTitle', 'restaurants'));
    }

    public function create()
    {
        $pageTitle = 'Create Restaurant';
        $languages = Language::all();
        $categories = CategoryRestaurant::withTranslation()->get();
        return view('admin.restaurant.create', compact('pageTitle', 'languages', 'categories'));
    }

    public function edit($id)
    {
        $restaurant = Restaurant::with(['translations', 'images', 'introImages'])->findOrFail($id);
        $pageTitle = 'Edit Restaurant';
        $languages = Language::all();
        $categories = CategoryRestaurant::withTranslation()->get();
        return view('admin.restaurant.edit', compact('pageTitle', 'restaurant', 'languages', 'categories'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'image_input' => [$id ? 'nullable' : 'required', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'intro_gallery.*' => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'category_id' => 'nullable|integer',
            'translations' => 'required|array',
            'translations.*.name' => 'required|string|max:255',
            'translations.*.slug' => [
                'required', 'string', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    $exists = Key::where('slug', $value)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_RESTAURANT)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
            'gallery' => 'nullable|array',
            'gallery.*' => ['image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],

            'opening_time' => 'nullable',
            'last_order_time' => 'nullable',
            'hotline' => 'nullable|string|max:255',
            'email' => 'nullable|email|max:255',
            'sort_order' => 'nullable|integer|min:0',
            'menu_pdf' => ['nullable', 'file', new FileTypeValidate(['pdf'])],
            'promotion_link' => 'nullable|url|max:255',
       ]);

        DB::beginTransaction();
        try {
            $restaurant = Restaurant::find($id) ?: new Restaurant();
            $restaurant->category_id = $request->category_id;
            $restaurant->opening_time = $request->opening_time ? \Carbon\Carbon::parse($request->opening_time)->format('H:i:s') : null;
            $restaurant->last_order_time = $request->last_order_time ? \Carbon\Carbon::parse($request->last_order_time)->format('H:i:s') : null;
            $restaurant->hotline = $request->hotline;
            $restaurant->email = $request->email;
            $restaurant->is_large_frame = $request->is_large_frame ? 1 : 0;
            $restaurant->sort_order = $request->sort_order ?? 0;
            $restaurant->promotion_link = $request->promotion_link;
            $restaurant->admin_id = auth()->guard('admin')->id();

            if ($request->hasFile('image_input')) {
                try {
                    $restaurant->image = fileUploader($request->image_input, getFilePath('restaurant'), getFileSize('restaurant'), $restaurant->image);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload restaurant image');
                }
            }

            if ($request->hasFile('menu_pdf')) {
                try {
                    $restaurant->menu_pdf = fileUploader($request->menu_pdf, getFilePath('restaurant_menu_pdf'), null, $restaurant->menu_pdf);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload menu PDF');
                }
            }

            $restaurant->save();

            // Restaurant Translations
            foreach ($request->translations as $langCode => $data) {
                $translation = $restaurant->translations()->where('lang_code', $langCode)->first() ?: new RestaurantTranslation();
                $translation->restaurant_id = $restaurant->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = $data['slug'];
                $translation->description = $data['description'] ?? null;
                $translation->content = $data['content'] ?? null;
                $translation->seo_title = $data['seo_title'] ?? null;
                $translation->seo_description = $data['seo_description'] ?? null;
                $translation->seo_keywords = $data['seo_keywords'] ?? null;
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_RESTAURANT)
                    ->where('key_id', $restaurant->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();

                $key->slug = $data['slug'];
                $key->type = Key::TYPE_RESTAURANT;
                $key->key_id = $restaurant->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            // Introduction gallery images
            if ($request->hasFile('intro_gallery')) {
                foreach ($request->file('intro_gallery') as $file) {
                    try {
                        $image = new RestaurantImage();
                        $image->restaurant_id = $restaurant->id;
                        $image->type = 2;
                        $image->image = fileUploader($file, getFilePath('restaurant'));
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
                        $image = new RestaurantImage();
                        $image->restaurant_id = $restaurant->id;
                        $image->type = 1;
                        $image->image = fileUploader($file, getFilePath('restaurant'));
                        $image->save();
                    } catch (\Exception $exp) {
                        continue;
                    }
                }
            }

            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }

        $notify[] = ['success', 'Restaurant saved successfully'];
        return to_route('admin.restaurant.index')->withNotify($notify);
    }

    public function status($id)
    {
        $restaurant = Restaurant::findOrFail($id);
        $restaurant->status = $restaurant->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $restaurant->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
    }

    public function imageRemove($id)
    {
        $image = RestaurantImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('restaurant') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $restaurant = Restaurant::findOrFail($id);

        // Remove main image
        fileManager()->removeFile(getFilePath('restaurant') . '/' . $restaurant->image);

        // Remove menu PDF
        if ($restaurant->menu_pdf) {
            fileManager()->removeFile(getFilePath('restaurant_menu_pdf') . '/' . $restaurant->menu_pdf);
        }

        // Remove gallery images (both types)
        foreach ($restaurant->images as $img) {
            fileManager()->removeFile(getFilePath('restaurant') . '/' . $img->image);
            $img->delete();
        }

        // Remove keys
        Key::where('type', Key::TYPE_RESTAURANT)->where('key_id', $restaurant->id)->delete();

        // Remove translations
        $restaurant->translations()->delete();

        // Final delete
        $restaurant->delete();

        $notify[] = ['success', 'Restaurant deleted successfully'];
        return back()->withNotify($notify);
    }
}
