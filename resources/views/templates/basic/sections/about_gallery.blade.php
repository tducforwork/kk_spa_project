@php
    $galleryElements = getContent('about_gallery.element', false, null, true);
@endphp

<section class="gallery-section ">
    <div class="container pb-lg-5 pb-4">
        <div class="gallery-title-wrapper text-center mb-4">
            <h2 class="section-title text-uppercase ">@lang('GALLERY')</h2>
        </div>

        <div class="row g-4 row-cols-lg-3 row-cols-md-2 row-cols-1 magnific-gallery">
            @foreach ($galleryElements as $item)
                <div class="col">
                    <div class="gallery-item-wrapper card border-0 h-100 shadow-sm overflow-hidden">
                        <a href="{{ frontendImage('about_gallery', @$item->data_values->image, '1200x900') }}"
                            title="Gallery Image" class="gallery-image-link h-100">
                            <img src="{{ frontendImage('about_gallery', @$item->data_values->image, '1200x900') }}"
                                alt="Gallery Image" class="w-100 h-100 object-fit-cover transition-img">
                            <div class="gallery-overlay">
                                <i class="fa-solid fa-expand text-white fs-2"></i>
                            </div>
                        </a>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>

@push('style')
    <style>
        .gallery-title-wrapper .section-title {
            color: #005153;
            font-weight: 700;
            letter-spacing: 2px;
            position: relative;
        }

        .gallery-item-wrapper {
            border-radius: 8px;
            transition: transform 0.3s;
            aspect-ratio: 4/3;
        }

        .gallery-item-wrapper .gallery-image-link {
            position: relative;
            display: block;
        }

        .transition-img {
            transition: transform 0.5s;
        }

        .gallery-item-wrapper:hover .transition-img {
            transform: scale(1.1);
        }
    </style>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";
            $('.magnific-gallery').magnificPopup({
                delegate: 'a',
                type: 'image',
                gallery: {
                    enabled: true
                },
                mainClass: 'mfp-with-zoom',
                zoom: {
                    enabled: true,
                    duration: 300,
                    easing: 'ease-in-out'
                }
            });
        })(jQuery);
    </script>
@endpush
