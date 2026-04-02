<?php

namespace Tests\Feature\Frontend;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use Illuminate\Support\Facades\Route;

class BookingInquiryTest extends TestCase
{
    use DatabaseTransactions;

    /** @test */
    public function contact_form_submit_validates_required_fields()
    {
        // Gửi ajax request lên route contact
        $route = Route::has('contact.submit') ? route('contact.submit') : '/contact_submit';
        
        $response = $this->postJson($route, [
            'name' => '', // Cố tình bỏ ngỏ dữ liệu
        ]);

        // Cần phải return errors validation
        $response->assertStatus(422)
                 ->assertJsonValidationErrors(['name', 'email', 'message']);
    }
}
