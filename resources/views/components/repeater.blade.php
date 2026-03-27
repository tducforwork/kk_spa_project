@props(['items' => [], 'name' => 'additional_info', 'lang' => 'en'])

<div class="repeater-container card mb-3" data-lang="{{ $lang }}">
    <div class="card-header bg--secondary d-flex justify-content-between align-items-center py-2">
        <h6 class="text-white mb-0" style="font-size: 0.9rem;">@lang('Room Specification / Amenities')</h6>
        <button type="button" class="btn btn-sm btn-outline-light add-repeater-item">
            <i class="la la-plus"></i> Add Item
        </button>
    </div>
    <div class="card-body p-3">
        <div class="repeater-items">
            @if ($items)
                @foreach ($items as $index => $item)
                    <div class="repeater-item mb-2">
                        <div class="d-flex align-items-center gap-2 bg--white p-2 rounded border shadow-sm">
                            <!-- Icon Upload Section -->
                            <div class="repeater-icon-wrapper flex-shrink-0">
                                <div class="image-upload-preview"
                                    style="background-image: url({{ getImage(getFilePath('room_icon') . '/' . @$item['icon']) }})">
                                    <button type="button" class="remove-image" title="@lang('Remove Icon')"><i
                                            class="fa fa-times"></i></button>
                                    <label for="icon_{{ $lang }}_{{ $index }}" class="upload-label"
                                        title="@lang('Upload Icon')"><i class="la la-cloud-upload"></i></label>
                                </div>
                                <input type="file" class="image-upload-input d-none"
                                    name="translations[{{ $lang }}][{{ $name }}][{{ $index }}][icon_file]"
                                    id="icon_{{ $lang }}_{{ $index }}" accept=".png, .jpg, .jpeg">
                                <input type="hidden"
                                    name="translations[{{ $lang }}][{{ $name }}][{{ $index }}][icon]"
                                    value="{{ @$item['icon'] }}">
                            </div>

                            <!-- Text Input Section -->
                            <div class="flex-grow-1">
                                <input type="text" class="form-control form-control-sm border-0 bg-light"
                                    name="translations[{{ $lang }}][{{ $name }}][{{ $index }}][text]"
                                    value="{{ @$item['text'] }}" placeholder="@lang('Text (e.g. 4 pax)')" required
                                    style="font-size: 0.85rem; color: #000 !important;">
                            </div>

                            <!-- Action Section -->
                            <div class="repeater-action flex-shrink-0">
                                <button type="button" class="btn btn-link text-danger p-1 remove-repeater-item"
                                    title="@lang('Remove Item')"><i class="la la-trash-alt"
                                        style="font-size: 1.2rem; color: #ea5455 !important   ;"></i></button>
                            </div>
                        </div>
                    </div>
                @endforeach
            @endif
        </div>
    </div>
</div>

@pushOnce('style')
    <style>
        .repeater-item .image-upload-preview {
            width: 38px;
            height: 38px;
            border-radius: 4px;
            background-size: contain;
            background-repeat: no-repeat;
            background-position: center;
            background-color: #f8f9fa;
            border: 1px dashed #dee2e6;
            position: relative;
        }

        .repeater-item .image-upload-preview .remove-image {
            position: absolute;
            top: -6px;
            right: -6px;
            background: #ea5455;
            color: #fff;
            border-radius: 50%;
            width: 14px;
            height: 14px;
            line-height: 14px;
            font-size: 7px;
            border: none;
            display: none;
            padding: 0;
            z-index: 2;
        }

        .repeater-item .image-upload-preview:hover .remove-image {
            display: block;
        }

        .repeater-item .image-upload-preview .upload-label {
            position: absolute;
            bottom: -4px;
            right: -4px;
            background: #4634ff;
            color: #fff;
            width: 16px;
            height: 16px;
            border-radius: 50%;
            font-size: 9px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            margin-bottom: 0;
            z-index: 1;
        }

        .repeater-item .gap-2 {
            gap: 0.5rem !important;
        }

        .repeater-item .bg--white {
            background-color: #fff !important;
        }
    </style>
@endpushOnce

@pushOnce('script')
    <script>
        (function($) {
            "use strict";

            $(document).on('click', '.add-repeater-item', function() {
                let container = $(this).closest('.repeater-container');
                let lang = container.data('lang');
                let name = "{{ $name }}";
                let uniqueId = Date.now() + Math.floor(Math.random() * 100);

                let html = `
                <div class="repeater-item mb-2">
                    <div class="d-flex align-items-center gap-2 bg--white p-2 rounded border shadow-sm">
                        <div class="repeater-icon-wrapper flex-shrink-0">
                            <div class="image-upload-preview" style="background-image: url({{ getImage('/') }})">
                                 <button type="button" class="remove-image" title="@lang('Remove')"><i class="fa fa-times"></i></button>
                                 <label for="icon_${lang}_${uniqueId}" class="upload-label" title="@lang('Upload')"><i class="la la-cloud-upload"></i></label>
                            </div>
                            <input type="file" class="image-upload-input d-none" name="translations[${lang}][${name}][${uniqueId}][icon_file]" id="icon_${lang}_${uniqueId}" accept=".png, .jpg, .jpeg">
                        </div>
                        <div class="flex-grow-1">
                            <input type="text" class="form-control form-control-sm border-0 bg-light" name="translations[${lang}][${name}][${uniqueId}][text]" placeholder="@lang('Text (e.g. 4 pax)')" required style="font-size: 0.85rem;">
                        </div>
                        <div class="repeater-action flex-shrink-0">
                            <button type="button" class="btn btn-link text-danger p-1 remove-repeater-item" title="@lang('Remove')"><i class="la la-trash-alt" style="font-size: 1.2rem;"></i></button>
                        </div>
                    </div>
                </div>
            `;
                container.find('.repeater-items').append(html);
            });

            $(document).on('click', '.remove-repeater-item', function() {
                $(this).closest('.repeater-item').remove();
            });

            $(document).on('change', '.image-upload-input', function() {
                let input = this;
                if (input.files && input.files[0]) {
                    let reader = new FileReader();
                    let preview = $(input).closest('.repeater-icon-wrapper').find('.image-upload-preview');
                    reader.onload = function(e) {
                        preview.css('background-image', 'url(' + e.target.result + ')');
                    }
                    reader.readAsDataURL(input.files[0]);
                }
            });

            $(document).on('click', '.remove-image', function(e) {
                e.preventDefault();
                let wrapper = $(this).closest('.repeater-icon-wrapper');
                wrapper.find('.image-upload-preview').css('background-image', 'url({{ getImage('/') }})');
                wrapper.find('.image-upload-input').val('');
                wrapper.find('input[type="hidden"]').val('');
            });

        })
        (jQuery);
    </script>
@endpushOnce
