@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="roomDetails" class="single-post py-5">
        <div class="container">
            <div class="single-post-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-post-main ">
                <div
                    class="d-flex align-items-center justify-content-lg-center justify-content-start position-relative mb-4 mb-lg-5">
                    <h2 class="single-post-section-title mb-0">
                        {{ __($room->t->name) }}
                    </h2>
                    <a href="https://book.securebookings.net/roomrate?id=ecec4926-aab8-1659321528-4540-b400-0e44b8bca614&lang={{ app()->getLocale() == 'vi' ? 'vi' : 'en' }}"
                        class="btn-card-book position-absolute end-0" target="_blank">{{ __('Book a room') }} <i
                            class="las la-arrow-right"></i></a>
                </div>
                @php
                    $introImages = $room->introImages ?? collect([]);
                @endphp

                <div class="intro-slider-wrapper">
                    <div class="intro-content-box">
                        <span class="price-tag">{{ __('Available from USD') }} {{ $room->price }}</span>

                        <div class="description">
                            {!! $room->t->description !!}
                        </div>

                        @if (isset($room->t->additional_info) && count($room->t->additional_info) > 0)
                            <ul class="intro-features-list">
                                @foreach ($room->t->additional_info as $info)
                                    <li class="intro-feature-item">
                                        <div class="feature-icon-img">
                                            <img src="{{ getImage(getFilePath('room_icon') . '/' . $info['icon']) }}"
                                                alt="icon" style="width: 24px; height: 24px; object-fit: contain;">
                                        </div>
                                        <span>{{ __($info['text']) }}</span>
                                    </li>
                                @endforeach
                            </ul>
                        @endif
                    </div>

                    <div class="intro-slider-box">
                        <div class="swiper intro-gallery-swiper">
                            <div class="swiper-wrapper">
                                @if ($introImages->count() > 0)
                                    @foreach ($introImages as $img)
                                        <div class="swiper-slide">
                                            <img src="{{ getImage(getFilePath('room') . '/' . $img->image, '1000x600') }}"
                                                alt="Intro Image">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('room') . '/' . $room->image, '1000x600') }}"
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

                <div class="room-content-box py-5 ">
                    {!! $room->t->content !!}
                </div>

                <div class="room-amenities-section ">
                    <div class="row">
                        @php
                            $amenityCategories = [
                                'Suite Highlights' => $room->t->suite_highlights,
                                'Technology' => $room->t->technology,
                                'Bed & Bath' => $room->t->bed_bath,
                                'Others' => $room->t->others,
                            ];
                        @endphp

                        @foreach ($amenityCategories as $title => $items)
                            @if ($items)
                                <div class="col-md-6 mb-4">
                                    <h4 class="amenity-category-title mb-4">{{ __($title) }}</h4>
                                    <ul class="amenity-list">
                                        @foreach (explode("\n", $items) as $item)
                                            @if (trim($item))
                                                <li>{{ trim($item) }}</li>
                                            @endif
                                        @endforeach
                                    </ul>
                                </div>
                            @endif
                        @endforeach
                    </div>
                </div>
                <div class="relating-room mt-5">
                    <h3 class="single-post-section-title mb-5">
                        {{ __('You may also be interested') }}
                    </h3>

                    @php
                        $relatedRooms = $room
                            ->relatedRooms()
                            ->with([
                                'translations',
                                'images' => function ($q) {
                                    $q->where('type', 2);
                                },
                            ])
                            ->get();

                        if ($relatedRooms->isEmpty()) {
                            $relatedRooms = App\Models\Room::with([
                                'translations',
                                'images' => function ($q) {
                                    $q->where('type', 2);
                                },
                            ])
                                ->where('id', '!=', $room->id)
                                ->inRandomOrder()
                                ->take(2)
                                ->get();
                        } else {
                            $relatedRooms = $relatedRooms->take(2);
                        }
                    @endphp

                    <div class="row gy-4">
                        @foreach ($relatedRooms as $related)
                            <div class="col-lg-6 col-12">
                                <div class="room-card h-100">
                                    <div class="room-slider swiper slider-room-gallery-{{ $related->id }}">
                                        <div class="swiper-wrapper">
                                            @if ($related->images->count() > 0)
                                                @foreach ($related->images as $image)
                                                    <div class="swiper-slide">
                                                        <img src="{{ getImage(getFilePath('room') . '/' . $image->image, getFileSize('room')) }}"
                                                            alt="{{ __($related->t->name) }}" class="room-gallery-img">
                                                    </div>
                                                @endforeach
                                            @else
                                                <div class="swiper-slide">
                                                    <img src="{{ getImage(getFilePath('room') . '/' . $related->image, getFileSize('room')) }}"
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
                                        <p class="room-card-price ">
                                            {{ __('Available from') }} <strong>USD
                                                {{ number_format($related->price, 0) }}</strong>
                                        </p>
                                        <hr class="room-card-separator">
                                        <p class="room-card-description">
                                            {{ __($related->t->description) }}
                                        </p>

                                        <div class="room-card-amenities row text-start gy-3 ">
                                            @foreach ($related->t->additional_info ?? [] as $info)
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
                                            <a href="https://book.securebookings.net/roomrate?id=ecec4926-aab8-1659321528-4540-b400-0e44b8bca614&lang={{ app()->getLocale() == 'vi' ? 'vi' : 'en' }}"
                                                class="btn-card-book" target="_blank">{{ __('Book a room') }}</a>
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

                @foreach ($relatedRooms as $related)
                    new Swiper(".slider-room-gallery-{{ $related->id }}", {
                        slidesPerView: 1,
                        spaceBetween: 0,
                        loop: true,
                        speed: 1000,
                        navigation: {
                            nextEl: ".slider-room-gallery-{{ $related->id }} .room-slider-next",
                            prevEl: ".slider-room-gallery-{{ $related->id }} .room-slider-prev",
                        },
                        pagination: {
                            el: ".slider-room-gallery-{{ $related->id }} .room-slider-pagination",
                            clickable: true,
                        },
                    });
                @endforeach
            })(jQuery);
        </script>
    @endpush
@endsection
