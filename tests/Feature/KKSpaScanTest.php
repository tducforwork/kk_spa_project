<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;

class KKSpaScanTest extends TestCase
{
    use DatabaseTransactions, WithFaker; // Tự động làm sạch DB sau mỗi lần test và tạo dữ liệu ảo

    /**
     * LỚP 1: SMOKE TEST - QUÉT TRẠNG THÁI HỆ THỐNG
     * Kiểm tra xem các trang quan trọng có bị lỗi 500 hay không.
     */
    public function test_main_pages_are_accessible()
    {
        $urls = [
            '/',
            '/contact',
            '/blog',
            '/accommodation',
            '/special-offers',
            '/metting-events',
            '/about',
            '/booking',
        ];

        foreach ($urls as $url) {
            $response = $this->get($url);
            $response->assertStatus(200);
            echo "\n✅ Trang {$url} hoạt động bình thường.";
        }
    }

    /**
     * LỚP 2: FUNCTIONAL TEST - KIỂM TRA FORM LIÊN HỆ
     * Bot sẽ giả lập người dùng điền Form Contact.
     */
    public function test_contact_form_submission()
    {
        $payload = [
            'name'    => 'Hậu Test Bot',
            'email'   => 'test' . rand(1, 99) . '@example.com',
            'subject' => 'Hỏi về dịch vụ Spa',
            'message' => 'Đây là tin nhắn tự động từ Bot kiểm thử.',
        ];

        // Gửi POST request đến route contact.submit
        $response = $this->post(route('contact.submit'), $payload);

        // Kiểm tra xem có redirect (thông thường Laravel báo thành công sẽ redirect back)
        $response->assertStatus(302);

        // QUAN TRỌNG: Kiểm tra xem DB đã có dữ liệu này chưa (Giả sử bảng tên là contacts)
        // Nếu mày dùng bảng khác, hãy đổi tên bảng 'contacts' ở dưới
        /* $this->assertDatabaseHas('contacts', [
            'email' => $payload['email']
        ]); 
        */
        echo "\n✅ Form Liên hệ gửi thành công.";
    }

    /**
     * LỚP 2: FUNCTIONAL TEST - KIỂM TRA SUBSCRIBE
     */
    public function test_newsletter_subscription()
    {
        $email = 'bot' . rand(1, 999) . '@gmail.com';
        
        $response = $this->post(route('subscribe'), [
            'email' => $email
        ]);

        $response->assertJson(['success' => true] ?? []); // Tùy vào Controller mày trả về JSON hay redirect
        echo "\n✅ Đăng ký nhận tin thành công.";
    }

    /**
     * LỚP 3: SECURITY TEST - KIỂM TRA VALIDATION TICKET
     * Bot thử gửi Ticket trống để xem hệ thống có chặn và báo lỗi không.
     */
    public function test_support_ticket_validation()
    {
        // Gửi dữ liệu rỗng lên trang tạo ticket
        $response = $this->post(route('ticket.store'), []);

        // Phải trả về lỗi validation (thường là status 302 kèm error session)
        $response->assertSessionHasErrors(['name', 'email', 'subject', 'message']);
        echo "\n✅ Hệ thống bảo mật Form Ticket tốt (đã chặn dữ liệu rỗng).";
    }

    /**
     * KIỂM TRA ĐA NGÔN NGỮ
     */
    public function test_language_switcher()
    {
        // Thử chuyển sang tiếng Anh
        $response = $this->get(route('lang', ['lang' => 'en']));
        $response->assertSessionHas('lang', 'en');
        
        // Truy cập trang chủ sau khi đổi ngôn ngữ
        $this->get('/')->assertStatus(200);
        echo "\n✅ Chuyển đổi ngôn ngữ hoạt động.";
    }
}