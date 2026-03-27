@extends('Template::layouts.frontend')

@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    <section id="accommodation" class="single-page py-5">
        <div class="container">
            <div class="single-page-heading">
                <h1 class="single-page-section-title">
                    Book Directly on our Website
                </h1>
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-page-main ">
                <h2 class="single-page-section-title">
                    Room & Suite
                </h2>
                <div class="single_page-grid accommodation-grid row ">
                    @foreach ($rooms as $room)
                        <div class="col-lg-6 col-12 mb-4">
                            <div class="room-card h-100">
                                <div class="room-slider swiper slider-room-gallery-{{ $room->id }}">
                                    <div class="swiper-wrapper">
                                        @if ($room->images->count() > 0)
                                            @foreach ($room->images as $image)
                                                <div class="swiper-slide">
                                                    <img src="{{ getImage(getFilePath('room') . '/' . $image->image, getFileSize('room')) }}"
                                                        alt="{{ __($room->t->name) }}" class="room-gallery-img">
                                                </div>
                                            @endforeach
                                        @else
                                            <div class="swiper-slide">
                                                <img src="{{ getImage(getFilePath('room') . '/' . $room->image, getFileSize('room')) }}"
                                                    alt="{{ __($room->t->name) }}" class="room-gallery-img">

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
                                    <h3 class="room-card-title text-uppercase">{{ __($room->t->name) }}</h3>
                                    <p class="room-card-price ">
                                        {{ __('Available from') }} <strong>USD {{ number_format($room->price, 0) }}</strong>
                                    </p>
                                    <hr class="room-card-separator">
                                    <p class="room-card-description">
                                        {{ __($room->t->description) }}
                                    </p>

                                    <div class="room-card-amenities row text-start gy-3 ">
                                        @foreach ($room->t->additional_info ?? [] as $info)
                                            <div class="col-6 amenity-card-item">
                                                @if (@$info['icon'])
                                                    <img src="{{ getImage(getFilePath('room_icon') . '/' . $info['icon']) }}"
                                                        alt="icon"
                                                        style="width: 24px; height: 24px; object-fit: contain;">
                                                @else
                                                    <i class="las la-check-circle"></i>
                                                @endif
                                                {{ __(@$info['text']) }}
                                            </div>
                                        @endforeach
                                    </div>

                                    <div class="room-card-actions mt-4 d-flex justify-content-center gap-3">
                                        <a href="#" class="btn-card-book">{{ __('Book a room') }}</a>
                                        <a href="{{ url($room->t->slug) }}"
                                            class="btn-card-more text-dark">{{ __('More info') }}</a>

                                    </div>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
            </div>

        </div>
    </section>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";
            @foreach ($rooms as $room)
                new Swiper(".slider-room-gallery-{{ $room->id }}", {
                    loop: true,
                    speed: 500,
                    // autoplay: {
                    //     delay: 3000,
                    //     disableOnInteraction: false,
                    // },
                    navigation: {
                        nextEl: ".slider-room-gallery-{{ $room->id }} .room-slider-next",
                        prevEl: ".slider-room-gallery-{{ $room->id }} .room-slider-prev",
                    },
                    pagination: {
                        el: ".slider-room-gallery-{{ $room->id }} .room-slider-pagination",
                        clickable: true,
                    },
                });
            @endforeach
        })(jQuery);
    </script>
@endpush
