<!-- Mobile Sidebar -->
<div class="sidebarover-lay">

</div>
<div class="mobile-sidebar d-lg-none">
    <div class="mobile-sidebar-header">
        <button class="sidebar-close"><i class="las la-times"></i></button>
    </div>
    <div class="mobile-sidebar-body">
        <ul class="mobile-menu">
            @php
                $all_menus = array_merge($menu_left, $menu_right);
            @endphp
            @foreach ($all_menus as $item)
                <li class="mobile-menu-item {{ count($item['children']) > 0 ? 'has-dropdown' : '' }}">
                    <div class="menu-link-wrapper">
                        <a href="{{ url($item['url']) }}" class="mobile-menu-link">{{ __($item['title']) }}</a>
                        @if (count($item['children']) > 0)
                            <span class="submenu-toggler"><i class="fa-solid fa-chevron-down"></i></span>
                        @endif
                    </div>
                    @if (count($item['children']) > 0)
                        <ul class="mobile-submenu">
                            @foreach ($item['children'] as $child)
                                <li><a href="{{ url($child['url']) }}">{{ __($child['title']) }}</a></li>
                            @endforeach
                        </ul>
                    @endif
                </li>
            @endforeach
            {{-- <li class="mobile-menu-item mt-4">
                <a href="#" class="mobile-menu-link "
                    style="font-size: 16px; text-transform: none;">@lang('Terms & Conditions')</a>
            </li> --}}
        </ul>
    </div>
</div>
