@php
    $contactContent = getContent('contact_form.content', true);
@endphp

<section id="contact-form-section" class="contact-form-section py-lg-5 py-4">
    <div class="container">
        <div class="row gy-5" style="align-items: stretch">
            <div class="col-lg-5">
                <div class="contact-banner-wrapper">
                    <div class="contact-banner-inner">
                        <img src="{{ frontendImage('contact_form', @$contactContent->data_values->banner, '800x1000') }}"
                            alt="Contact Banner" class="img-fluid">
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="contact-form-wrapper ps-lg-4">
                    <h2 class="contact-form-title">
                        {{ __(@$contactContent->data_values->{'title_' . app()->getLocale()} ?? @$contactContent->data_values->title) }}
                    </h2>
                    <p class="contact-form-desc">
                        {{ __(@$contactContent->data_values->{'description_' . app()->getLocale()} ?? @$contactContent->data_values->description) }}
                    </p>

                    <form action="{{ route('contact.submit') }}" method="POST" class="contact-main-form mt-4">
                        @csrf
                        <div class="form-group">
                            <label class="form--label">@lang('Name')</label>
                            <input type="text" name="name" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Phone')</label>
                            <input type="text" name="phone" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Email')</label>
                            <input type="email" name="email" class="form--control" required>
                        </div>
                        <div class="form-group">
                            <label class="form--label">@lang('Message')</label>
                            <textarea name="message" class="form--control" rows="5"></textarea>
                        </div>

                        <div class="mt-4">
                            <button type="submit" class="btn btn-contact-submit">
                                <span>@lang('SEND A MESSAGE')</span>
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

    @if (@$contactContent->data_values->google_map_iframe)
        <div class="contact-map-wrapper my-5">

            <div class="container p-0">
                <div class="google-map">
                    {!! @$contactContent->data_values->google_map_iframe !!}
                </div>
            </div>
        </div>
    @endif
</section>
