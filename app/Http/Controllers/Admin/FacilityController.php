<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Facility;
use App\Models\FacilityImage;
use App\Models\FacilityTranslation;
use App\Models\Language;
use App\Models\Key;
use App\Constants\Status;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Str;

class FacilityController extends Controller
{
    public function index()
    {
        $pageTitle = 'All Facilities';
        $facilities = Facility::with('translations')->orderBy('sort_order', 'asc')->latest()->paginate(getPaginate());
        return view('admin.facility.index', compact('pageTitle', 'facilities'));
    }

    public function create()
    {
        $pageTitle = 'Create Facility';
        $languages = Language::all();
        return view('admin.facility.create', compact('pageTitle', 'languages'));
    }

    public function store(Request $request, $id = 0)
    {
        $this->validation($request, $id);

        DB::beginTransaction();
        try {
            if ($id) {
                $facility = Facility::findOrFail($id);
                $notification = 'Facility updated successfully';
            } else {
                $facility = new Facility();
                $notification = 'Facility created successfully';
            }

            if ($request->hasFile('image_input')) {
                try {
                    $old = $facility->image;
                    $facility->image = fileUploader($request->image_input, getFilePath('facility'), getFileSize('facility'), $old);
                } catch (\Exception $exp) {
                    throw new \Exception('Couldn\'t upload avatar image');
                }
            }

            $facility->sort_order = $request->sort_order ?? 0;
            $facility->admin_id = auth()->guard('admin')->id();
            $facility->save();

            // Handle Introduction Gallery (Type 2)
            if ($request->hasFile('intro_gallery')) {
                foreach ($request->intro_gallery as $file) {
                    try {
                        $facilityImage = new FacilityImage();
                        $facilityImage->facility_id = $facility->id;
                        $facilityImage->image = fileUploader($file, getFilePath('facility'), getFileSize('facility'));
                        $facilityImage->type = 2;
                        $facilityImage->save();
                    } catch (\Exception $exp) {
                    }
                }
            }

            // Handle Main Gallery (Type 1)
            if ($request->hasFile('gallery')) {
                foreach ($request->gallery as $file) {
                    try {
                        $facilityImage = new FacilityImage();
                        $facilityImage->facility_id = $facility->id;
                        $facilityImage->image = fileUploader($file, getFilePath('facility'), getFileSize('facility'));
                        $facilityImage->type = 1;
                        $facilityImage->save();
                    } catch (\Exception $exp) {
                    }
                }
            }

            // Handle Translations
            foreach ($request->translations as $langCode => $data) {
                $translation = FacilityTranslation::where('facility_id', $facility->id)->where('lang_code', $langCode)->first() ?: new FacilityTranslation();
                $translation->facility_id = $facility->id;
                $translation->lang_code = $langCode;
                $translation->name = $data['name'];
                $translation->slug = Str::slug($data['slug']);
                $translation->description = $data['description'];
                $translation->content = $data['content'];

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

                $translation->seo_title = $data['seo_title'] ?? null;
                $translation->seo_description = $data['seo_description'] ?? null;
                $translation->seo_keywords = $data['seo_keywords'] ?? null;
                $translation->save();

                // Sync with keys table
                $key = Key::where('type', Key::TYPE_FACILITY)
                    ->where('key_id', $facility->id)
                    ->where('lang_code', $langCode)
                    ->first() ?: new Key();

                $key->slug = Str::slug($data['slug']);
                $key->type = Key::TYPE_FACILITY;
                $key->key_id = $facility->id;
                $key->lang_code = $langCode;
                $key->save();
            }

            DB::commit();
            $notify[] = ['success', $notification];
            return to_route('admin.facility.index')->withNotify($notify);
        } catch (\Exception $e) {
            DB::rollBack();
            $notify[] = ['error', $e->getMessage()];
            return back()->withNotify($notify)->withInput();
        }
    }

    public function edit($id)
    {
        $facility = Facility::with(['translations', 'images', 'introImages'])->findOrFail($id);
        $pageTitle = 'Edit Facility';
        $languages = Language::all();
        return view('admin.facility.edit', compact('pageTitle', 'facility', 'languages'));
    }

    public function imageRemove($id)
    {
        $image = FacilityImage::findOrFail($id);
        fileManager()->removeFile(getFilePath('facility') . '/' . $image->image);
        $image->delete();
        $notify[] = ['success', 'Image removed successfully'];
        return back()->withNotify($notify);
    }

    public function remove($id)
    {
        $facility = Facility::findOrFail($id);

        // Remove avatar
        fileManager()->removeFile(getFilePath('facility') . '/' . $facility->image);

        // Remove gallery images
        $allImages = FacilityImage::where('facility_id', $facility->id)->get();
        foreach ($allImages as $img) {
            fileManager()->removeFile(getFilePath('facility') . '/' . $img->image);
            $img->delete();
        }

        // Remove keys
        Key::where('type', Key::TYPE_FACILITY)->where('key_id', $facility->id)->delete();

        // Remove translations
        $facility->translations()->delete();

        $facility->delete();

        $notify[] = ['success', 'Facility deleted successfully'];
        return back()->withNotify($notify);
    }

    public function status($id)
    {
        $facility = Facility::findOrFail($id);
        $facility->status = $facility->status == Status::ENABLE ? Status::DISABLE : Status::ENABLE;
        $facility->save();

        $notify[] = ['success', 'Status updated successfully'];
        return back()->withNotify($notify);
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
                            $q->where('type', Key::TYPE_FACILITY)->where('key_id', $id);
                        })->exists();
                    if ($exists) {
                        $fail('The slug has already been taken.');
                    }
                }
            ],
            'translations.*.description' => 'nullable',
            'translations.*.content' => 'nullable',
            'translations.*.additional_info' => 'nullable|array',
        ]);
    }
}
