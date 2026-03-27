@extends('Template::user.layouts.master')
@section('content')
    <div class="notice"></div>

    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card card-item h-100">
                <div class="card-item__header">
                    <h5 class="card-item__title mb-0">@lang('Welcome to your dashboard')</h5>
                </div>
                <div class="card-item__inner p-4">
                    <p>@lang('Hello') {{ $user->fullname }}, @lang('welcome to our spa management system.')</p>
                </div>
            </div>
        </div>
    </div>
@endsection
