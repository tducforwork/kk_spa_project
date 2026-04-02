<?php

namespace App\Constants;

class FileInfo
{
    /*
    |--------------------------------------------------------------------------
    | File Information
    |--------------------------------------------------------------------------
    |
    | This class basically contain the path of files and size of images.
    | All information are stored as an array. Developer will be able to access
    | this info as method and property using FileManager class.
    |
     */

    public function fileInfo()
    {
        $data['verify'] = [
            'path' => 'assets/verify',
        ];
        $data['default'] = [
            'path' => 'assets/images/default.png',
        ];
        $data['ticket'] = [
            'path' => 'assets/support',
        ];
        $data['logoIcon'] = [
            'path' => 'assets/images/logo_icon',
        ];
        $data['favicon'] = [
            'size' => '128x128',
        ];
        $data['extensions'] = [
            'path' => 'assets/images/extensions',
            'size' => '36x36',
        ];
        $data['seo'] = [
            'path' => 'assets/images/seo',
            'size' => '1180x600',
        ];
        $data['userProfile'] = [
            'path' => 'assets/images/user/profile',
            'size' => '300x300',
        ];
        $data['adminProfile'] = [
            'path' => 'assets/admin/images/profile',
            'size' => '400x400',
        ];
        $data['push'] = [
            'path' => 'assets/images/push_notification',
        ];
        $data['appPurchase'] = [
            'path' => 'assets/in_app_purchase_config',
        ];
        $data['maintenance'] = [
            'path' => 'assets/images/maintenance',
            'size' => '660x325',
        ];
        $data['language'] = [
            'path' => 'assets/images/language',
            'size' => '50x50',
        ];
        $data['gateway'] = [
            'path' => 'assets/images/gateway',
            'size' => '',
        ];
        $data['withdrawMethod'] = [
            'path' => 'assets/images/withdraw_method',
            'size' => '',
        ];
        $data['pushConfig'] = [
            'path' => 'assets/admin',
        ];
        $data['user'] = [
            'path' => 'assets/images/User',
            'size' => '300x300',
        ];
        $data['user'] = [
            'path' => 'assets/images/user/profile',
            'size' => '350x300',
        ];
        $data['category'] = [
            'path' => 'assets/images/category',
            'size' => '50x50',
        ];
        $data['resume'] = [
            'path' => 'assets/files/resume',
        ];
        $data['role'] = [
            'path' => 'assets/images/role',
            'size' => '50x50',
        ];

        // New Module Info
        $data['post_category'] = [
            'path' => 'assets/images/post/category',
            'size' => '600x400',
        ];
        $data['post'] = [
            'path' => 'assets/images/post',
            'size' => '',
        ];
        $data['room_category'] = [
            'path' => 'assets/images/room/category',
            'size' => '600x400',
        ];
        $data['room'] = [
            'path' => 'assets/images/room',
            'size' => '',
        ];
        $data['room_icon'] = [
            'path' => 'assets/images/room/icon',
            'size' => '200x200',
        ];
        $data['restaurant_category'] = [
            'path' => 'assets/images/restaurant/category',
            'size' => '600x400',
        ];
        $data['restaurant'] = [
            'path' => 'assets/images/restaurant',
            'size' => '',
        ];
        $data['restaurant_chef'] = [
            'path' => 'assets/images/restaurant/chef',
            'size' => '400x400',
        ];
        $data['restaurant_menu'] = [
            'path' => 'assets/images/restaurant/menu',
            'size' => '400x400',
        ];
        $data['restaurant_menu_pdf'] = [
            'path' => 'assets/files/restaurant/menu',
        ];
        $data['special_offer'] = [
            'path' => 'assets/images/special_offer',
            'size' => '',
        ];
        $data['mice_event'] = [
            'path' => 'assets/images/mice_event',
            'size' => '',
        ];
        $data['facility'] = [
            'path' => 'assets/images/facility',
            'size' => '',
        ];
        $data['hero_slider'] = [
            'path' => 'assets/images/frontend/hero_slider',
            'size' => '',
        ];
        $data['booking_features'] = [
            'path' => 'assets/images/frontend/booking_features',
            'size' => '',
        ];

        return $data;
    }
}
