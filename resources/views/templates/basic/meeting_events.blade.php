@extends('Template::layouts.frontend')

@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    <section id="miceEvents" class="single-page py-5">
        <div class="container">
            <div class="single-page-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-page-main ">
                <h2 class="single-page-section-title">
                    {{ __($pageTitle) }}
                </h2>

                <div class="events-grid mt-5">
                    @foreach ($meetingEvents as $event)
                        <!-- Event Card -->
                        <div href="{{ url($event->t->slug) }}" class="event-card">
                            <div class="event-image-wrapper">
                                <img class="event-image"
                                    src="{{ getImage(getFilePath('mice_event') . '/' . $event->avatar, getFileSize('mice_event')) }}"
                                    alt="{{ __($event->t->name) }}" loading="lazy" decoding="async" />
                                <div class="event-image-border"></div>
                            </div>
                            <div class="event-content">
                                <h3 class="event-name">{{ __($event->t->name) }}</h3>
                                <div class="event-divider"></div>
                                <p class="event-description line-clamp-3">{{ __($event->t->short_description) }}</p>
                                <div class="event-buttons">
                                    <button class="event-btn event-btn--outline inquiry-open-form"
                                        data-origin="{{ __($event->t->name) }}">{{ __('Send Enquiry') }}</button>
                                    <a href="{{ url($event->t->slug) }}"
                                        class="event-btn event-btn--filled">{{ __('Explore') }}</a>
                                </div>
                            </div>
                        </div>
                    @endforeach
                </div>
                {{ $meetingEvents->links('Template::partials.pagination') }}
            </div>
        </div>
    </section>
@endsection

@push('style')
    <style>
        .mice_events-grid .room-gallery-img {
            height: 280px;
            object-fit: cover;
        }
    </style>
@endpush
