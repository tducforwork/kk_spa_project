@extends('Template::layouts.frontend')

@section('content')
    @include('Template::sections.inner_slider')
    @include('Template::partials.breadcrumb')
    @include('Template::sections.about_content')
    @include('Template::sections.about_gallery')
@endsection
