@php
    $featureIcons = getContent('feature_icons.element')->sortBy('id');
@endphp

@if ($featureIcons->count() > 0)
    <section class="feature-icons-section py-4">
        <div class="container custom-container">
            <div class="row">
                <div class="col-12 col-md-6">
                    <div class="feature-icons-wrapper ">
                        @foreach ($featureIcons as $item)
                            <div class="feature-icon-item">
                                <div class="feature-icon-img">
                                    <img src="{{ frontendImage('feature_icons', @$item->data_values->icon, '64x64') }}"
                                        alt="icon">
                                </div>
                                <p class="feature-icon-title">
                                    {{ __(@$item->data_values->{'title_' . app()->getLocale()}) }}
                                </p>
                            </div>
                        @endforeach
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="tripadvisor-rating-wrapper  text-center">
                        <h4 class="tripadvisor-title">{{ __('TripAdvisor Traveler Rating:') }}</h4>
                        <div class="tripadvisor-image my-2">
                            <img src="{{ asset('assets/images/kk_sapa/tripadvisor_rating.webp') }}"
                                alt="TripAdvisor Rating">
                        </div>
                        <p class="tripadvisor-reviews">{{ __('Based on 1.934 traveler reviews') }}</p>
                        <a href="#" class="tripadvisor-link">{{ __('Read review') }}</a>
                    </div>
                </div>
            </div>

        </div>
    </section>
@endif
