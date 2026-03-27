@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card">
                <div class="card-body">
                    <form action="{{ route('admin.frontend.sections.content', $key) }}" class="disableSubmission" method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="type" value="element">
                        @if (@$data)
                            <input type="hidden" name="id" value="{{ $data->id }}">
                        @endif
                        <div class="row">
                            @php
                                $imgCount = 0;
                            @endphp
                            @foreach ($section->element as $k => $content)
                                @if ($k == 'images')
                                    @php
                                        $imgCount = collect($content)->count();
                                    @endphp
                                    @foreach ($content as $imgKey => $image)
                                        <div class="col-md-4">
                                            <input type="hidden" name="has_image[]" value="1">
                                            <div class="form-group">
                                                <label>{{ __(keyToTitle($imgKey)) }}</label>
                                                <x-image-uploader class="w-100" :imagePath="frontendImage($key,@$data->data_values->$imgKey,$section->element->images->$imgKey->size)" name="image_input[{{ @$imgKey }}]" id="image-upload-input{{ $loop->index }}" :size="$section->element->images->$imgKey->size" :required="false" />

                                            </div>
                                        </div>
                                    @endforeach
                                    <div class="@if ($imgCount > 1) col-md-12 @else col-md-8 @endif">
                                        @push('divend')
                                        </div>
                                    @endpush
                                @endif
                                @if ($k != 'images')
                                    @php
                                        $isI18n = true;
                                        $fieldType = $content;
                                        if (is_object($content) || is_array($content)) {
                                            $content = (object) $content;
                                            $isI18n = isset($content->i18n) ? $content->i18n : true;
                                            $fieldType = $content->type;
                                        }
                                    @endphp

                                    @if ($fieldType == 'icon')
                                        <div class="form-group">
                                            <label>{{ keyToTitle($k) }}</label>
                                            <div class="input-group">
                                                <input type="text" class="form-control iconPicker icon"
                                                    autocomplete="off" name="{{ $k }}"
                                                    value="{{ old($k, @$data->data_values->$k) }}" required>
                                                <span class="input-group-text  input-group-addon"
                                                    data-icon="las la-home" role="iconpicker"></span>
                                            </div>
                                        </div>
                                    @elseif ($fieldType == 'textarea' || $fieldType == 'textarea-nic')
                                        <div class="col-md-12">
                                            <div class="card border--primary mt-3">
                                                <div class="card-header bg--primary">
                                                    <h5 class="text-white">{{ __(keyToTitle($k)) }}</h5>
                                                </div>
                                                <div class="card-body">
                                                    @if ($isI18n)
                                                        @foreach ($languages as $lang)
                                                            <div class="form-group">
                                                                <label>{{ __(keyToTitle($k)) }} - {{ __($lang->name) }}</label>
                                                                <textarea rows="10" class="form-control @if ($fieldType == 'textarea-nic') nicEdit @endif"
                                                                    name="{{ $k }}_{{ $lang->code }}">{{ old("{$k}_{$lang->code}", @$data->data_values->{$k . '_' . $lang->code} ?? @$data->data_values->$k) }}</textarea>
                                                            </div>
                                                        @endforeach
                                                    @else
                                                        <div class="form-group">
                                                            <label>{{ __(keyToTitle($k)) }}</label>
                                                            <textarea rows="10" class="form-control @if ($fieldType == 'textarea-nic') nicEdit @endif"
                                                                name="{{ $k }}">{{ old($k, @$data->data_values->$k) }}</textarea>
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    @elseif($k == 'select')
                                        @php
                                            $selectName = $content->name;
                                        @endphp
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <label>{{ __(keyToTitle(@$selectName)) }}</label>
                                                <select class="form-control select2"
                                                    data-minimum-results-for-search="-1" name="{{ @$selectName }}"
                                                    required>
                                                    @foreach ($content->options as $selectItemKey => $selectOption)
                                                        <option value="{{ $selectItemKey }}"
                                                            @if (@$data->data_values->$selectName == $selectItemKey) selected @endif>
                                                            {{ __($selectOption) }}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                        </div>
                                    @elseif($k == 'slug')
                                        <div class="col-md-12">
                                            <div class="form-group">
                                                <div class="d-flex justify-content-between">
                                                    <label>{{ __(keyToTitle($k)) }}</label>
                                                    <div class="slug-verification d-none"></div>
                                                </div>
                                                <input type="text" class="form-control" name="slug"
                                                    value="{{ old($k, @$data->slug) }}" required>
                                            </div>
                                        </div>
                                    @else
                                        <div class="col-md-12">
                                            <div class="card border--primary mt-3">
                                                <div class="card-header bg--primary">
                                                    <h5 class="text-white">{{ __(keyToTitle($k)) }}</h5>
                                                </div>
                                                <div class="card-body">
                                                    @if ($isI18n)
                                                        @foreach ($languages as $lang)
                                                            <div class="form-group">
                                                                <label>{{ __(keyToTitle($k)) }} - {{ __($lang->name) }}</label>
                                                                <input type="text" class="form-control"
                                                                    name="{{ $k }}_{{ $lang->code }}"
                                                                    value="{{ old("{$k}_{$lang->code}", @$data->data_values->{$k . '_' . $lang->code} ?? @$data->data_values->$k) }}"
                                                                    required>
                                                            </div>
                                                        @endforeach
                                                    @else
                                                        <div class="form-group">
                                                            <label>{{ __(keyToTitle($k)) }}</label>
                                                            <input type="text" class="form-control"
                                                                name="{{ $k }}"
                                                                value="{{ old($k, @$data->data_values->$k) }}" required>
                                                        </div>
                                                    @endif
                                                </div>
                                            </div>
                                        </div>
                                    @endif
                                @endif
                            @endforeach
                            @stack('divend')
                        </div>

                        <div class="form-group">
                            <button type="submit" class="btn btn--primary @if(@$section->element->slug && !@$data) disabled @endif w-100 h-45">@lang('Submit')</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.frontend.sections', $key) }}" />
@endpush

@push('style-lib')
    <link href="{{ asset('assets/admin/css/fontawesome-iconpicker.min.css') }}" rel="stylesheet">
@endpush

@push('script-lib')
    <script src="{{ asset('assets/admin/js/fontawesome-iconpicker.js') }}"></script>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.iconPicker').iconpicker().on('iconpickerSelected', function(e) {
                $(this).closest('.form-group').find('.iconpicker-input').val(`<i class="${e.iconpickerValue}"></i>`);
            });

            @if(@$section->element->slug)
                $('.buildSlug').on('click',function(){
                    let slugKey = '{{ @$section->element->slug }}';
                    let closestForm = $(this).closest('form');
                    let title = closestForm.find(`[name=${slugKey}]`).val();
                    closestForm.find('[name=slug]').val(title);
                    closestForm.find('[name=slug]').trigger('input');
                });



                $('[name=slug]').on('input',function(){
                    let closestForm = $(this).closest('form');
                    closestForm.find('[type=submit]').addClass('disabled')
                    let slug = $(this).val();
                    slug = slug.toLowerCase().replace(/ /g,'-').replace(/[^\w-]+/g,'');
                    $(this).val(slug);
                    if (slug) {
                        closestForm.find('.slug-verification').removeClass('d-none');
                        closestForm.find('.slug-verification').html(`
                            <small class="text--info"><i class="las la-spinner la-spin"></i> @lang('Checking')</small>
                        `);
                        $.get("{{ route('admin.frontend.sections.element.slug.check',[$key,@$data->id]) }}", {slug:slug},function(response){
                            if (!response.exists) {
                                closestForm.find('.slug-verification').html(`
                                    <small class="text--success"><i class="las la-check"></i> @lang('Available')</small>
                                `);
                                closestForm.find('[type=submit]').removeClass('disabled')
                            }
                            if (response.exists) {
                                closestForm.find('.slug-verification').html(`
                                    <small class="text--danger"><i class="las la-times"></i> @lang('Slug already exists')</small>
                                `);
                            }
                        });
                    }else{
                        closestForm.find('.slug-verification').addClass('d-none');
                    }
                })
            @endif
        })(jQuery);
    </script>
@endpush
