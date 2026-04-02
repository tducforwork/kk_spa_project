<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;
use Illuminate\Support\Facades\Route;

class FacilityTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin_user()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function admin_can_view_facilities()
    {
        $admin = $this->setup_admin_user();
        
        $route = Route::has('admin.facility.index') ? route('admin.facility.index') : '/admin/facilities';
        $response = $this->actingAs($admin, 'admin')->get($route);

        $response->assertStatus(200);
    }

    /** @test */
    public function validation_fails_when_creating_facility_with_missing_data()
    {
        $admin = $this->setup_admin_user();

        $payload = ['name' => ''];

        $route = Route::has('admin.facility.store') ? route('admin.facility.store') : '/admin/facilities/store';
        
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);
        $response->assertSessionHasErrors();
    }
}
