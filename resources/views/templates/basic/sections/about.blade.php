@php
    $aboutCaption = getContent('about.content', true);
    $aboutElements = getContent('about.element', false, null, true);
@endphp

<section id="features" class="features-section py-lg-5 py-4">
    <div class="container features-container">
        <div class="features-header">
            <h2 class ="home-section-title">
                {{ __(@$aboutCaption->data_values->{'heading_' . app()->getLocale()} ?? @$aboutCaption->data_values->heading) }}
            </h2>
            <h2 class ="home-section-title">
                {{ __(@$aboutCaption->data_values->{'subheading_' . app()->getLocale()} ?? @$aboutCaption->data_values->subheading) }}
            </h2>
        </div>

        <div class="features-grid">
            @foreach ($aboutElements as $item)
                <div class="feature-card">
                    <div class="feature-icon">
                        <img src="{{ frontendImage('about', @$item->data_values->image, '32x32') }}"
                            alt="{{ __(@$item->data_values->{'title_' . app()->getLocale()} ?? @$item->data_values->title) }}"
                            loading="lazy" decoding="async">
                    </div>
                    <p class="feature-title">
                        {{ __(@$item->data_values->{'title_' . app()->getLocale()} ?? @$item->data_values->title) }}</p>
                </div>
            @endforeach
        </div>

        <div class="features-description">
            <p>{{ __(@$aboutCaption->data_values->{'description_' . app()->getLocale()} ?? @$aboutCaption->data_values->description) }}
            </p>
        </div>

        <a href="{{ @$aboutCaption->data_values->{'button_url_' . app()->getLocale()} }}" class="btn-about">
            {{ __(@$aboutCaption->data_values->{'button_text_' . app()->getLocale()} ?? @$aboutCaption->data_values->button_text) }}
        </a>
    </div>
</section>
