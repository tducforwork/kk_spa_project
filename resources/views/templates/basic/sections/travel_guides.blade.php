@php
    $travelGuidesContent = getContent('travel_guides.content', true);
    $posts = \App\Models\Post::where('status', 1)
        ->where('is_hot', 1)
        ->orderBy('sort_order', 'asc')
        ->orderBy('id', 'desc')
        ->limit(3)
        ->get();
@endphp

<section class="travel-guides-section ">
    <div class="container">
        <div class="section-header text-center ">
            <h2 class="home-section-title mb-4">
                {{ __(@$travelGuidesContent->data_values->{'heading_' . app()->getLocale()}) }}</h2>
        </div>

        <div class="row justify-content-center">
            @foreach ($posts as $post)
                <div class="col-lg-4 col-md-6 mb-4">
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
                                <a href="#" class="read-more-btn">
                                    {{ __('Read more') }}
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
</section>
