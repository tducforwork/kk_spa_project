<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;

abstract class TestCase extends BaseTestCase
{
    // Cấu hình cho con Bot của mày
    protected function setUp(): void
    {
        parent::setUp();

        // Ép dự án dùng tiếng Việt để Bot quét bản dịch
        session(['locale' => 'vi']);
        app()->setLocale('vi');
    }
}
