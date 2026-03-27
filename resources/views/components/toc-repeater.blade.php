@props(['items' => [], 'name' => 'toc', 'lang' => 'en'])

<div class="toc-repeater-container card mb-3" data-lang="{{ $lang }}">
    <div class="card-header bg--primary d-flex justify-content-between align-items-center py-2">
        <h6 class="text-white mb-0" style="font-size: 0.9rem;">
            <i class="las la-list-ol"></i> @lang('Table of Contents (Mục lục)')
        </h6>
        <button type="button" class="btn btn-sm btn-outline-light add-toc-item">
            <i class="la la-plus"></i> @lang('Thêm mục')
        </button>
    </div>
    <div class="card-body p-3">
        <div class="alert alert-info mb-3">
            <p class="mb-0" style="font-size: 0.85rem;">
                <i class="las la-info-circle"></i> <strong>Hướng dẫn:</strong><br>
                1. Nhập <strong>Tiêu đề</strong> mục lục.<br>
                2. Nhập <strong>Target ID</strong> (mã neo - ví dụ: <code>phan-1</code>).<br>
                3. Trong trình soạn thảo văn bản, chọn tiêu đề tương ứng, nhấn nút <strong>ID</strong> (nếu có) hoặc chuyển sang chế độ <strong>Source</strong> và thêm <code>id="phan-1"</code> vào thẻ (ví dụ: <code>&lt;h2 id="phan-1"&gt;Tiêu đề&lt;/h2&gt;</code>).
            </p>
        </div>
        <div class="toc-items">
            @if ($items)
                @foreach ($items as $index => $item)
                    <div class="toc-item mb-2">
                        <div class="d-flex align-items-center gap-2 bg--white p-2 rounded border shadow-sm">
                            <div class="flex-grow-1">
                                <input type="text" class="form-control form-control-sm border-0 bg-light mb-1"
                                    name="translations[{{ $lang }}][{{ $name }}][{{ $index }}][title]"
                                    value="{{ @$item['title'] }}" placeholder="@lang('Tiêu đề mục lục (vd: 1. Giới thiệu)')" required
                                    style="font-size: 0.85rem; color: #000 !important;">
                                <input type="text" class="form-control form-control-sm border-0 bg-soft-primary"
                                    name="translations[{{ $lang }}][{{ $name }}][{{ $index }}][target_id]"
                                    value="{{ @$item['target_id'] }}" placeholder="@lang('Target ID (vd: gioi-thieu)')" required
                                    style="font-size: 0.8rem; color: #4634ff !important;">
                            </div>

                            <div class="repeater-action flex-shrink-0">
                                <button type="button" class="btn btn-link text-danger p-1 remove-toc-item"
                                    title="@lang('Xóa mục')"><i class="la la-trash-alt"
                                        style="font-size: 1.2rem; color: #ea5455 !important;"></i></button>
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
        .bg-soft-primary {
            background-color: #f0f1ff !important;
        }
        .toc-item .gap-2 {
            gap: 0.5rem !important;
        }
    </style>
@endpushOnce

@pushOnce('script')
    <script>
        (function($) {
            "use strict";

            $(document).on('click', '.add-toc-item', function() {
                let container = $(this).closest('.toc-repeater-container');
                let lang = container.data('lang');
                let name = "{{ $name }}";
                let uniqueId = Date.now() + Math.floor(Math.random() * 100);

                let html = `
                <div class="toc-item mb-2">
                    <div class="d-flex align-items-center gap-2 bg--white p-2 rounded border shadow-sm">
                        <div class="flex-grow-1">
                            <input type="text" class="form-control form-control-sm border-0 bg-light mb-1" 
                                name="translations[${lang}][${name}][${uniqueId}][title]" 
                                placeholder="@lang('Tiêu đề mục lục')" required style="font-size: 0.85rem;">
                            <input type="text" class="form-control form-control-sm border-0 bg-soft-primary" 
                                name="translations[${lang}][${name}][${uniqueId}][target_id]" 
                                placeholder="@lang('Target ID (vd: phan-1)')" required style="font-size: 0.8rem;">
                        </div>
                        <div class="repeater-action flex-shrink-0">
                            <button type="button" class="btn btn-link text-danger p-1 remove-toc-item" title="@lang('Xóa')"><i class="la la-trash-alt" style="font-size: 1.2rem;"></i></button>
                        </div>
                    </div>
                </div>
            `;
                container.find('.toc-items').append(html);
            });

            $(document).on('click', '.remove-toc-item', function() {
                $(this).closest('.toc-item').remove();
            });

        })(jQuery);
    </script>
@endpushOnce
