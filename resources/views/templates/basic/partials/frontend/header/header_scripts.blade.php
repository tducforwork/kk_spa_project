@push('script')
    <script>
        (function($) {
            "use strict";

            // Weather for Hanoi
            function fetchHanoiWeather() {
                const url =
                    "https://api.open-meteo.com/v1/forecast?latitude=21.0285&longitude=105.8542&current_weather=true";
                $.getJSON(url, function(data) {
                    if (data && data.current_weather) {
                        const temp = Math.round(data.current_weather.temperature);
                        $('#hanoi-weather .temp').text(temp + '°C');
                    }
                }).fail(function() {
                    $('#hanoi-weather .temp').text('24°C'); // Fallback
                });
            }

            if ($('#hanoi-weather').length > 0) {
                fetchHanoiWeather();
            }

            $('.navbar-toggler, .booking-menu-btn').on('click', function() {
                $('.mobile-sidebar').addClass('show');
                $('.sidebarover-lay').addClass('show');
            });

            $('.sidebar-close, .sidebarover-lay').on('click', function() {
                $('.mobile-sidebar').removeClass('show');
                $('.sidebarover-lay').removeClass('show');
            });

            $('.submenu-toggler').on('click', function() {
                $(this).parent().next('.mobile-submenu').slideToggle();
                $(this).toggleClass('active');
            });

            $('.search-btn').on('click', function(e) {
                e.preventDefault();
                $('.search-dropdown').toggleClass('active');
            });

            $(document).on('click', function(e) {
                if (!$(e.target).closest('.search-item').length) {
                    $('.search-dropdown').removeClass('active');
                }
            });
        })(jQuery);
    </script>
@endpush
