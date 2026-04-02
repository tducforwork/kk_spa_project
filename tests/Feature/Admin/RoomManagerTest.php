<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;
use Illuminate\Support\Facades\Route;

class RoomManagerTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin_user()
    {
        // Lấy admin đầu tiên trong DB để test chức năng nội bộ
        // (Vẫn an toàn vì DatabaseTransactions sẽ roll-back mọi thao tác data)
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function vao_trang_danh_sach_phong()
    {
        $admin = $this->setup_admin_user();

        // Acting as admin
        $response = $this->actingAs($admin, 'admin')->get(route('admin.hotel.room.index'));

        // Kiểm tra page tải thành công thay vì lỗi màn hình
        if ($response->status() != 200) {
            // Fallback trong trường hợp route name khác
            $response = $this->actingAs($admin, 'admin')->get('/admin/hotel/room');
        }

        $response->assertStatus(200);
    }

    /** @test */
    public function validation_khi_tao_phong_moi_thieu_du_lieu()
    {
        $admin = $this->setup_admin_user();

        $payload = [
            // Cố tình bỏ ngỏ dữ liệu
            'room_number' => '',
            'price' => '',
        ];

        // Lấy route store (cần đổi theo đúng tên route của bạn)
        $route = Route::has('admin.hotel.room.store') ? route('admin.hotel.room.store') : '/admin/hotel/room/store';
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);

        // Expect validation errors
        $response->assertSessionHasErrors();
    }
}
