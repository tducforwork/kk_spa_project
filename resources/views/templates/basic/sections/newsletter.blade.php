@php
    $newsletterContent = getContent('newsletter.content', true);
@endphp

<section class="newsletter-section">
    <div class="container">
        <div class="newsletter-wrapper text-center">
            <h2 class="newsletter-title">{{ __(@$newsletterContent->data_values->{'heading_' . app()->getLocale()}) }}
            </h2>
            <div class="newsletter-divider">
                <span class="diamond-dot left"></span>
                <span class="line"></span>
                <span class="diamond-dot right"></span>
            </div>

            <form action="{{ route('subscribe') }}" method="POST" class="newsletter-form">
                @csrf
                <div class="newsletter-input-group">
                    <input type="email" name="email" class="form-control newsletter-input"
                        placeholder="{{ __('Your email') }}" required>
                    <button type="submit" class="newsletter-submit-btn">{{ __('SUBSCRIBE') }}</button>
                </div>
            </form>
        </div>
    </div>
</section>
