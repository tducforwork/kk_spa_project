<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;

class GeneralSettingTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function the_hien_form_cai_dat_he_thong()
    {
        $admin = $this->setup_admin();

        $response = $this->actingAs($admin, 'admin')->get('/admin/setting');

        // Bắt buộc quyền truy cập cấu hình phải được cho phép
        $response->assertStatus(200);
    }

    /** @test */
    public function cap_nhat_cai_dat_he_thong_khong_bao_loi()
    {
        $admin = $this->setup_admin();

        // Gửi payload hợp lệ đến post update
        $payload = [
            'site_name' => 'KK Spa Test ' . rand(10, 99),
            'base_color' => 'ff0000',
            // Các dữ liệu khác giả sử
        ];

        // Do route name setup của laramin
        $route = route('admin.setting.update') ?? '/admin/setting/update';
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);

        // Chờ đợi 302 sau khi update db xong
        $response->assertStatus(302);
        
        // Data sẽ không đọng lại DB thực sự nhờ có DatabaseTransactions
    }
}
