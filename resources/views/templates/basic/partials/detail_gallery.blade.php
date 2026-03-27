@php
    $galleryImages = $item->images ?? collect([]);
    // If no specific gallery images, maybe fallback or show nothing
    // User wants images with type 1 but some models might not have 'type' in their images table
    // Assuming we use all images from the 'images' relationship for now or filter by type 1 if column exists
@endphp

<section class="inner-hero-section">
    <div class="swiper inner-hero-swiper">
        <div class="swiper-wrapper">
            @if($galleryImages->count() > 0)
                @foreach ($galleryImages as $img)
                    <div class="swiper-slide">
                        <div class="inner-hero-item bg_img"
                            data-background="{{ getImage(getFilePath($image_folder) . '/' . $img->image, '1920x600') }}"
                            style="background-image: url('{{ getImage(getFilePath($image_folder) . '/' . $img->image, '1920x600') }}');">
                        </div>
                    </div>
                @endforeach
            @else
                {{-- Fallback if no gallery images, show the main image of the item --}}
                <div class="swiper-slide">
                    <div class="inner-hero-item bg_img"
                        data-background="{{ getImage(getFilePath($image_folder) . '/' . $item->image, '1920x600') }}"
                        style="background-image: url('{{ getImage(getFilePath($image_folder) . '/' . $item->image, '1920x600') }}');">
                    </div>
                </div>
            @endif
        </div>
        @if ($galleryImages->count() > 1)
            <div class="swiper-pagination"></div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        @endif
    </div>
</section>

@push('script')
    <script>
        (function($) {
            "use strict";
            var innerSwiper = new Swiper('.inner-hero-swiper', {
                loop: {{ $galleryImages->count() > 1 ? 'true' : 'false' }},
                speed: 1000,
                pagination: {
                    el: '.swiper-pagination',
                    clickable: true,
                },
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
                },
            });
        })(jQuery);
    </script>
@endpush
