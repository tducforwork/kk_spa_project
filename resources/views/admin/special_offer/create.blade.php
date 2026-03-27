@extends('admin.layouts.app')
@section('panel')
    <form action="{{ route('admin.special.offer.store', @$offer->id ?? 0) }}" method="POST" enctype="multipart/form-data">
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
                                @$offer->image ? getFilePath('special_offer') . '/' . $offer->image : null,
                                getFileSize('special_offer'),
                            )" :size="getFileSize('special_offer')" class="w-100" id="imageInput"
                                :required="isset($offer) ? false : true" name="image_input" />
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery Introduction') (@lang('Mới'))</label>
                            <input type="file" name="intro_gallery[]" class="form-control" multiple
                                accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="form-group">
                            <label>@lang('Hotline')</label>
                            <input type="text" class="form-control" name="hotline"
                                value="{{ old('hotline', @$offer->hotline) }}">
                        </div>
                        <div class="form-group">
                            <label>@lang('Email')</label>
                            <input type="email" class="form-control" name="email"
                                value="{{ old('email', @$offer->email) }}">
                        </div>
                        <div class="form-group">
                            <label>@lang('Sort Order')</label>
                            <input type="number" class="form-control" name="sort_order"
                                value="{{ old('sort_order', @$offer->sort_order ?? 0) }}" min="0">
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery')</label>
                            <input type="file" name="gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8">
                <div class="card mb-4">
                    <div class="card-header bg--dark">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            @foreach ($languages as $lang)
                                <li class="nav-item">
                                    <a class="nav-link {{ $loop->first ? 'active' : '' }}" id="{{ $lang->code }}-tab"
                                        data-bs-toggle="tab" href="#{{ $lang->code }}" role="tab">
                                        {{ __($lang->name) }}
                                    </a>
                                </li>
                            @endforeach
                        </ul>
                    </div>
                    <div class="card-body">
                        <div class="tab-content" id="myTabContent">
                            @foreach ($languages as $lang)
                                @php $translation = @$offer ? $offer->translations->where('lang_code', $lang->code)->first() : null; @endphp
                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}"
                                    role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Name')</label>
                                                <input type="text" class="form-control name-input"
                                                    name="translations[{{ $lang->code }}][name]"
                                                    data-lang="{{ $lang->code }}"
                                                    value="{{ old('translations.' . $lang->code . '.name', @$translation->name) }}"
                                                    required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Slug')</label>
                                                <input type="text" class="form-control slug-input"
                                                    name="translations[{{ $lang->code }}][slug]"
                                                    data-lang="{{ $lang->code }}"
                                                    value="{{ old('translations.' . $lang->code . '.slug', @$translation->slug) }}"
                                                    required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>@lang('Text Price')</label>
                                        <input type="text" class="form-control"
                                            name="translations[{{ $lang->code }}][text_price]"
                                            value="{{ old('translations.' . $lang->code . '.text_price', @$translation->text_price) }}">
                                    </div>

                                    <div class="form-group">
                                        <label>@lang('Short Description')</label>
                                        <textarea class="form-control" name="translations[{{ $lang->code }}][short_description]">{{ old('translations.' . $lang->code . '.short_description', @$translation->short_description) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Content')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ old('translations.' . $lang->code . '.content', @$translation->content) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Price Content (Special Offer)')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][price_content]">{{ old('translations.' . $lang->code . '.price_content', @$translation->price_content) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Terms & Condition')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][terms_content]">{{ old('translations.' . $lang->code . '.terms_content', @$translation->terms_content) }}</textarea>
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
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.special.offer.index') }}" />
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
        })(jQuery);
    </script>
@endpush
