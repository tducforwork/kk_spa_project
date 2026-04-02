<?php

namespace Tests\Feature\Frontend;

use Tests\TestCase;

class PageRoutingTest extends TestCase
{
    /** @test */
    public function frontend_homepage_loads_successfully()
    {
        $response = $this->get('/');
        $response->assertStatus(200);
    }

    /** @test */
    public function frontend_accommodation_loads_successfully()
    {
        $response = $this->get('/accommodation');
        $response->assertStatus(200);
    }

    /** @test */
    public function frontend_contact_loads_successfully()
    {
        $response = $this->get('/contact-us');
        $response->assertStatus(200);
    }
}
