@php
    $accommodationContent = getContent('accommodation.content', true);
    $rooms = \App\Models\Room::where('status', 1)
        ->where('is_hot', 1)
        ->with(['translations', 'images'])
        ->orderBy('id', 'desc')
        ->get();
@endphp

<section id="accommodation" class="accommodation-section py-lg-5 py-4">
    <div class="accommodation-container container">
        <h2 class="accommodation-title home-section-title">
            {{ __(@$accommodationContent->data_values->{'heading_' . app()->getLocale()}) }}
        </h2>

        <div class="swiper slider-accommodation">
            <div class="swiper-wrapper">
                @foreach ($rooms as $room)
                    <div class="swiper-slide accommodation-slide accommodation-slide--featured">
                        <img class="accommodation-image"
                            src="{{ getImage(getFilePath('room') . '/' . $room->image, getFileSize('room')) }}"
                            alt="{{ __($room->t->name) }}" loading="lazy" decoding="async" />
                        <div class="accommodation-content">
                            <div class="accommodation-content-inner">
                                <h3 class="accommodation-slide-title">{{ __($room->t->name) }}</h3>
                                <p class="accommodation-slide-description">
                                    {{ strLimit(__($room->t->description), 150) }}
                                </p>
                            </div>
                        </div>
                        <a href="#" class="stretched-link"></a>
                    </div>
                @endforeach
            </div>

            <!-- Navigation Buttons -->
            <button class="accommodation-nav accommodation-nav--prev" aria-label="Previous room">
                <svg width="18" height="20" viewBox="0 0 18 20" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M16.8449 11.2575H3.94192L9.57901 17.6511C10.0295 18.1621 10.0295 19.0006 9.57901 19.5115C9.12851 20.0225 8.40077 20.0225 7.95026 19.5115L0.337879 10.8776C-0.112627 10.3666 -0.112627 9.54122 0.337879 9.03026L7.93871 0.383221C8.38922 -0.12774 9.11696 -0.12774 9.56746 0.383221C10.018 0.894182 10.018 1.71958 9.56746 2.23054L3.94192 8.63721H16.8449C17.4802 8.63721 18 9.22678 18 9.94737C18 10.668 17.4802 11.2575 16.8449 11.2575Z"
                        fill="white" />
                </svg>
            </button>
            <button class="accommodation-nav accommodation-nav--next" aria-label="Next room">
                <svg width="18" height="20" viewBox="0 0 18 20" fill="none"
                    xmlns="http://www.w3.org/2000/svg">
                    <path
                        d="M1.15514 8.637H14.0581L8.42099 2.24344C7.97048 1.73248 7.97048 0.893976 8.42099 0.383015C8.87149 -0.127947 9.59923 -0.127947 10.0497 0.383015L17.6621 9.01695C18.1126 9.52791 18.1126 10.3533 17.6621 10.8643L10.0613 19.5113C9.61078 20.0223 8.88304 20.0223 8.43254 19.5113C7.98203 19.0003 7.98203 18.1749 8.43254 17.664L14.0581 11.2573H1.15514C0.519814 11.2573 0 10.6677 0 9.94716C0 9.22657 0.519814 8.637 1.15514 8.637Z"
                        fill="white" />
                </svg>
            </button>
        </div>

        <a href="{{ @$accommodationContent->data_values->{'button_link_' . app()->getLocale()} }}"
            class="btn-view-all">{{ __(@$accommodationContent->data_values->{'button_text_' . app()->getLocale()}) }}</a>
    </div>
</section>

@push('style')
    <link rel="stylesheet" href="{{ asset('assets/templates/basic/css/accommodation.css') }}">
@endpush

@push('script')
    <script>
        (function($) {

            if (document.querySelector(".slider-accommodation")) {
                new Swiper(".slider-accommodation", {
                    loop: true,
                    speed: 500,
                    centeredSlides: true,
                    slidesPerView: 1,
                    spaceBetween: 24,
                    navigation: {
                        nextEl: ".accommodation-nav--next",
                        prevEl: ".accommodation-nav--prev",
                    },
                    breakpoints: {
                        768: {
                            slidesPerView: "auto",
                            spaceBetween: 24,
                        },
                    },
                });
            }
        })(jQuery);
    </script>
@endpush
