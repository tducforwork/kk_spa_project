@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="miceEventDetails" class="single-post py-5">
        <div class="container">
            <div class="single-post-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-post-main ">
                <div class="d-flex align-items-center justify-content-center position-relative mb-4 mb-lg-5">
                    <h2 class="single-post-section-title mb-0">
                        {{ __($event->t->name) }}
                    </h2>
                </div>
                @php
                    $introImages = $event->introImages ?? collect([]);
                @endphp

                <div class="intro-slider-wrapper">
                    <div class="intro-content-box intro-mice-event">
                        <div class="description">{!! $event->t->card_content !!}</div>

                        @if (isset($event->t->additional_info) && count($event->t->additional_info) > 0)
                            <ul class="intro-features-list">
                                @foreach ($event->t->additional_info as $info)
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
                                            <img src="{{ getImage(getFilePath('mice_event') . '/' . $img->image, '1000x600') }}"
                                                alt="Intro Image">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('mice_event') . '/' . $event->image, '1000x600') }}"
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
                    {!! $event->t->content !!}
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
