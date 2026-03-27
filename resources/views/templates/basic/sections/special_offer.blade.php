@php
    $specialOfferContent = getContent('special_offer.content', true);
    // Fetch special offers with status active and limited to 3
    $specialOffers = \App\Models\SpecialOffer::where('status', 1)
        ->with(['translations', 'introImages'])
        ->orderBy('id', 'desc')
        ->take(3)
        ->get();
@endphp

<section id="special-offer" class="special-offer-section ">
    <div class="container special-offer-container ">
        <h2 class="special-offer-title home-section-title">
            {{ __(@$specialOfferContent->data_values->{'heading_' . app()->getLocale()}) }}
        </h2>

        <div class="row gy-4 justify-content-center">
            @foreach ($specialOffers as $offer)
                <div class="col-lg-4 col-md-6">
                    <div class="special-offer-card">
                        {{-- Image Slider inside card --}}
                        <div class="swiper special-offer-gallery">
                            <div class="swiper-wrapper">
                                @if ($offer->introImages->count() > 0)
                                    @foreach ($offer->introImages as $img)
                                        <div class="swiper-slide">
                                            <img src="{{ getImage(getFilePath('special_offer') . '/' . $img->image, getFileSize('special_offer')) }}"
                                                alt="{{ __($offer->t->name) }}" loading="lazy" decoding="async">
                                        </div>
                                    @endforeach
                                @else
                                    <div class="swiper-slide">
                                        <img src="{{ getImage(getFilePath('special_offer') . '/' . $offer->image, getFileSize('special_offer')) }}"
                                            alt="{{ __($offer->t->name) }}" loading="lazy" decoding="async">
                                    </div>
                                @endif
                            </div>

                            {{-- Slider internal controls --}}
                            <div class="swiper-pagination"></div>
                            <div class="swiper-button-prev">
                                <img src="{{ asset('assets/images/kk_sapa/gallery_prev.webp') }}" alt="arrow-left">
                            </div>
                            <div class="swiper-button-next">
                                <img src="{{ asset('assets/images/kk_sapa/gallery_next.webp') }}" alt="arrow-right">
                            </div>
                        </div>

                        <div class="special-offer-body">
                            <h3 class="offer-title">{{ __($offer->t->name) }}</h3>
                            <div class="offer-divider"></div>
                            <p class="offer-desc">
                                {{ strLimit(__($offer->t->short_description), 150) }}
                            </p>

                            <div class="offer-actions mt-auto">
                                <a href="{{ route('contact') }}?subject={{ urlencode('Inquiry for: ' . $offer->t->name) }}"
                                    class="btn-inquiry">
                                    {{ __('Send an inquiry') }}
                                </a>
                                <a href="#" class="btn-card-more text-dark">{{ __('More info') }}</a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>

@push('script')
    <script>
        (function($) {
            "use strict";

            var specialOfferGallery = new Swiper('.special-offer-gallery', {
                slidesPerView: 1,
                loop: true,
                speed: 500,
                pagination: {
                    el: ".swiper-pagination",
                    clickable: true,
                },
                navigation: {
                    nextEl: ".swiper-button-next",
                    prevEl: ".swiper-button-prev",
                },
            });

        })(jQuery);
    </script>
@endpush
