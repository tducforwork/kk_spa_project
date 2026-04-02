@extends('admin.layouts.app')
@section('panel')
    <form action="{{ route('admin.room.store', @$room->id ?? 0) }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('Main Information')</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>@lang('Thumbnail Image')</label>
                            <x-image-uploader :imagePath="getImage(
                                @$room->image ? getFilePath('room') . '/' . $room->image : null,
                                getFileSize('room'),
                            )" :size="getFileSize('room')" class="w-100" id="imageInput"
                                name="image_input" :required="isset($room) ? false : true" />
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery Introduction') (@lang('Mới'))</label>
                            <input type="file" name="intro_gallery[]" class="form-control" multiple
                                accept=".png, .jpg, .jpeg">
                        </div>
                        {{-- <div class="form-group">
                            <label>@lang('Category')</label>
                            <select name="category_id" class="form-control">
                                <option value="">@lang('Select One')</option>
                                @foreach ($categories as $category)
                                    <option value="{{ $category->id }}" @selected(@$room->category_id == $category->id)>{{ __($category->t->name) }}</option>
                                @endforeach
                            </select>
                        </div> --}}
                        <div class="form-group">
                            <label>@lang('Price')</label>
                            <div class="input-group">
                                <input type="number" step="any" class="form-control" name="price"
                                    value="{{ old('price', @$room->price) }}" required>
                                <span class="input-group-text">{{ gs('cur_text') }}</span>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>@lang('Is Hot')</label>
                            <select name="is_hot" class="form-control" required>
                                <option value="0" @selected(@$room->is_hot == 0)>@lang('No')</option>
                                <option value="1" @selected(@$room->is_hot == 1)>@lang('Yes')</option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label>@lang('Sort Order')</label>
                            <input type="number" class="form-control" name="sort_order"
                                value="{{ old('sort_order', @$room->sort_order ?? 0) }}" min="0">
                        </div>
                        <div class="form-group border--primary p-2 border-1" style="border: 1px solid !important; border-radius: 5px;">
                            <label>@lang('Related Rooms')</label>
                            <select name="related_rooms[]" class="form-control select2" multiple="multiple">
                                @foreach ($relatedRooms as $relRoom)
                                    <option value="{{ $relRoom->id }}">
                                        {{ __($relRoom->t->name) }} ({{ $relRoom->id }})</option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>


                <div class="card">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('Gallery Images')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row" id="gallery-container">
                            @if (@$room->images)
                                @foreach ($room->images as $img)
                                    <div class="col-md-6 mb-3 gallery-item">
                                        <div class="position-relative">
                                            <img src="{{ getImage(getFilePath('room') . '/' . $img->image) }}"
                                                class="img-thumbnail w-100">
                                            <button type="button"
                                                class="btn btn-sm btn--danger position-absolute top-0 end-0 remove-gallery-db"
                                                data-action="{{ route('admin.room.image.remove', $img->id) }}">
                                                <i class="las la-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="form-group">
                            <label>@lang('Add More Images')</label>
                            <input type="file" name="gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="card">
                    <div class="card-header bg--dark">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            @foreach ($languages as $lang)
                                <li class="nav-item">
                                    <a class="nav-link @if($loop->first) active @endif" id="{{ $lang->code }}-tab" data-bs-toggle="tab"
                                        href="#{{ $lang->code }}" role="tab" aria-controls="{{ $lang->code }}"
                                        aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                                        {{ __($lang->name) }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            @foreach ($languages as $lang)
                                @php
                                    $translation = @$room
                                        ? $room->translations->where('lang_code', $lang->code)->first()
                                        : null;
                                @endphp
                                <div class="tab-pane fade @if($loop->first) show active @endif" id="{{ $lang->code }}" role="tabpanel"
                                    aria-labelledby="{{ $lang->code }}-tab">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="required">@lang('Name')</label>
                                                    <input type="text" class="form-control name-input"
                                                        name="translations[{{ $lang->code }}][name]"
                                                        data-lang="{{ $lang->code }}" value="{{ @$translation->name }}"
                                                        required>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label class="required">@lang('Slug')</label>
                                                    <input type="text" class="form-control slug-input"
                                                        name="translations[{{ $lang->code }}][slug]"
                                                        data-lang="{{ $lang->code }}" value="{{ @$translation->slug }}"
                                                        required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label>@lang('Short Description')</label>
                                            <textarea class="form-control" name="translations[{{ $lang->code }}][description]">{{ @$translation->description }}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>@lang('Content')</label>
                                            <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ @$translation->content }}</textarea>
                                        </div>

                                        <x-repeater :lang="$lang->code" :items="@$translation->additional_info" />


                                        <div class="row card bg--light mb-3 p-3 mx-0"
                                            style="flex-direction: row !important">
                                            <h6 class="mb-3">@lang('Detailed Information') (@lang('List per line'))</h6>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>@lang('Suite Highlights')</label>
                                                    <textarea class="form-control" name="translations[{{ $lang->code }}][suite_highlights]" rows="5">{{ @$translation->suite_highlights }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>@lang('Technology')</label>
                                                    <textarea class="form-control" name="translations[{{ $lang->code }}][technology]" rows="5">{{ @$translation->technology }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>@lang('Bed & Bath')</label>
                                                    <textarea class="form-control" name="translations[{{ $lang->code }}][bed_bath]" rows="5">{{ @$translation->bed_bath }}</textarea>
                                                </div>
                                            </div>
                                            <div class="col-md-6">
                                                <div class="form-group">
                                                    <label>@lang('Others')</label>
                                                    <textarea class="form-control" name="translations[{{ $lang->code }}][others]" rows="5">{{ @$translation->others }}</textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="card bg--light mb-3">
                                            <div class="card-header">@lang('SEO Management')</div>
                                            <div class="card-body">
                                                <div class="form-group">
                                                    <label>@lang('SEO Title')</label>
                                                    <input type="text" class="form-control"
                                                        name="translations[{{ $lang->code }}][seo_title]"
                                                        value="{{ @$translation->seo_title }}">
                                                </div>
                                                <div class="form-group">
                                                    <label>@lang('SEO Description')</label>
                                                    <textarea class="form-control" name="translations[{{ $lang->code }}][seo_description]">{{ @$translation->seo_description }}</textarea>
                                                </div>
                                                <div class="form-group">
                                                    <label>@lang('SEO Keywords')</label>
                                                    <input type="text" class="form-control"
                                                        name="translations[{{ $lang->code }}][seo_keywords]"
                                                        value="{{ @$translation->seo_keywords }}">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.room.index') }}" />
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";

            $('.name-input').on('input', function() {
                let lang = $(this).data('lang');
                let slug = $(this).val().toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
                $(`[name="translations[${lang}][slug]"]`).val(slug);
            });

            $('.remove-gallery-db').on('click', function() {
                var modal = $('#confirmationModal');
                modal.find('form').attr('action', $(this).data('action'));
                modal.find('.question').text("@lang('Are you sure to remove this image?')");
                modal.modal('show');
            });

        })(jQuery);
    </script>
@endpush
