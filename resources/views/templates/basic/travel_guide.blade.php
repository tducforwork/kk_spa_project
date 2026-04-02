@extends('Template::layouts.frontend')

@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    <section id="travel-guide" class="single-page py-5">
        <div class="container">
            <div class="single-page-heading">
                @include('Template::sections.feature_icons')
            </div>
            <div class="single-page-main ">
                <h2 class="single-page-section-title">
                    {{ __('Travel Guide') }}
                </h2>
                <div class=" single_page-grid travel_guide-grid row ">
                    @foreach ($posts as $post)
                        <div class="col-lg-6 col-md-6 mb-4">
                            <div class="travel-guide-card">
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
                    @endforeach
                </div>
                {{ $posts->links('Template::partials.pagination') }}
            </div>

        </div>
    </section>
@endsection
