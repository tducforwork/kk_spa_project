@extends('Template::layouts.frontend')
@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    <section class="search-result-section single-page py-5">
        <div class="container">
            <div class="row mb-5">
                <div class="col-lg-12">
                    <h2 class="single-page-section-title">
                        {{ __('Search Results') }}
                    </h2>
                    <p class="text-muted">
                        {{ $posts->total() }} {{ __('results found') }}
                    </p>
                </div>
            </div>

            <div class="single_page-grid travel_guide-grid row">
                @forelse ($posts as $post)
                    <div class="col-lg-6 col-md-6 mb-4">
                        <div class="travel-guide-card wow fadeInUp" data-wow-duration="1s">
                            <div class="travel-guide-thumb">
                                <img src="{{ getImage(getFilePath('post') . '/' . $post->image) }}"
                                    alt="{{ __($post->t->name) }}" loading="lazy" decoding="async">
                            </div>
                            <div class="travel-guide-content">
                                <h4 class="travel-guide-title">
                                    {{ __($post->t->name) }}
                                </h4>
                                <p class="travel-guide-desc">
                                    {{ strLimit(strip_tags($post->t->description), 120) }}
                                </p>
                                <div class="travel-guide-footer">
                                    <a href="{{ url($post->t->slug) }}" class="read-more-btn">
                                        {{ __('Read more') }}
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                @empty
                    <div class="col-lg-12">
                        <div class="empty-search text-center py-5">
                            <i class="las la-search-minus" style="font-size: 80px; color: #ccc;"></i>
                            <h3 class="mt-4">{{ __('No results found for') }} "{{ $search }}"</h3>
                            <p>{{ __('Try different keywords or check your spelling.') }}</p>
                            <a href="{{ route('home') }}" class="btn btn--base mt-3">{{ __('Go Back Home') }}</a>
                        </div>
                    </div>
                @endforelse
            </div>

            @if ($posts->hasPages())
                <div class="row align-items-center mt-4">
                    {{ $posts->links('Template::partials.pagination') }}
                </div>
            @endif
        </div>
    </section>
@endsection
