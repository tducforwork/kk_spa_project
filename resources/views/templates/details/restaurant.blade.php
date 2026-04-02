@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="restaurantDetails" class="single-post py-5">
        <div class="container">

            <div class="single-post-main ">
                <div class="d-flex align-items-center justify-content-center position-relative mb-4 mb-lg-5">
                    <h2 class="single-post-section-title mb-0">
                        {{ __($restaurant->t->name) }}
                    </h2>
                </div>
                @php
                    $introImages = $restaurant->introImages ?? collect([]);
                @endphp

                <div class="intro-slider-wrapper">
                    <div class="intro-content-box intro-restaurant">
                        <h4 class="text-center">{{ __('Opening hours') }}</h4>
                        <div class="time-schedule text-center">
                            {{ $restaurant->opening_time }} - last orders {{ $restaurant->last_order_time }}
                        </div>
                        <div class="divider-restaurant"></div>
                        <div class="offer-contact">
                            <ul>
                                <li class="d-flex align-items-center gap-3 flex-column mb-4">
                                    <img src="{{ asset('assets/images/kk_sapa/phone.webp') }}" alt="">
                                    <span>{{ $restaurant->hotline }}</span>
                                </li>

                                <li class="d-flex align-items-center gap-3 flex-column">
                                    <img src="{{ asset('assets/images/kk_sapa/mail.webp') }}" alt="">
                                    <a href="mailto:{{ $restaurant->email }}">{{ $restaurant->email }}</a>
                                </li>
                            </ul>
                        </div>
                        <div class="divider-restaurant"></div>
                        <div class="intro-actions">
                            <ul>
                                <li class="intro-action-item mb-4">
                                    <a href="#" class="intro-action-link book-table-btn"
                                        data-origin="{{ __($restaurant->t->name) }}">
                                        {{ __('Book a table') }}
                                        <i class="las la-arrow-right"></i>
                                    </a>
                                </li>

                                @if ($restaurant->menu_pdf)
                                    <li class="intro-action-item mb-4">
                                        <a href="{{ getImage(getFilePath('restaurant_menu_pdf') . '/' . $restaurant->menu_pdf) }}"
                                            target="_blank" class="intro-action-link show-menu-btn">
                                            {{ __('Menu') }}
                                            <i class="las la-arrow-right"></i>
                                        </a>
                                    </li>
                                @endif
                                @if ($restaurant->promotion_link)
                                    <li class="intro-action-item ">
                                        <a href="{{ $restaurant->promotion_link }}" target="_blank"
                                            class="intro-action-link show-promotion-btn">
                                            {{ __('Promotion') }}
                                            <i class="las la-arrow-right"></i>
                                        </a>
                                    </li>
                                @endif
                            </ul>
                        </div>
                    </div>

                    <div class="intro-slider-box">
                        <div class="swiper intro-gallery-swiper">
                            <div class="swiper-wrapper">
                                @if ($introImages->count() > 0)
                                    @foreach ($introImages as $img)
                                        <div class="swiper-slide">
                                            <img src="{{ getImage(getFilePath('restaurant') . '/' . $img->image, '1000x600') }}"
                                                alt="Intro Image">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('restaurant') . '/' . $restaurant->image, '1000x600') }}"
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
                    {!! $restaurant->t->content !!}
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
            })(jQuery);
        </script>
    @endpush
@endsection
