@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="specialOfferDetails" class="single-post py-5">
        <div class="container">
            <div class="single-post-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-post-main ">
                <div class="d-flex align-items-center justify-content-center position-relative mb-4 mb-lg-5">
                    <h2 class="single-post-section-title mb-0">
                        {{ __($offer->t->name) }}
                    </h2>
                </div>
                @php
                    $introImages = $offer->introImages ?? collect([]);
                @endphp

                <div class="intro-slider-wrapper">
                    <div class="intro-content-box intro-special-offer">
                        <h4>{!! $offer->t->text_price !!}</h4>
                        <div class="divider-offer"></div>
                        <div class="offer-contact">
                            <ul>
                                <li class="d-flex align-items-center gap-3 flex-column mb-4">
                                    <img src="{{ asset('assets/images/kk_sapa/phone.webp') }}" alt="">
                                    <span>{{ $offer->hotline }}</span>
                                </li>
                                <li class="d-flex align-items-center gap-3 flex-column">
                                    <img src="{{ asset('assets/images/kk_sapa/mail.webp') }}" alt="">
                                    <span>{{ $offer->email }}</span>
                                </li>
                            </ul>
                        </div>
                        <div class="divider-offer"></div>
                        <div class="intro-actions">
                            <ul>
                                <li class="intro-action-item ">
                                    <a href="#" class="intro-action-link book-room-btn">
                                        {{ __('Book a room') }}
                                        <i class="las la-arrow-right"></i>
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </div>

                    <div class="intro-slider-box">
                        <div class="swiper intro-gallery-swiper">
                            <div class="swiper-wrapper">
                                @if ($introImages->count() > 0)
                                    @foreach ($introImages as $img)
                                        <div class="swiper-slide">
                                            <img src="{{ getImage(getFilePath('special_offer') . '/' . $img->image, '1000x600') }}"
                                                alt="Intro Image">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('special_offer') . '/' . $offer->image, '1000x600') }}"
                                            alt="Main Image">
                                    </div>
                                @endif
                            </div>
                            @if ($introImages->count() > 1)
                                <div class="swiper-pagination"></div>
                                <div class="swiper-button-next">
                                    <img src="{{ asset('assets/images/kk_sapa/gallery_next.webp') }}" alt="arrow-right">
                                </div>
                                <div class="swiper-button-prev">
                                    <img src="{{ asset('assets/images/kk_sapa/gallery_prev.webp') }}" alt="arrow-left">
                                </div>
                            @endif
                        </div>
                    </div>
                </div>

                <div class="room-content-box pt-5 pb-3 ">
                    {!! $offer->t->content !!}
                </div>

                <div class="price-content-box pt-4 pb-3 ">
                    {!! $offer->t->price_content !!}
                </div>
                <div class="term-content-box pt-4 pb-5 ">
                    {!! $offer->t->terms_content !!}
                </div>
                <div class="relating-room mt-5">
                    <h3 class="single-post-section-title mb-5">
                        {{ __('You may also be interested') }}
                    </h3>

                    @php
                        $relatedOffers = App\Models\SpecialOffer::with([
                            'translations',
                            'images' => function ($q) {
                                $q->where('type', 2);
                            },
                        ])
                            ->where('id', '!=', $offer->id)
                            ->inRandomOrder()
                            ->take(3)
                            ->get();
                    @endphp

                    <div class="row gy-4">
                        @foreach ($relatedOffers as $related)
                            <div class="col-lg-4 col-12 mb-4">
                                <div class="room-card h-100">
                                    <div
                                        class="room-slider swiper slider-offer-gallery slider-offer-gallery-{{ $related->id }}">
                                        <div class="swiper-wrapper">
                                            @if ($related->images->count() > 0)
                                                @foreach ($related->images as $image)
                                                    <div class="swiper-slide">
                                                        <img src="{{ getImage(getFilePath('special_offer') . '/' . @$image->image, getFileSize('special_offer')) }}"
                                                            alt="{{ __($related->t->name) }}" class="room-gallery-img">
                                                    </div>
                                                @endforeach
                                            @else
                                                <div class="swiper-slide">
                                                    <img src="{{ getImage(getFilePath('special_offer') . '/' . @$related->image, getFileSize('special_offer')) }}"
                                                        alt="{{ __($related->t->name) }}" class="room-gallery-img">

                                                </div>
                                            @endif
                                        </div>
                                        <div class="room-slider-next swiper-button-next">
                                            <img src="{{ asset('assets/images/kk_sapa/gallery_next.webp') }}"
                                                alt="arrow-right">
                                        </div>
                                        <div class="room-slider-prev swiper-button-prev">
                                            <img src="{{ asset('assets/images/kk_sapa/gallery_prev.webp') }}"
                                                alt="arrow-left">
                                        </div>
                                        <div class="room-slider-pagination swiper-pagination"></div>
                                    </div>
                                    <div class="room-content text-center">
                                        <h3 class="room-card-title text-uppercase">{{ __($related->t->name) }}</h3>
                                        <hr class="room-card-separator">
                                        <p class="room-card-description">
                                            {{ __($related->t->short_description) }}
                                        </p>
                                        <div class="room-card-actions mt-4 d-flex justify-content-center gap-3">
                                            <a href="#" class="btn-card-book">{{ __('Send an inquiry') }}</a>
                                            <a href="{{ url($related->t->slug) }}"
                                                class="btn-card-more text-dark">{{ __('More info') }}</a>

                                        </div>
                                    </div>
                                </div>
                            </div>
                        @endforeach
                    </div>
                </div>
            </div>
        </div>
    </section>



    @push('script')
        <script>
            (function($) {
                "use strict";
                var introSwiper = new Swiper('.intro-gallery-swiper', {
                    loop: {{ $introImages->count() > 1 ? 'true' : 'false' }},
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

                @foreach ($relatedOffers as $related)
                    new Swiper(".slider-offer-gallery-{{ $related->id }}", {
                        slidesPerView: 1,
                        spaceBetween: 0,
                        loop: true,
                        speed: 1000,
                        navigation: {
                            nextEl: ".slider-offer-gallery-{{ $related->id }} .room-slider-next",
                            prevEl: ".slider-offer-gallery-{{ $related->id }} .room-slider-prev",
                        },
                        pagination: {
                            el: ".slider-offer-gallery-{{ $related->id }} .room-slider-pagination",
                            clickable: true,
                        },
                    });
                @endforeach
            })(jQuery);
        </script>
    @endpush
@endsection
