@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="facilityDetails" class="single-post py-5">
        <div class="container">
            <div class="single-post-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-post-main ">
                <div class="d-flex align-items-center justify-content-center position-relative mb-4 mb-lg-5">
                    <h2 class="single-post-section-title mb-0">
                        {{ __($facility->t->name) }}
                    </h2>
                </div>
                @php
                    $introImages = $facility->introImages ?? collect([]);
                @endphp

                <div class="intro-slider-wrapper">
                    <div class="intro-content-box intro-facility-event">
                        <div class="description">{!! $facility->t->description !!}</div>

                        @if (isset($facility->t->additional_info) && count($facility->t->additional_info) > 0)
                            <ul class="intro-features-list">
                                @foreach ($facility->t->additional_info as $info)
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
                                            <img src="{{ getImage(getFilePath('facility') . '/' . $img->image, '1000x600') }}"
                                                alt="Intro Image">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('facility') . '/' . $facility->image, '1000x600') }}"
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
                    {!! $facility->t->content !!}
                </div>

                <div class="relating-room py-5">
                    <h3 class="single-post-section-title mb-5">
                        {{ __('You may also be interested') }}
                    </h3>

                    @php
                        $relatedFacilities = App\Models\Facility::with([
                            'translations',
                            'images' => function ($q) {
                                $q->where('type', 2);
                            },
                        ])
                            ->where('id', '!=', $facility->id)
                            ->inRandomOrder()
                            ->take(4)
                            ->get();
                    @endphp

                    <div class="row gy-4">
                        @foreach ($relatedFacilities as $related)
                            <div class="col-md-6 col-12">
                                <div class="room-card h-100">
                                    <div class="room-card-thumbnail">
                                        <a href="{{ url($related->t->slug) }}" style="text-decoration:none">
                                            <img src="{{ getImage(getFilePath('facility') . '/' . $related->image, getFileSize('facility')) }}"
                                                alt="{{ __($related->t->name) }}" class="room-gallery-img">
                                        </a>
                                    </div>
                                    <div class="room-content text-center">
                                        <h3 class="room-card-title text-uppercase">
                                            <a href="{{ url($related->t->slug) }}"
                                                class="text-dark"style="text-decoration:none">{{ __($related->t->name) }}</a>
                                        </h3>
                                        <hr class="room-card-separator">
                                        <p class="room-card-description">
                                            {{ strLimit(__($related->t->description), 120) }}
                                        </p>
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
            })(jQuery);
        </script>
    @endpush
@endsection
