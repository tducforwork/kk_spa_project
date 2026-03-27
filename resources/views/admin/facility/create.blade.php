@extends('admin.layouts.app')
@section('panel')
    <form action="{{ route('admin.facility.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        <div class="row">
            <div class="col-lg-4">
                <div class="card mb-4">
                    <div class="card-header bg--primary">
                        <h5 class="card-title text-white">@lang('Main Information')</h5>
                    </div>
                    <div class="card-body">
                        <div class="form-group">
                            <label>@lang('Avatar Image')</label>
                            <x-image-uploader :imagePath="getImage(null, getFileSize('facility'))" :size="getFileSize('facility')" class="w-100" id="imageInput"
                                :required="true" name="image_input" />
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery Introduction')</label>
                            <input type="file" name="intro_gallery[]" class="form-control" multiple
                                accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="form-group">
                            <label>@lang('Gallery')</label>
                            <input type="file" name="gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="form-group">
                            <label>@lang('Status')</label>
                            <input type="checkbox" name="status" data-width="100%" data-onstyle="-success"
                                data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Active')"
                                data-off="@lang('Inactive')" checked>
                        </div>
                        <div class="form-group">
                            <label>@lang('Sort Order')</label>
                            <input type="number" class="form-control" name="sort_order"
                                value="{{ old('sort_order', @$facility->sort_order ?? 0) }}" min="0">
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
                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}"
                                    role="tabpanel">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Name')</label>
                                                <input type="text" class="form-control name-input"
                                                    name="translations[{{ $lang->code }}][name]"
                                                    data-lang="{{ $lang->code }}"
                                                    value="{{ old('translations.' . $lang->code . '.name') }}"
                                                    required>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-group">
                                                <label class="required">@lang('Slug')</label>
                                                <input type="text" class="form-control slug-input"
                                                    name="translations[{{ $lang->code }}][slug]"
                                                    data-lang="{{ $lang->code }}"
                                                    value="{{ old('translations.' . $lang->code . '.slug') }}"
                                                    required>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label>@lang('Description')</label>
                                        <textarea class="form-control" name="translations[{{ $lang->code }}][description]">{{ old('translations.' . $lang->code . '.description') }}</textarea>
                                    </div>
                                    <div class="form-group">
                                        <label>@lang('Content')</label>
                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ old('translations.' . $lang->code . '.content') }}</textarea>
                                    </div>

                                    <x-repeater :lang="$lang->code" :items="[]" />

                                    <div class="card bg--light mb-3">
                                        <div class="card-header">@lang('SEO Management')</div>
                                        <div class="card-body">
                                            <div class="form-group">
                                                <label>@lang('SEO Title')</label>
                                                <input type="text" class="form-control"
                                                    name="translations[{{ $lang->code }}][seo_title]"
                                                    value="{{ old('translations.' . $lang->code . '.seo_title') }}">
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('SEO Description')</label>
                                                <textarea class="form-control" name="translations[{{ $lang->code }}][seo_description]">{{ old('translations.' . $lang->code . '.seo_description') }}</textarea>
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('SEO Keywords')</label>
                                                <input type="text" class="form-control"
                                                    name="translations[{{ $lang->code }}][seo_keywords]"
                                                    value="{{ old('translations.' . $lang->code . '.seo_keywords') }}">
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
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.facility.index') }}" />
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
