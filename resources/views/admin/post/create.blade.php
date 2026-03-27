@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <form action="{{ route('admin.post.store', @$post->id ?? 0) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>@lang('Image')</label>
                                    <x-image-uploader :imagePath="getImage(@$post->image ? getFilePath('post') . '/' . $post->image : null, getFileSize('post'))" :size="getFileSize('post')" class="w-100" id="imageInput" :required="isset($post) ? false : true" name="image_input" />
                                </div>
                                {{-- <div class="form-group">
                                    <label>@lang('Category')</label>
                                    <select name="category_id" class="form-control">
                                        <option value="">@lang('Select One')</option>
                                        @foreach($categories as $category)
                                            <option value="{{ $category->id }}" @selected(@$post->category_id == $category->id)>{{ __($category->t->name) }}</option>
                                        @endforeach
                                    </select>
                                </div> --}}
                                <div class="form-group">
                                    <label>@lang('Is Hot')</label>
                                    <select name="is_hot" class="form-control" required>
                                        <option value="0" @selected(@$post->is_hot == 0)>@lang('No')</option>
                                        <option value="1" @selected(@$post->is_hot == 1)>@lang('Yes')</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Sort Order')</label>
                                    <input type="number" class="form-control" name="sort_order"
                                        value="{{ old('sort_order', @$post->sort_order ?? 0) }}" min="0">
                                </div>
                                <div class="form-group">
                                    <label>@lang('Gallery')</label>
                                    <input type="file" name="gallery[]" class="form-control" multiple accept=".png, .jpg, .jpeg">
                                    <small class="text-facebook">@lang('You can upload multiple images')</small>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="card mt-3">
                                    <div class="card-header bg--dark">
                                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                                            @foreach($languages as $lang)
                                                <li class="nav-item">
                                                    <a class="nav-link {{ $loop->first ? 'active' : '' }}" id="{{ $lang->code }}-tab" data-bs-toggle="tab" href="#{{ $lang->code }}" role="tab" aria-controls="{{ $lang->code }}" aria-selected="{{ $loop->first ? 'true' : 'false' }}">
                                                        {{ __($lang->name) }}
                                                    </a>
                                                </li>
                                            @endforeach
                                        </ul>
                                    </div>
                                    <div class="card-body">
                                        <div class="tab-content" id="myTabContent">
                                            @foreach($languages as $lang)
                                                @php
                                                    $translation = @$post ? $post->translations->where('lang_code', $lang->code)->first() : null;
                                                @endphp
                                                <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel" aria-labelledby="{{ $lang->code }}-tab">
                                                    <div class="form-group">
                                                        <label class="required">@lang('Title') ({{ strtoupper($lang->code) }})</label>
                                                        <input type="text" class="form-control name-input" name="translations[{{ $lang->code }}][name]" data-lang="{{ $lang->code }}" value="{{ @$translation->name }}" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="required">@lang('Slug') ({{ strtoupper($lang->code) }})</label>
                                                        <input type="text" class="form-control slug-input" name="translations[{{ $lang->code }}][slug]" data-lang="{{ $lang->code }}" value="{{ @$translation->slug }}" required>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>@lang('Short Description')</label>
                                                        <textarea class="form-control" name="translations[{{ $lang->code }}][description]">{{ @$translation->description }}</textarea>
                                                    </div>
                                                    <div class="form-group">
                                                        <label>@lang('Content')</label>
                                                        <textarea class="form-control nicEdit" name="translations[{{ $lang->code }}][content]">{{ @$translation->content }}</textarea>
                                                    </div>

                                                    <x-toc-repeater :lang="$lang->code" :items="@$translation->toc" />
                                                    
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
                    </div>
                    <div class="card-footer">
                        <button type="submit" class="btn btn--primary w-100 h-45">@lang('Submit')</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <x-back route="{{ route('admin.post.index') }}" />
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
