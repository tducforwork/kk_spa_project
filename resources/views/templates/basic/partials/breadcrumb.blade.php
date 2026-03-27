@php
    $segments = request()->segments();
    $currentAction = Route::currentRouteName();
@endphp

<nav aria-label="breadcrumb" class="breadcrumb-nav">
    <div class="container custom-container">
        <ol class="breadcrumb-list">
            <li class="breadcrumb-item">
                <a href="{{ route('home') }}">@lang('Home')</a>
            </li>

            @if (isset($crumbs))
                <li class="breadcrumb-item">
                    <a href="{{ url($crumbs['url']) }}"><span>{{ __($crumbs['name']) }}</span></a>
                </li>
            @endif

            @php $url = ''; @endphp
            @foreach ($segments as $segment)
                @php
                    $url .= '/' . $segment;
                    $isLast = $loop->last;
                    $name = str_replace('-', ' ', $segment);
                    $name = ucwords($name);
                    $displayName = ($breadcrumb_mapping ?? [])[$name] ?? __($name);
                    
                    // If it's the last segment and we have a pageTitle, use it
                    if ($isLast && isset($pageTitle)) {
                        $displayName = __($pageTitle);
                    }
                @endphp

                <li class="breadcrumb-item @if($isLast) active @endif" @if($isLast) aria-current="page" @endif>
                    @if (!$isLast)
                        <a href="{{ url($url) }}"><span>{{ $displayName }}</span></a>
                    @else
                        <span>{{ $displayName }}</span>
                    @endif
                </li>
            @endforeach
        </ol>
    </div>
</nav>
