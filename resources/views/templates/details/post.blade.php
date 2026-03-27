@extends('Template::layouts.frontend')

@section('content')
    @include('Template::partials.detail_gallery')
    @include('Template::partials.breadcrumb')

    <section id="postDetails" class="single-post py-5">
        <div class="container">
            <div class="single-post-main ">
                <div class="d-flex align-items-center justify-content-center position-relative ">
                    <h1 class="single-post-section-title mb-0">
                        {{ __($post->t->name) }}
                    </h1>
                </div>

                @if ($post->t->toc && count($post->t->toc) > 0)
                    <div class="toc-card ">
                        <div class="toc-header">
                            <svg width="24" height="24" viewBox="0 0 24 24" fill="none"
                                xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                    d="M4.28571 15.4289C4.62671 15.4289 4.95373 15.5643 5.19485 15.8054C5.43597 16.0465 5.57143 16.3736 5.57143 16.7146C5.57143 17.0556 5.43597 17.3826 5.19485 17.6237C4.95373 17.8648 4.62671 18.0003 4.28571 18.0003C3.94472 18.0003 3.6177 17.8648 3.37658 17.6237C3.13546 17.3826 3 17.0556 3 16.7146C3 16.3736 3.13546 16.0465 3.37658 15.8054C3.6177 15.5643 3.94472 15.4289 4.28571 15.4289ZM19.7134 15.8574C20.1874 15.8574 20.5714 16.238 20.5714 16.7146C20.5714 17.1881 20.19 17.5717 19.7134 17.5717H7.71514C7.60245 17.572 7.49079 17.5501 7.3866 17.5072C7.2824 17.4642 7.18772 17.4011 7.10799 17.3215C7.02826 17.2418 6.96506 17.1472 6.92201 17.043C6.87896 16.9389 6.85692 16.8273 6.85714 16.7146C6.85714 16.241 7.23857 15.8574 7.71514 15.8574H19.7134ZM4.28571 11.1431C4.62671 11.1431 4.95373 11.2786 5.19485 11.5197C5.43597 11.7608 5.57143 12.0879 5.57143 12.4289C5.57143 12.7698 5.43597 13.0969 5.19485 13.338C4.95373 13.5791 4.62671 13.7146 4.28571 13.7146C3.94472 13.7146 3.6177 13.5791 3.37658 13.338C3.13546 13.0969 3 12.7698 3 12.4289C3 12.0879 3.13546 11.7608 3.37658 11.5197C3.6177 11.2786 3.94472 11.1431 4.28571 11.1431ZM19.7134 11.5717C20.1874 11.5717 20.5714 11.9523 20.5714 12.4289C20.5714 12.9024 20.19 13.286 19.7134 13.286H7.71514C7.60245 13.2863 7.49079 13.2644 7.3866 13.2215C7.2824 13.1785 7.18772 13.1154 7.10799 13.0358C7.02826 12.9561 6.96506 12.8615 6.92201 12.7573C6.87896 12.6532 6.85692 12.5415 6.85714 12.4289C6.85714 11.9553 7.23857 11.5717 7.71514 11.5717H19.7134ZM4.28571 6.85742C4.62671 6.85742 4.95373 6.99288 5.19485 7.234C5.43597 7.47512 5.57143 7.80214 5.57143 8.14314C5.57143 8.48413 5.43597 8.81116 5.19485 9.05227C4.95373 9.29339 4.62671 9.42885 4.28571 9.42885C3.94472 9.42885 3.6177 9.29339 3.37658 9.05227C3.13546 8.81116 3 8.48413 3 8.14314C3 7.80214 3.13546 7.47512 3.37658 7.234C3.6177 6.99288 3.94472 6.85742 4.28571 6.85742ZM19.7134 7.28599C20.1874 7.28599 20.5714 7.66656 20.5714 8.14314C20.5714 8.61671 20.19 9.00028 19.7134 9.00028H7.71514C7.60245 9.00062 7.49079 8.97868 7.3866 8.93574C7.2824 8.8928 7.18772 8.82969 7.10799 8.75004C7.02826 8.67039 6.96506 8.57577 6.92201 8.47162C6.87896 8.36747 6.85692 8.25583 6.85714 8.14314C6.85714 7.66956 7.23857 7.28599 7.71514 7.28599H19.7134Z"
                                    fill="#006A79" />
                            </svg>
                            <span class="toc-title">{{ __('Table of Contents') }}</span>
                            <i class="las la-angle-up toc-toggle-icon"></i>
                        </div>
                        <div class="toc-body mt-4">
                            <ol class="toc-list">
                                @foreach ($post->t->toc as $item)
                                    @if (@$item['target_id'] && @$item['title'])
                                        <li><a href="#{{ str_replace('#', '', $item['target_id']) }}"
                                                class="toc-link">{{ __($item['title']) }}</a></li>
                                    @endif
                                @endforeach
                            </ol>
                        </div>
                    </div>
                @endif


                <div class="room-content-box ">
                    {!! $post->t->content !!}
                </div>
            </div>
        </div>
    </section>
@endsection

@push('script')
    <script>
        (function($) {
            "use strict";

            // TOC Toggle
            $('.toc-header').on('click', function() {
                const body = $(this).next('.toc-body');
                const icon = $(this).find('.toc-toggle-icon');

                body.slideToggle(300);
                if (icon.hasClass('la-angle-up')) {
                    icon.removeClass('la-angle-up').addClass('la-angle-down');
                } else {
                    icon.removeClass('la-angle-down').addClass('la-angle-up');
                }
            });

            // TOC Smooth Scroll
            $('.toc-link').on('click', function(e) {
                e.preventDefault();

                const href = $(this).attr('href');
                const id = href.replace(/^#+/, ""); // Xóa bỏ ký tự # ở đầu nếu có

                // Thử tìm theo ID trước, nếu không thấy thì tìm theo Class làm dự phòng
                const target = document.getElementById(id) || document.querySelector("." + id);

                if (target) {
                    const offset = 120; // Khoảng cách offset cho menu sticky
                    const targetPosition = $(target).offset().top - offset;

                    $('html, body').stop().animate({
                        scrollTop: targetPosition
                    }, 500);

                    window.history.pushState(null, null, '#' + id);
                } else {
                    console.error("TOC error: Không tìm thấy tiêu đề với ID hoặc CLASS:", id);
                }
            });

        })(jQuery);
    </script>
@endpush
