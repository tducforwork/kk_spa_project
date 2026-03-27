@extends('admin.layouts.app')
@section('panel')
    <form action="{{ route('admin.special.offer.store', $offer->id) }}" method="POST" enctype="multipart/form-data">
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
                            <x-image-uploader :imagePath="getImage($offer->image ? getFilePath('special_offer') . '/' . $offer->image : null, getFileSize('special_offer'))" :size="getFileSize('special_offer')" class="w-100" id="imageInput" :required="false" name="image_input" />
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery Introduction') (@lang('Mới'))</label>
                            <input type="file" name="intro_gallery[]" class="form-control" multiple
                                accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="form-group">
                            <label>@lang('Hotline')</label>
                            <input type="text" class="form-control" name="hotline" value="{{ old('hotline', $offer->hotline) }}">
                        </div>
                        <div class="form-group">
                            <label>@lang('Email')</label>
                            <input type="email" class="form-control" name="email" value="{{ old('email', $offer->email) }}">
                        </div>
                        <div class="form-group">
                            <label>@lang('Sort Order')</label>
                            <input type="number" class="form-control" name="sort_order"
                                value="{{ old('sort_order', $offer->sort_order ?? 0) }}" min="0">
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery')</label>
                            <input type="file" name="gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                        </div>
                    </div>
                </div>

                @if($offer->introImages->count() > 0)
                    <div class="card mb-3">
                        <div class="card-header bg--primary">
                            <h5 class="card-title text-white">@lang('Existing Introduction Gallery')</h5>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                @foreach($offer->introImages as $img)
                                    <div class="col-md-3">
                                        <div class="position-relative">
                                            <img src="{{ getImage(getFilePath('special_offer') . '/' . $img->image) }}" class="w-100 rounded shadow">
                                            <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0 m-1 remove-image" data-action="{{ route('admin.special.offer.image.remove', $img->id) }}">
                                                <i class="las la-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif

                @if($offer->mainImages->count() > 0)
                    <div class="card">
                        <div class="card-header bg--primary">
                            <h5 class="card-title text-white">@lang('Existing Gallery')</h5>
                        </div>
                        <div class="card-body">
                            <div class="row g-3">
                                @foreach($offer->mainImages as $img)
                                    <div class="col-md-3">
                                        <div class="position-relative">
                                            <img src="{{ getImage(getFilePath('special_offer') . '/' . $img->image) }}" class="w-100 rounded shadow">
                                            <button type="button" class="btn btn-danger btn-sm position-absolute top-0 end-0 m-1 remove-image" data-action="{{ route('admin.special.offer.image.remove', $img->id) }}">
                                                <i class="las la-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                @endif
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
                                @php $translation = $offer->translations->where('lang_code', $lang->code)->first(); @endphp
                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Name')</label>
                                                <input type="text" class="form-control name-input" name="translations[{{ $lang->code }}][name]" data-lang="{{ $lang->code }}" value="{{ old('translations.'.$lang->code.'.name', @$translation->name ?: ($lang->code == 'en' ? @$offer->name : '')) }}" required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Slug')</label>
                                                <input type="text" class="form-control slug-input" name="translations[{{ $lang->code }}][slug]" data-lang="{{ $lang->code }}" value="{{ old('translations.'.$lang->code.'.slug', @$translation->slug ?: ($lang->code == 'en' ? @$offer->slug : '')) }}" required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>@lang('Text Price')</label>
                                        <input type="text" class="form-control" name="translations[{{ $lang->code }}][text_price]" value="{{ old('translations.'.$lang->code.'.text_price', @$translation->text_price) }}">
                                    </div>

                                    <div class="form-group">
                                        <label>@lang('Short Description')</label>
                                        <textarea class="form-control" name="translations[{{ $lang->code }}][short_description]">{{ old('translations.'.$lang->code.'.short_description', @$translation->short_description ?: ($lang->code == 'en' ? @$offer->short_description : '')) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Content')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ old('translations.'.$lang->code.'.content', @$translation->content ?: ($lang->code == 'en' ? @$offer->content : '')) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Price Content (Special Offer)')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][price_content]">{{ old('translations.'.$lang->code.'.price_content', @$translation->price_content ?: ($lang->code == 'en' ? @$offer->price_content : '')) }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Terms & Condition')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][terms_content]">{{ old('translations.'.$lang->code.'.terms_content', @$translation->terms_content ?: ($lang->code == 'en' ? @$offer->terms_content : '')) }}</textarea>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Update')</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <x-confirmation-modal />
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

            $('.remove-image').on('click', function() {
                var modal = $('#confirmationModal');
                modal.find('form').attr('action', $(this).data('action'));
                modal.find('.question').text("@lang('Are you sure to remove this image?')");
                modal.modal('show');
            });
        })(jQuery);
    </script>
@endpush
