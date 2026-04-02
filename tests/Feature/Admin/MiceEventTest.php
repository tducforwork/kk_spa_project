<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;
use App\Models\MiceEvent;
use Illuminate\Support\Facades\Route;

class MiceEventTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin_user()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function admin_can_view_mice_event_list()
    {
        $admin = $this->setup_admin_user();
        
        $route = Route::has('admin.mice.event.index') ? route('admin.mice.event.index') : '/admin/mice-events';
        $response = $this->actingAs($admin, 'admin')->get($route);

        $response->assertStatus(200);
    }

    /** @test */
    public function validation_fails_when_creating_mice_event_with_missing_data()
    {
        $admin = $this->setup_admin_user();

        $payload = [
            'name' => '', // Cố tình thiếu dữ liệu
        ];

        $route = Route::has('admin.mice.event.store') ? route('admin.mice.event.store') : '/admin/mice-events/store';
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);

        $response->assertSessionHasErrors();
    }
}
