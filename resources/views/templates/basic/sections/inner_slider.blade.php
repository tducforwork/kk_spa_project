@php
    $currentSlug = request()->segment(1) ?: 'home';
    $lang = app()->getLocale();
    $slides = getContent('inner_slider.element')->where('data_values.page_slug_' . $lang, $currentSlug);

    // If no specific slides found for this slug, we can show a default one (e.g. home) or just use the first element
    if ($slides->count() == 0) {
        $slides = getContent('inner_slider.element')->where('data_values.page_slug_' . $lang, 'home');
        
        // Final fallback if even home has no slides (unlikely)
        if ($slides->count() == 0) {
            $slides = getContent('inner_slider.element');
        }
    }
@endphp

<section class="inner-hero-section">
    <div class="swiper inner-hero-swiper">
        <div class="swiper-wrapper">
            @foreach ($slides as $item)
                <div class="swiper-slide">
                    <div class="inner-hero-item bg_img"
                        data-background="{{ frontendImage('inner_slider', @$item->data_values->image, '1920x600') }}"
                        style="background-image: url('{{ frontendImage('inner_slider', @$item->data_values->image, '1920x600') }}');">
                    </div>
                </div>
            @endforeach
        </div>
        @if ($slides->count() > 1)
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
                loop: {{ $slides->count() > 1 ? 'true' : 'false' }},
                speed: 1000,
                // autoplay: {
                //     delay: 5000,
                //     disableOnInteraction: false,
                // },
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
