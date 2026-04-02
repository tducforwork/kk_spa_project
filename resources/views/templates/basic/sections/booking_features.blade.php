@php
    $bookingFeatures = getContent('booking_features.element', false, null, true);
@endphp
<section id="booking-features" class="pt-4">
    <div class="container">
        <div class="features-grid mx-auto">
            @foreach ($bookingFeatures as $item)
                <div class="feature-card">
                    <div class="feature-icon">
                        <img src="{{ frontendImage('booking_features', @$item->data_values->image, '32x32') }}"
                            alt="{{ __(@$item->data_values->{'title_' . app()->getLocale()} ?? @$item->data_values->title) }}"
                            loading="lazy" decoding="async">
                    </div>
                    <p class="feature-title">
                        {{ __(@$item->data_values->{'title_' . app()->getLocale()} ?? @$item->data_values->title) }}</p>
                </div>
            @endforeach
        </div>
    </div>
</section>
