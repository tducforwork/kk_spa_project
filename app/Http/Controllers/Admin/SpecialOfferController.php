<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\SpecialOffer;
use App\Models\SpecialOfferTranslation;
use App\Models\SpecialOfferImage;
use App\Models\Language;
use App\Constants\Status;
use App\Rules\FileTypeValidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;
use App\Models\Key;

class SpecialOfferController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Special Offers';
        $offers = SpecialOffer::withTranslation()->orderBy('sort_order', 'asc')->orderBy('id', 'desc')->paginate(getPaginate());
        return view('admin.special_offer.index', compact('pageTitle', 'offers'));
    }

    public function create()
    {
        $pageTitle = 'Create Special Offer';
        $languages = Language::all();
        return view('admin.special_offer.create', compact('pageTitle', 'languages'));
    }

    public function edit($id)
    {
        $offer = SpecialOffer::with(['translations', 'images', 'introImages'])->findOrFail($id);
        $pageTitle = 'Edit Special Offer';
        $languages = Language::all();
        return view('admin.special_offer.edit', compact('pageTitle', 'offer', 'languages'));
    }

    public function store(Request $request, $id = 0)
    {
        $request->validate([
            'image_input' => [$id ? 'nullable' : 'required', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'intro_gallery.*' => ['nullable', 'image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
            'hotline' => 'nullable|string|max:255',
            'email' => 'nullable|string|max:255',
            'sort_order' => 'nullable|integer|min:0',
            'translations' => 'required|array',
            'translations.*.name' => 'required|string|max:255',
            'translations.*.slug' => [
                'required', 'string', 'max:255',
                function ($attribute, $value, $fail) use ($id) {
                    // Extract lang_code from attribute (e.g., translations.en.slug)
                    $attributeParts = explode('.', $attribute);
                    $langCode = $attributeParts[1] ?? null;

                    if (!$langCode) {
                        return;
                    }

                    $slug = Str::slug($value);
                    $exists = Key::where('slug', $slug)
                        ->where('lang_code', $langCode)
                        ->whereNot(function ($q) use ($id) {
                            $q->where('type', Key::TYPE_SPECIAL_OFFER)->where('key_id', $id);
                        })->exists();

                    if ($exists) {
                        $fail(__('The slug ":slug" has already been taken', ['slug' => $slug, 'lang' => $langCode]));
                    }
                }
            ],
            'translations.*.text_price' => 'nullable|string|max:255',
            'translations.*.short_description' => 'nullable|string',
            'translations.*.content' => 'nullable|string',
            'translations.*.price_content' => 'nullable|string',
            'translations.*.terms_content' => 'nullable|string',
            'gallery' => 'nullable|array',
            'gallery.*' => ['image', new FileTypeValidate(['jpg', 'jpeg', 'png'])],
        ]);

        DB::beginTransaction();
        try {
            $offer = SpecialOffer::find($id) ?: new SpecialOffer();
            $offer->hotline = $request->hotline;
            $offer->email = $request->email;
            $offer->sort_order = $request->sort_order ?? 0;
            $offer->admin_id = auth()->guard('admin')->id();

            if ($request->hasFile('image_input')) {
                try {
                    $offer->image = fileUploader($request->image_input, getFilePath('special_offer'), getFileSize('special_offer'), $offer->image);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload offer image');
                }
            }

            $offer->save();

            // Translations
            foreach ($request->translations as $langCode => $data) {
                $translation = $offer->translations()->where('lang_code', $langCode)->first() ?: new SpecialOfferTranslation();
                $translation->special_offer_id = $offer->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = Str::slug($data['slug']);
                $translation->text_price = $data['text_price'];
                $translation->short_description = $data['short_description'];
                $translation->content = $data['content'];
                $translation->price_content = $data['price_content'];
                $translation->terms_content = $data['terms_content'];
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_SPECIAL_OFFER)
                    ->where('key_id', $offer->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();

                $key->slug = Str::slug($data['slug']);
                $key->type = Key::TYPE_SPECIAL_OFFER;
                $key->key_id = $offer->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            // Introduction gallery
            if ($request->hasFile('intro_gallery')) {
                foreach ($request->file('intro_gallery') as $file) {
                    try {
                        $image = new SpecialOfferImage();
                        $image->special_offer_id = $offer->id;
                        $image->image = fileUploader($file, getFilePath('special_offer'));
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
                        $image = new SpecialOfferImage();
                        $image->special_offer_id = $offer->id;
                        $image->image = fileUploader($file, getFilePath('special_offer'));
                        $image->type = 1; // Main gallery
                        $image->save();
                    } catch (\Exception $exp) {
                        continue;
                    }
                }
            }

            DB::commit();
            $notify[] = ['success', 'Special offer saved successfully'];
            return to_route('admin.special.offer.index')->withNotify($notify);
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }
    }

    public function status($id)
    {
        return SpecialOffer::changeStatus($id);
    }

    public function imageRemove($id)
    {
        $image = SpecialOfferImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('special_offer') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $offer = SpecialOffer::findOrFail($id);

        // Remove files
        fileManager()->removeFile(getFilePath('special_offer') . '/' . $offer->image);

        // Remove gallery
        foreach ($offer->images as $img) {
            fileManager()->removeFile(getFilePath('special_offer') . '/' . $img->image);
            $img->delete();
        }

        $offer->translations()->delete();
        Key::where('type', Key::TYPE_SPECIAL_OFFER)->where('key_id', $offer->id)->delete();
        $offer->delete();

        $notify[] = ['success', 'Special offer deleted successfully'];
        return back()->withNotify($notify);
    }
}
