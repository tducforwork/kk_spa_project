<?php

namespace Tests\Feature\Admin;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;
use App\Models\Admin;
use Illuminate\Support\Facades\Route;

class SpecialOfferTest extends TestCase
{
    use DatabaseTransactions;

    protected function setup_admin_user()
    {
        return Admin::first() ?? Admin::factory()->create();
    }

    /** @test */
    public function admin_can_view_special_offers()
    {
        $admin = $this->setup_admin_user();
        
        $route = Route::has('admin.special.offer.index') ? route('admin.special.offer.index') : '/admin/special-offers';
        $response = $this->actingAs($admin, 'admin')->get($route);

        $response->assertStatus(200);
    }

    /** @test */
    public function validation_fails_when_creating_offer_with_missing_data()
    {
        $admin = $this->setup_admin_user();

        $payload = [
            'title' => '',
        ];

        $route = Route::has('admin.special.offer.store') ? route('admin.special.offer.store') : '/admin/special-offers/store';
        
        $response = $this->actingAs($admin, 'admin')->post($route, $payload);
        $response->assertSessionHasErrors();
    }
}
