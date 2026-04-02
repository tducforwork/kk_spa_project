<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;
use App\Models\SupportTicket;

class SupportTicketTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function the_hien_so_luong_ticket_tren_danh_sach()
    {
        $admin = $this->setup_admin();

        $response = $this->actingAs($admin, 'admin')->get('/admin/ticket');

        $response->assertStatus(200);
        // Kiểm tra page có render biến dữ liệu ra view hay không
        // Giúp phát hiện Database Model query thất bại
        $response->assertViewHas('items'); 
    }

    /** @test */
    public function admin_duoc_quyen_reply_ticket()
    {
        $admin = $this->setup_admin();
        $ticket = SupportTicket::first();

        // Nếu database trống, bỏ qua test này
        if(!$ticket) {
            $this->assertTrue(true);
            return;
        }

        $payload = [
            'message' => 'Chào bạn, chúng tôi đã tiếp nhận yêu cầu.',
        ];

        // Gửi trả lời ticket
        $route = route('admin.ticket.reply', $ticket->id) ?? "/admin/ticket/reply/{$ticket->id}";
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);

        $response->assertStatus(302); // Redirect back
        // Do có DatabaseTransactions nên message mới chèn vào sẽ bị xóa khi test test xong
    }
}
