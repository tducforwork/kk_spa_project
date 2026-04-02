@php
    $facilitiesContent = getContent('facilities.content', true);
    $facilities = \App\Models\Facility::where('status', 1)
        ->with('translations')
        ->orderBy('sort_order', 'asc')
        ->orderBy('id', 'desc')
        ->get();
    $bgImage = @$facilitiesContent->data_values->background_image;
@endphp

<section id="facilities"
    style="background-image: url('{{ frontendImage('facilities', @$facilitiesContent->data_values->background_image) }}');">
    <div class="facilities-container container p-0">
        <h2 class="facilities-title">{{ __(@$facilitiesContent->data_values->{'heading_' . app()->getLocale()}) }}</h2>

        <div class="facilities-slider-wrap">
            <div class="facilities-center-frame"></div>
            <div class="facilities-slider swiper">
                <div class="swiper-wrapper">
                    @foreach ($facilities->concat($facilities)->concat($facilities) as $facility)
                        <div class="swiper-slide">
                            <div class="facility-image-wrap">
                                <img src="{{ getImage(getFilePath('facility') . '/' . $facility->image, getFileSize('facility')) }}"
                                    alt="{{ __($facility->t->name) }}" class="facility-image" loading="lazy"
                                    decoding="async">

                                <div class="facility-name-static">{{ __($facility->t->name) }}</div>

                                <div class="facility-overlay">
                                    <h3 class="facility-name">{{ __($facility->t->name) }}</h3>
                                    <a href="{{ $facility->t->slug }}" class="btn-more-info">{{ __('More info') }}</a>
                                </div>
                            </div>
                        </div>
                    @endforeach

                </div>
            </div>
        </div>

        {{-- <div class="facilities-explore-btn-wrap">
            <a href="#" class="btn-explore-main">
                <span class="main-text">{{ __('EXPLORE') }}</span>

            </a>
        </div> --}}
    </div>
</section>

@push('script')
    <script>
        'use strict';
        (function($) {
            var swiper = new Swiper(".facilities-slider", {
                slidesPerView: 1.5,
                centeredSlides: true,
                spaceBetween: 24,
                loop: true,
                speed: 800,
                grabCursor: true,
                watchSlidesProgress: true,
                breakpoints: {
                    576: {
                        slidesPerView: 2,
                        spaceBetween: 24,
                    },
                    768: {
                        slidesPerView: 3,
                        spaceBetween: 24,
                    },
                    1200: {
                        slidesPerView: 5,
                        spaceBetween: 0,
                    }
                }
            });
        })(jQuery);
    </script>
@endpush
