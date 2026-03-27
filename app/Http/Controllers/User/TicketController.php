<?php

namespace App\\Http\\Controllers\\User;

use App\Http\Controllers\Controller;
use App\Traits\SupportTicketManager;

class TicketController extends Controller
{
    use SupportTicketManager;

    public function __construct()
    {
        parent::__construct();
        $this->layout = 'master';
        $this->redirectLink = 'User.ticket.view';
        $this->userType     = 'user';
        $this->column       = 'User_id';
        $this->user = auth()->guard('user')->user();
        if ($this->user) {
            $this->layout = 'master';
        }
    }
}
