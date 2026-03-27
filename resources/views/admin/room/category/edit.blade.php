@extends('admin.layouts.app')
@section('panel')
    <div class="row">
        <div class="col-lg-12">
            <div class="card">
                <form action="{{ route('admin.room.category.store', $category->id) }}" method="POST" enctype="multipart/form-data">
                    @csrf
                    <div class="card-body">
                        <div class="row">
                            <div class="form-group col-md-4">
                                <label>@lang('Image')</label>
                                <x-image-uploader :imagePath="getImage(getFilePath('room_category') . '/' . $category->image, getFileSize('room_category'))" :size="getFileSize('room_category')" class="w-100" id="imageInput" name="image_input" :required="false" />
                            </div>
                            <div class="col-md-8">
                                <div class="form-group">
                                    <label>@lang('Parent Category')</label>
                                    <select name="parent_id" class="form-control">
                                        <option value="0">@lang('None')</option>
                                        @php echo $options; @endphp
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>@lang('Order')</label>
                                    <input type="number" class="form-control" name="order" value="{{ $category->order }}">
                                </div>
                            </div>
                        </div>

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
                                            $translation = $category->translations->where('lang_code', $lang->code)->first();
                                        @endphp
                                        <div class="tab-pane fade {{ $loop->first ? 'show active' : '' }}" id="{{ $lang->code }}" role="tabpanel" aria-labelledby="{{ $lang->code }}-tab">
                                            <div class="form-group">
                                                <label class="required">@lang('Name') ({{ strtoupper($lang->code) }})</label>
                                                <input type="text" class="form-control name-input" name="translations[{{ $lang->code }}][name]" value="{{ $translation->name ?? '' }}" data-lang="{{ $lang->code }}" required>
                                            </div>
                                            <div class="form-group">
                                                <label class="required">@lang('Slug') ({{ strtoupper($lang->code) }})</label>
                                                <input type="text" class="form-control slug-input" name="translations[{{ $lang->code }}][slug]" value="{{ $translation->slug ?? '' }}" data-lang="{{ $lang->code }}" required>
                                            </div>
                                            <div class="form-group">
                                                <label>@lang('Description')</label>
                                                <textarea class="form-control" name="translations[{{ $lang->code }}][description]">{{ $translation->description ?? '' }}</textarea>
                                            </div>
                                        </div>
                                    @endforeach
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
    <x-back route="{{ route('admin.room.category.index') }}" />
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
