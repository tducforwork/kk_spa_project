@extends('Template::layouts.frontend')

@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    <section id="accommodation" class="single-page py-5">
        <div class="container">
            <div class="single-page-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-page-main ">
                <h2 class="single-page-section-title">
                    {{ __('Special Offer') }}
                </h2>
                <div class=" single_page-grid special_offers-grid row ">
                    @foreach ($specialOffers as $specialOffer)
                        <div class="col-lg-4 col-12 mb-4">
                            <div class="room-card h-100">
                                <div
                                    class="room-slider swiper slider-offer-gallery slider-offer-gallery-{{ $specialOffer->id }}">
                                    <div class="swiper-wrapper">
                                        @if ($specialOffer->images->count() > 0)
                                            @foreach ($specialOffer->images as $image)
                                                <div class="swiper-slide">
                                                    <img src="{{ getImage(getFilePath('special_offer') . '/' . @$image->image, getFileSize('special_offer')) }}"
                                                        alt="{{ __($specialOffer->t->name) }}" class="room-gallery-img">
                                                </div>
                                            @endforeach
                                        @else
                                            <div class="swiper-slide">
                                                <img src="{{ getImage(getFilePath('special_offer') . '/' . @$specialOffer->image, getFileSize('special_offer')) }}"
                                                    alt="{{ __($specialOffer->t->name) }}" class="room-gallery-img">

                                            </div>
                                        @endif
                                    </div>
                                    <div class="room-slider-next swiper-button-next">
                                        <img src="{{ asset('assets/images/kk_sapa/gallery_next.webp') }}" alt="arrow-right">
                                    </div>
                                    <div class="room-slider-prev swiper-button-prev">
                                        <img src="{{ asset('assets/images/kk_sapa/gallery_prev.webp') }}" alt="arrow-left">
                                    </div>
                                    <div class="room-slider-pagination swiper-pagination"></div>
                                </div>
                                <div class="room-content text-center">
                                    <h3 class="room-card-title text-uppercase">{{ __($specialOffer->t->name) }}</h3>
                                    <hr class="room-card-separator">
                                    <p class="room-card-description">
                                        {{ __($specialOffer->t->short_description) }}
                                    </p>
                                    <div class="room-card-actions mt-4 d-flex justify-content-center gap-3">
                                        <a href="#" class="btn-card-book inquiry-open-form"
                                            data-origin="{{ __($specialOffer->t->name) }}">{{ __('Send an inquiry') }}</a>
                                        <a href="{{ url($specialOffer->t->slug) }}"
                                            class="btn-card-more text-dark">{{ __('More info') }}</a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                {{ $specialOffers->links('Template::partials.pagination') }}
            </div>

        </div>
    </section>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            @foreach ($specialOffers as $specialOffer)
                new Swiper(".slider-offer-gallery-{{ $specialOffer->id }}", {
                    loop: true,
                    speed: 500,
                    // autoplay: {
                    //     delay: 3000,
                    //     disableOnInteraction: false,
                    // },
                    navigation: {
                        nextEl: ".slider-offer-gallery-{{ $specialOffer->id }} .room-slider-next",
                        prevEl: ".slider-offer-gallery-{{ $specialOffer->id }} .room-slider-prev",
                    },
                    pagination: {
                        el: ".slider-offer-gallery-{{ $specialOffer->id }} .room-slider-pagination",
                        clickable: true,
                    },
                });
            @endforeach
        })(jQuery);
    </script>
@endpush
