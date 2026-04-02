<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;

class FrontendContentTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin_user()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function admin_can_view_seo_configuration()
    {
        $admin = $this->setup_admin_user();
        
        $response = $this->actingAs($admin, 'admin')->get(route('admin.frontend.seo'));

        $response->assertStatus(200);
    }

    /** @test */
    public function admin_can_view_frontend_sections_settings()
    {
        $admin = $this->setup_admin_user();
        
        // Truy cập page 'banner' section
        $response = $this->actingAs($admin, 'admin')->get(route('admin.frontend.sections', 'banner'));

        $response->assertStatus(200);
    }
}
