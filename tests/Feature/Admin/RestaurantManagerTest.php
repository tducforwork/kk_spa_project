<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Http\UploadedFile;
use Illuminate\Support\Facades\Storage;
use Tests\TestCase;
use App\Models\Admin;

class RestaurantManagerTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function validation_chi_chap_nhan_file_pdf_menu()
    {
        $admin = $this->setup_admin();

        // Tạo fake disk cho an toàn
        Storage::fake('local');

        // Gửi một file giả mạo mạo danh PDF nhưng thực thể là TXT
        $file = UploadedFile::fake()->create('menu_gia.txt', 100);

        $payload = [
            'name' => 'Menu Thử Nghiệm',
            'menu_pdf' => $file,
        ];

        // Gửi request tới controller cập nhật menu (Route cần thay đổi tên cho đúng)
        $route = route('admin.restaurant.menu.store') ?? '/admin/restaurant/menu/store';
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);

        // Chắc chắn hệ thống phải phát hiện PDF rởm và báo lỗi (validation fail)
        $response->assertSessionHasErrors();
    }
}
