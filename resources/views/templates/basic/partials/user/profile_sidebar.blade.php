@php
@endphp
<div class="profile-sidebar">
    <span class="profile-sidebar__close"><i class="las la-times"></i></span>
    <div class="profile-sidebar__top">
        <div class="profile-details">
            <a href="{{ route('user.home') }}" class="profile-details__link">
                <img src="{{ getProfileImage($activeUser->image) }}" alt="image">
            </a>
        </div>
        <div class="profile-info">
            <h5 class="profile-info__title">{{ $activeUser->fullname }}</h5>
            <a href="{{ route('user.profile.setting') }}" class="profile-info__link">
                @lang('Update Profile')
            </a>
        </div>
    </div>
    <div class="performance">
        <ul class="menu-list">
            <li class="menu-list__item">
                <a href="{{ route('user.home') }}" class="menu-list__link {{ menuActive('user.home') }}">
                    <span class="icon"><i class="las la-home"></i></span>
                    @lang('Dashboard')
                </a>
            </li>
            <li class="menu-list__item">
                <a href="{{ route('user.profile.setting') }}"
                   class="menu-list__link {{ menuActive('user.profile.setting') }}">
                    <span class="icon"><i class="las la-user"></i></span>
                    @lang('Profile Setting')
                </a>
            </li>
            <li class="menu-list__item">
                <a href="{{ route('user.change.password') }}"
                   class="menu-list__link {{ menuActive('user.change.password') }}">
                    <span class="icon"><i class="las la-key"></i></span>
                    @lang('Change Password')
                </a>
            </li>
            <li class="menu-list__item">
                <a href="{{ route('user.twofactor') }}" class="menu-list__link {{ menuActive('user.twofactor') }}">
                    <span class="icon"><i class="las la-user-shield"></i></span>
                    @lang('2FA Security')
                </a>
            </li>
            <li class="menu-list__item">
                <a href="{{ route('user.logout') }}" class="menu-list__link">
                    <span class="icon"> <i class="las la-sign-out-alt"></i> </span>
                    @lang('Logout')
                </a>
            </li>
        </ul>
    </div>
</div>
