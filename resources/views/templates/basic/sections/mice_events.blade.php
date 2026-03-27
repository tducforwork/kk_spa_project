@php
    $miceEventsContent = getContent('mice_events.content', true);
    $events = \App\Models\MiceEvent::where('status', 1)
        ->where('is_featured', 1)
        ->with(['translations', 'images'])
        ->orderBy('sort_order', 'asc')
        ->orderBy('id', 'desc')
        ->take(3)
        ->get();
@endphp

<section id="events" class="events-section ">
    <div class="events-container container">
        <h2 class="events-title">{{ __(@$miceEventsContent->data_values->{'heading_' . app()->getLocale()}) }}</h2>

        <div class="events-grid">
            @foreach ($events as $event)
                <!-- Event Card -->
                <a href="#" class="event-card">
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
                            <button class="event-btn event-btn--outline">{{ __('Send Enquiry') }}</button>
                            <button class="event-btn event-btn--filled">{{ __('Explore') }}</button>
                        </div>
                    </div>
                </a>
            @endforeach
        </div>
    </div>
</section>
