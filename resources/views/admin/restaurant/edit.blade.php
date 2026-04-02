@extends('admin.layouts.app')
@section('panel')
    <form action="{{ route('admin.restaurant.store', @$restaurant->id ?? 0) }}" method="POST" enctype="multipart/form-data">
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
                            <x-image-uploader :imagePath="getImage(@$restaurant->image ? getFilePath('restaurant') . '/' . $restaurant->image : null, getFileSize('restaurant'))" :size="getFileSize('restaurant')" class="w-100" id="imageInput" :required="isset($restaurant) ? false : true" name="image_input" />
                        </div>
                        <div class="form-group">
                            <label>@lang('Opening Time')</label>
                            <input type="time" class="form-control" name="opening_time" value="{{ old('opening_time') ?? (@$restaurant->opening_time ? \Carbon\Carbon::parse($restaurant->opening_time)->format('H:i') : '') }}" step="60">
                        </div>
                        <div class="form-group">
                            <label>@lang('Last Order Time')</label>
                            <input type="time" class="form-control" name="last_order_time" value="{{ old('last_order_time') ?? (@$restaurant->last_order_time ? \Carbon\Carbon::parse($restaurant->last_order_time)->format('H:i') : '') }}" step="60">
                        </div>
                        <div class="form-group">
                            <label>@lang('Hotline')</label>
                            <input type="text" class="form-control" name="hotline" value="{{ @$restaurant->hotline }}">
                        </div>
                        <div class="form-group">
                            <label>@lang('Email')</label>
                            <input type="email" class="form-control" name="email" value="{{ @$restaurant->email }}">
                        </div>

                        <div class="form-group text-end">
                            <label>@lang('Sort Order')</label>
                            <input type="number" class="form-control" name="sort_order" value="{{ @$restaurant->sort_order }}" min="0">
                        </div>

                        <div class="form-group">
                            <label>@lang('Menu PDF')</label>
                            <input type="file" class="form-control" name="menu_pdf" accept=".pdf">
                            @if (@$restaurant->menu_pdf)
                                <div class="mt-2 text-end">
                                    <a href="{{ getImage(getFilePath('restaurant_menu_pdf') . '/' . $restaurant->menu_pdf) }}" target="_blank" class="text--primary"><i class="las la-file-pdf"></i> @lang('View Current Menu')</a>
                                </div>
                            @endif
                        </div>

                        <div class="form-group">
                            <label>@lang('Promotion Link')</label>
                            <input type="url" class="form-control" name="promotion_link" value="{{ @$restaurant->promotion_link }}" placeholder="https://example.com/promo">
                        </div>

                        <div class="form-group">
                            <label>@lang('Large Frame Display')</label>
                            <input type="checkbox" data-width="100%" data-size="large" data-onstyle="-success" data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Enable')" data-off="@lang('Disable')" name="is_large_frame" @if (@$restaurant->is_large_frame) checked @endif>
                        </div>
                    </div>
                </div>


                <div class="card mb-4">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('Gallery Introduction')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @if(@$restaurant->introImages)
                                @foreach($restaurant->introImages as $img)
                                    <div class="col-md-6 mb-3">
                                        <div class="position-relative">
                                            <img src="{{ getImage(getFilePath('restaurant') . '/' . $img->image) }}" class="img-thumbnail w-100">
                                            <button type="button" class="btn btn-sm btn--danger position-absolute top-0 end-0 remove-gallery-db" data-action="{{ route('admin.restaurant.image.remove', $img->id) }}">
                                                <i class="las la-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            @endif
                        </div>
                        <div class="form-group">
                            <label>@lang('Add Images')</label>
                            <input type="file" name="intro_gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                        </div>
                    </div>
                </div>

                {{-- Gallery --}}
                <div class="card">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('Main Gallery')</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            @if(@$restaurant->mainImages)
                                @foreach($restaurant->mainImages as $img)
                                    <div class="col-md-6 mb-3">
                                        <div class="position-relative">
                                            <img src="{{ getImage(getFilePath('restaurant') . '/' . $img->image) }}" class="img-thumbnail w-100">
                                            <button type="button" class="btn btn-sm btn--danger position-absolute top-0 end-0 remove-gallery-db" data-action="{{ route('admin.restaurant.image.remove', $img->id) }}">
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
                <div class="card mb-4">
                    <div class="card-header bg--dark">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            @foreach($languages as $lang)
                                <li class="nav-item">
                                    <a class="nav-link {{ $loop->first ? 'active' : '' }}" id="{{ $lang->code }}-tab" data-bs-toggle="tab" href="#{{ $lang->code }}" role="tab">
                                        {{ __($lang->name) }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            @foreach($languages as $lang)
                                @php $translation = @$restaurant ? $restaurant->translations->where('lang_code', $lang->code)->first() : null; @endphp
                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel">
                                    <div class="form-group">
                                        <label class="required">@lang('Name')</label>
                                        <input type="text" class="form-control name-input" name="translations[{{ $lang->code }}][name]" data-lang="{{ $lang->code }}" value="{{ old('translations.' . $lang->code . '.name', @$translation->name ?: ($lang->code == 'en' ? @$restaurant->name : '')) }}" required>
                                    </div>
                                    <div class="form-group">
                                        <label class="required">@lang('Slug')</label>
                                        <input type="text" class="form-control slug-input" name="translations[{{ $lang->code }}][slug]" data-lang="{{ $lang->code }}" value="{{ old('translations.' . $lang->code . '.slug', @$translation->slug ?: ($lang->code == 'en' ? @$restaurant->slug : '')) }}" required>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Description')</label>
                                        <textarea class="form-control" name="translations[{{ $lang->code }}][description]">{{ old('translations.' . $lang->code . '.description', @$translation->description ?: ($lang->code == 'en' ? @$restaurant->description : '')) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Content')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ old('translations.' . $lang->code . '.content', @$translation->content ?: ($lang->code == 'en' ? @$restaurant->content : '')) }}</textarea>
                                    </div>
                                    
                                    <div class="card bg--light mb-3">
                                        <div class="card-header">@lang('SEO Management')</div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>@lang('SEO Title')</label>
                                                <input type="text" class="form-control" name="translations[{{ $lang->code }}][seo_title]" value="{{ @$translation->seo_title }}">
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('SEO Description')</label>
                                                <textarea class="form-control" name="translations[{{ $lang->code }}][seo_description]">{{ @$translation->seo_description }}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('SEO Keywords')</label>
                                                <input type="text" class="form-control" name="translations[{{ $lang->code }}][seo_keywords]" value="{{ @$translation->seo_keywords }}">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <div class="mt-3">
            <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit All')</button>
        </div>
    </form>
    <x-confirmation-modal />
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.restaurant.index') }}" />
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";

            $('.remove-gallery-db').on('click', function() {
                var modal = $('#confirmationModal');
                modal.find('form').attr('action', $(this).data('action'));
                modal.find('.question').text("@lang('Are you sure to remove this gallery image?')");
                modal.modal('show');
            });

            $('.name-input').on('input', function() {
                let lang = $(this).data('lang');
                let slug = $(this).val().toLowerCase().replace(/ /g, '-').replace(/[^\w-]+/g, '');
                $(`[name="translations[${lang}][slug]"]`).val(slug);
            });

        })(jQuery);
    </script>
@endpush
