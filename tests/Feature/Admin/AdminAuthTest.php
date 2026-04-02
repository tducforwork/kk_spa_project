<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;

class AdminAuthTest extends TestCase
{
    use DatabaseTransactions;

    /** @test */
    public function no_the_truy_cap_trang_login_admin()
    {
        // Giả sử route prefix là admin/
        $response = $this->get('/admin');

        // Phải trả về trang đăng nhập hoặc redirect tới trang login
        $response->assertStatus(200);
        $response->assertSee('name="username"', false);
    }

    /** @test */
    public function no_tu_choi_dang_nhap_khi_sai_thong_tin()
    {
        $response = $this->post('/admin', [
            'username' => 'sai_user_name_' . rand(1, 999),
            'password' => 'sai_mat_khau',
        ]);

        // Login fail sẽ redirect về trang cũ kèm error messages
        $response->assertStatus(302);
        // Kiểm tra xem session có chứa lỗi không (hoặc không login được)
        $this->assertGuest('admin');
    }

    /** @test */
    public function chuyen_huong_khi_user_thu_vao_dashboard()
    {
        // Chưa đăng nhập mà truy cập admin dashboard
        $response = $this->get('/admin/dashboard');

        // Phải bị đẩy về trang đăng nhập
        $response->assertRedirect('/admin');
    }
}
