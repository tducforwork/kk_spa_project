@extends('admin.layouts.app')
@section('panel')
    <div class="row gy-4">
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" link="{{ route('admin.report.login.history') }}?search={{ $user->username }}"
                      title="Total Logins" icon="las la-list-alt" value="{{ $user->loginLogs->count() }}" bg="primary" />
        </div>
        <div class="col-xxl-3 col-sm-6">
            <x-widget style="6" link="{{ route('admin.users.notification.log', $user->id) }}"
                      title="Total Notifications" icon="las la-bell" value="{{ $user->allNotifications->count() }}"
                      bg="success" />
        </div>
    </div>
    <div class="d-flex flex-wrap gap-3 mt-4">
        <div class="flex-fill">
            <a href="{{ route('admin.report.login.history') }}?search={{ $user->username }}"
               class="btn btn--primary btn--shadow w-100 btn-lg">
                <i class="las la-list-alt"></i>@lang('Logins')
            </a>
        </div>
        <div class="flex-fill">
            <a href="{{ route('admin.users.notification.log', $user->id) }}"
               class="btn btn--secondary btn--shadow w-100 btn-lg">
                <i class="las la-bell"></i>@lang('Notifications')
            </a>
        </div>
        <div class="flex-fill">
            @if ($user->status == Status::USER_ACTIVE)
                <button type="button" class="btn btn--warning btn--gradi btn--shadow w-100 btn-lg userStatus"
                        data-bs-toggle="modal" data-bs-target="#userStatusModal">
                    <i class="las la-ban"></i>@lang('Ban User')
                </button>
            @else
                <button type="button" class="btn btn--success btn--gradi btn--shadow w-100 btn-lg userStatus"
                        data-bs-toggle="modal" data-bs-target="#userStatusModal">
                    <i class="las la-undo"></i>@lang('Unban User')
                </button>
            @endif
        </div>
    </div>
    <div class="card mt-30">
        <div class="card-header">
            <h5 class="card-title mb-0">@lang('User Image')</h5>
        </div>
        <div class="card-body">
            <div class="row gy-4 justify-content-center">
                <div class="col-xl-3 col-lg-5 col-md-5">
                    <div class="image-upload-wrapper">
                        <div class="image-upload-preview">
                            <img src="{{ getProfileImage($user->image, 'user') }}" alt="User image">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <form action="{{ route('admin.users.update', [$user->id]) }}" method="POST">
        @csrf
        <div class="card mt-4">
            <div class="card-header">
                <h5 class="card-title mb-0">@lang('Basic Information')</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-control-label">@lang('First Name')</label>
                            <input class="form-control" type="text" name="firstname" required
                                   value="{{ $user->firstname }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-control-label">@lang('Last Name')</label>
                            <input class="form-control" type="text" name="lastname" required
                                   value="{{ $user->lastname }}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>@lang('Username') </label>
                            <input class="form-control" readonly value="{{ $user->username }}" required>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>@lang('Email') </label>
                            <input class="form-control" name="email" value="{{ $user->email }}" required>
                        </div>
                    </div>
                    <div class="form-group col-md-4">
                        <label>@lang('Mobile Number')</label>
                        <div class="input-group ">
                            <span class="input-group-text mobile-code"></span>
                            <input type="number" name="mobile" value="{{ $user->mobile }}" id="mobile"
                                   class="form-control checkUser" required>
                        </div>
                    </div>

                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label>@lang('Email Verification')</label>
                            <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger"
                                   data-bs-toggle="toggle" data-on="@lang('Verified')" data-off="@lang('Unverified')"
                                   name="ev" @checked($user->ev)>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label>@lang('Mobile Verification')</label>
                            <input type="checkbox" data-width="100%" data-onstyle="-success" data-offstyle="-danger"
                                   data-bs-toggle="toggle" data-on="@lang('Verified')" data-off="@lang('Unverified')"
                                   name="sv" @checked($user->sv)>
                        </div>
                    </div>
                    <div class="col-lg-4 col-md-6">
                        <div class="form-group">
                            <label>@lang('2FA Verification') </label>
                            <input type="checkbox" data-width="100%" data-height="50" data-onstyle="-success"
                                   data-offstyle="-danger" data-bs-toggle="toggle" data-on="@lang('Enable')"
                                   data-off="@lang('Disable')" name="ts" @checked($user->ts)>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-4">
            <div class="card-header">
                <h5 class="card-title mb-0">@lang('Address')</h5>
            </div>
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>@lang('Address')</label>
                            <input class="form-control" type="text" name="address"
                                   value="{{ @$user->address }}">
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label>@lang('City')</label>
                            <input class="form-control" type="text" name="city" value="{{ @$user->city }}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>@lang('State')</label>
                            <input class="form-control" type="text" name="state" value="{{ @$user->state }}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>@lang('Zip/Postal')</label>
                            <input class="form-control" type="text" name="zip" value="{{ @$user->zip }}">
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="form-group">
                            <label>@lang('Country')</label>
                            <select name="country" class="form-control select2">
                                @foreach ($countries as $key => $country)
                                    <option @selected(old('country', @$user->country_code) == $key) data-mobile_code="{{ $country->dial_code }}" value="{{ $key }}">
                                        {{ __($country->country) }}
                                    </option>
                                @endforeach
                            </select>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card mt-4">
            <div class="card-body">
                <button type="submit" class="btn--primary btn h-45 w-100">@lang('Submit')</button>
            </div>
        </div>
    </form>

    <div id="userStatusModal" class="modal fade">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">
                        {{ $user->status == Status::USER_ACTIVE ? trans('Ban User') : trans('Unban User') }}
                    </h5>
                    <button type="button" class="close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="las la-times"></i>
                    </button>
                </div>
                <form action="{{ route('admin.users.status', $user->id) }}" method="POST">
                    @csrf
                    <div class="modal-body">
                        @if ($user->status == Status::USER_ACTIVE)
                            <h6 class="mb-2">@lang('If you ban this User he/she won\'t be able to access his/her dashboard.')</h6>
                            <div class="form-group">
                                <label>@lang('Reason')</label>
                                <textarea class="form-control" name="reason" rows="4" required></textarea>
                            </div>
                        @else
                            <p><span>@lang('Ban reason was'):</span></p>
                            <p>{{ $user->ban_reason }}</p>
                            <h4 class="text-center mt-3">@lang('Are you sure to unban this Users?')</h4>
                        @endif
                    </div>
                    <div class="modal-footer">
                        @if ($user->status == Status::USER_ACTIVE)
                            <button type="submit" class="btn btn--primary h-45 w-100">@lang('Submit')</button>
                        @else
                            <button type="button" class="btn btn--dark"
                                    data-bs-dismiss="modal">@lang('No')</button>
                            <button type="submit" class="btn btn--primary">@lang('Yes')</button>
                        @endif
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@push('breadcrumb-plugins')
    <a href="{{ route('admin.users.login', $user->id) }}" target="_blank"
       class="btn btn-sm btn-outline--primary">
        <i class="las la-sign-in-alt"></i>@lang('Login as User')
    </a>
@endpush

@push('script')
    <script>
        (function($) {
            "use strict";

            let mobileElement = $('.mobile-code');
            $('select[name=country]').on('change', function() {
                mobileElement.text(`+${$('select[name=country] :selected').data('mobile_code')}`);
            });

            $('select[name=country]').val('{{ @$user->country_code }}');
            let dialCode = $('select[name=country] :selected').data('mobile_code');
            let mobileNumber = `{{ $user->mobile }}`;
            mobileNumber = mobileNumber.replace(dialCode, '');
            $('input[name=mobile]').val(mobileNumber);
            mobileElement.text(`+${dialCode}`);

        })(jQuery);
    </script>
@endpush


@push('style')
    <style>
        .image-upload-preview {
            border-radius: 10px;
            overflow: hidden;
        }

        .image-upload-preview img {
            width: 100%;
            height: 100%;
        }

        .image-upload-wrapper {
            max-width: 350px;
            margin: 0 auto;
        }

        @media (max-width:424px) {
            .image-upload-wrapper {
                height: 200px;
            }
        }
    </style>
@endpush
