@php
    $exploreServicesContent = getContent('explore_services.content', true);
    $allRestaurants = \App\Models\Restaurant::where('status', 1)
        ->with(['translations', 'category.translations'])
        ->orderBy('sort_order', 'asc')
        ->orderBy('id', 'desc')
        ->take(5)
        ->get();

    // Identify featured restaurant (is_large_frame = 1)
    $featured = $allRestaurants->where('is_large_frame', 1)->first() ?? $allRestaurants->first();

    // Remaining 4 restaurants for small slots
    $smallRestaurants = $allRestaurants
        ->reject(function ($item) use ($featured) {
            return $item->id == $featured->id;
        })
        ->values();
@endphp

<section id="services" class="services-section py-lg-5 py-4">
    <div class="services-container">
        <h2 class="services-title">{{ __(@$exploreServicesContent->data_values->{'heading_' . app()->getLocale()}) }}
        </h2>

        <div class="services-grid">
            <!-- Row 1 -->
            <div class="services-row services-row--first">
                <div class="services-column services-column--left">
                    @for ($i = 0; $i < 2; $i++)
                        @php $item = $smallRestaurants->get($i); @endphp
                        @if ($item)
                            <a href="#" class="service-card service-card--small">
                                <div class="service-image-wrapper">
                                    <img class="service-image"
                                        src="{{ getImage(getFilePath('restaurant') . '/' . $item->image, getFileSize('restaurant')) }}"
                                        alt="{{ __($item->t->name) }}" loading="lazy" decoding="async" />
                                </div>
                                <div class="service-content">
                                    <h3 class="service-title">{{ __($item->t->name) }}</h3>
                                    <p class="service-description">{{ strLimit(__($item->t->description), 60) }}
                                    </p>
                                    <div class="service-button">{{ __('Click to view menu') }}</div>
                                </div>
                            </a>
                        @endif
                    @endfor
                </div>

                <!-- Service Featured -->
                @if ($featured)
                    <a href="#" class="service-card service-card--featured">
                        <img class="service-image service-image--full"
                            src="{{ getImage(getFilePath('restaurant') . '/' . $featured->image, getFileSize('restaurant')) }}"
                            alt="{{ __($featured->t->name) }}" loading="lazy" decoding="async" />
                        <div class="service-featured-content">
                            <h3 class="service-featured-title">{{ __($featured->t->name) }}</h3>
                            <p class="service-featured-description">
                                {{ strLimit(__($featured->t->description), 160) }}</p>
                        </div>
                        <div class="service-button service-button--featured">{{ __('Click to view menu') }}</div>
                    </a>
                @endif
            </div>

            <!-- Row 2 -->
            <div class="services-row services-row--second">
                @for ($i = 2; $i < 4; $i++)
                    @php $item = $smallRestaurants->get($i); @endphp
                    @if ($item)
                        <a href="#" class="service-card service-card--small">
                            <div class="service-image-wrapper">
                                <img class="service-image"
                                    src="{{ getImage(getFilePath('restaurant') . '/' . $item->image, getFileSize('restaurant')) }}"
                                    alt="{{ __($item->t->name) }}" loading="lazy" decoding="async" />
                            </div>
                            <div class="service-content">
                                <h3 class="service-title">{{ __($item->t->name) }}</h3>
                                <p class="service-description">{{ strLimit(__($item->t->description), 60) }}</p>
                                <div class="service-button">{{ __('Click to view menu') }}</div>
                            </div>
                        </a>
                    @endif
                @endfor
            </div>
        </div>
    </div>
</section>
