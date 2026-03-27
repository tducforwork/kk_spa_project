@extends('Template::user.layouts.master')
@section('content')
    <div class="company-profile-wrapper">
        <form class="disableSubmission w-100" action="{{ route('user.profile.submit') }}" method="POST"
              enctype="multipart/form-data">
            @csrf

            <div class="card-item">
                <div class="card-item__header">
                    <h6 class="card-item__title">@lang('Personal Information')</h6>
                </div>
                <div class="card-item__inner">
                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <div class="company-profile-thumb-wrapper">
                                    <div class="company-profile-thumb">
                                        <div class="thumb">
                                            <img id="imagePreview"
                                                 src="{{ getImage(getFilePath('user') . '/' . @$user->image, getFileSize('user')) }}"
                                                 alt="profile-image">
                                        </div>
                                        <div class="company-profile-thumb__btn">
                                            <div class="file-upload">
                                                <label class="edit" for="image"> <i class="las la-camera"></i>
                                                </label>
                                                <input class="form-control form--control" id="image"
                                                       name="image" type="file" hidden=""
                                                       accept=".jpg,.jpeg,.png">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="content">
                                        <p class="label">@lang('Profile Image')</p>
                                        <p class="description">@lang('Supported formats: PNG, JPG, JPEG. Max file size: 2 MB.')</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="form--label">@lang('First Name')</label>
                                <input class="form--control" name="firstname" type="text"
                                       value="{{ old('firstname', @$user->firstname) }}" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="form--label">@lang('Last Name')</label>
                                <input class="form--control" name="lastname" type="text"
                                       value="{{ old('lastname', @$user->lastname) }}" required>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="form--label">@lang('Email')</label>
                                <input class="form--control" type="email" value="{{ @$user->email }}"
                                       readonly>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="form-group">
                                <label class="form--label">@lang('Phone')</label>
                                <input class="form--control" type="text"
                                       value="{{ @$user->mobileNumber }}" readonly>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card-item">
                <div class="card-item__header">
                    <h6 class="card-item__title">@lang('Address Information')</h6>
                </div>
                <div class="card-item__inner">
                    <div class="row gy-4">
                        <div class="col-sm-6">
                            <label class="form--label">@lang('Address')</label>
                            <input class="form--control" name="address" type="text" value="{{ old('address', @$user->address) }}">
                        </div>
                        <div class="col-sm-6">
                            <label class="form--label">@lang('City')</label>
                            <input class="form--control" name="city" type="text" value="{{ old('city', @$user->city) }}">
                        </div>
                        <div class="col-sm-6">
                            <label class="form--label">@lang('Zip Code')</label>
                            <input class="form--control" name="zip" type="text" value="{{ old('zip', @$user->zip) }}">
                        </div>
                        <div class="col-sm-6">
                            <label class="form--label">@lang('State')</label>
                            <input class="form--control" name="state" type="text" value="{{ old('state', @$user->state) }}">
                        </div>
                    </div>
                </div>
            </div>

            <div class="company-profile-wrapper__btn justify-content-end">
                <button class="btn btn--base btn--lg" type="submit">@lang('Submit')</button>
            </div>
        </form>
    </div>
@endsection

@push('script')
    <script>
        $(document).ready(function() {
            "use strict";

            $('#image').on('change', function(e) {
                const file = e.target.files[0];
                const preview = $('#imagePreview');
                if (file) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        preview.attr('src', e.target.result);
                    };
                    reader.readAsDataURL(file);
                }
            });
        });
    </script>
@endpush
