<?php

namespace Tests\Feature;

use Tests\TestCase;

class FrontendScanTest extends TestCase
{
    /** @test */
    public function bot_quet_trang_chu_va_cac_module_chinh()
    {
        // 1. Bot truy cập trang chủ
        $response = $this->get('/');

        // Kiểm tra xem trang có bị lỗi 500 không (phải trả về 200 OK)
        $response->assertStatus(200);

        // 2. Kiểm tra xem các từ khóa quan trọng của KK SPA có hiển thị không
        // Mày có thể đổi các chữ 'Spa', 'Room' thành nội dung thực tế trên web của mày
        $response->assertSee('Spa');
        $response->assertSee('Phòng');

        // 3. Kiểm tra xem có SEO Meta Title không
        $response->assertSee('<title>', false);
    }

    /** @test */
    public function bot_kiem_tra_loi_404_khi_vao_link_bay()
    {
        // Thử vào một link không tồn tại xem hệ thống có trả về 404 chuẩn không
        $response = $this->get('/link-nay-khong-co-that');
        $response->assertStatus(404);
    }
}
