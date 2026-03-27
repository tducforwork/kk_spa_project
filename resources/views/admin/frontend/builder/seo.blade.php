@extends('admin.layouts.app')

@section('panel')
    <div class="row">
        <div class="col-md-12 mb-30">
            <div class="card bl--5 border--warning">
                <div class="card-body">
                    <p class="text--warning">@lang('The SEO setting is optional for this page. If you don\'t configure SEO here, the global SEO contents will work for this page, which you can configure from') <a href="{{ route('admin.seo') }}">@lang('System Setting > SEO Configuration').</a></p>
                </div>
            </div>
        </div>
        <div class="col-lg-12">
            <div class="card">
                <div class="card-body">
                    <form action method="POST" enctype="multipart/form-data">
                        @csrf
                        <input type="hidden" name="type" value="data">
                        <input type="hidden" name="seo_image" value="1">
                        <div class="row">
                            <div class="col-xl-4">
                                <div class="form-group">
                                    <label>@lang('SEO Image')</label>
                                    <x-image-uploader class="w-100" :imagePath="getImage(getFilePath('seo') . '/' . @$page->seo_content->image, getFileSize('seo'))" :size="getFileSize('seo')" :required="false" name="image" />

                                </div>
                            </div>

                            <div class="col-xl-8 mt-xl-0 mt-4">
                                <div class="form-group">
                                    <label>@lang('Meta Keywords')</label>
                                    <small class="ms-2 mt-2  ">@lang('Separate multiple keywords by') <code>,</code>(@lang('comma')) @lang('or') <code>@lang('enter')</code> @lang('key')</small>
                                    <select name="keywords[]" class="form-control select2-auto-tokenize" multiple="multiple">
                                        @if (@$page->seo_content->keywords)
                                            @foreach ($page->seo_content->keywords as $option)
                                                <option value="{{ $option }}" selected>{{ __($option) }}</option>
                                            @endforeach
                                        @endif
                                    </select>
                                </div>

                                <div class="card mb-3">
                                    <div class="card-header bg--dark">
                                        <ul class="nav nav-tabs card-header-tabs" id="seoTab" role="tablist">
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
                                        <div class="tab-content" id="seoTabContent">
                                            @foreach($languages as $lang)
                                                @php
                                                    $translation = $page->translations->where('lang_code', $lang->code)->first();
                                                    $seoContent = @$translation->seo_content;
                                                @endphp
                                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel">
                                                    <div class="form-group">
                                                        <label>@lang('Social Title') ({{ strtoupper($lang->code) }})</label>
                                                        <input type="text" class="form-control" name="translations[{{ $lang->code }}][title]" value="{{ @$translation->title }}" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label>@lang('Meta Description') ({{ strtoupper($lang->code) }})</label>
                                                        <textarea name="translations[{{ $lang->code }}][description]" rows="3" class="form-control">{{ @$seoContent->description }}</textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>@lang('SEO Keywords') ({{ strtoupper($lang->code) }})</label>
                                                        <input type="text" class="form-control" name="translations[{{ $lang->code }}][keywords]" value="{{ @$seoContent->keywords }}" placeholder="@lang('Separate by comma')">
                                                    </div>
                                                </div>
                                            @endforeach
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label>@lang('Meta Robots') <small>(@lang('optional'))</small></label>
                                    <input type="text" class="form-control" name="meta_robots" value="{{ isset($page->seo_content->meta_robots) ? $page->seo_content->meta_robots : '' }}" placeholder="e.g. noindex, follow">
                                </div>

                                <div class="card bg--light mb-3">
                                    <div class="card-header">@lang('Default SEO (Fallback)')</div>
                                    <div class="card-body">
                                        <div class="form-group">
                                            <label>@lang('Meta Description')</label>
                                            <textarea name="description" rows="3" class="form-control">{{ isset($page->seo_content->description) ? $page->seo_content->description : '' }}</textarea>
                                        </div>
                                        <div class="form-group">
                                            <label>@lang('Social Title')</label>
                                            <input type="text" class="form-control" name="social_title" value="{{ @$page->seo_content->social_title }}" />
                                        </div>
                                        <div class="form-group">
                                            <label>@lang('Social Description')</label>
                                            <textarea name="social_description" rows="3" class="form-control">{{ @$page->seo_content->social_description }}</textarea>
                                        </div>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
