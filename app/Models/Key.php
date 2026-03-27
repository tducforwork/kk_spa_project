<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Key extends Model
{
    protected $guarded = ['id'];

    const TYPE_CATEGORY_POST = 1;
    const TYPE_POST = 2;
    const TYPE_CATEGORY_ROOM = 3;
    const TYPE_ROOM = 4;
    const TYPE_CATEGORY_RESTAURANT = 5;
    const TYPE_RESTAURANT = 6;
    const TYPE_MICE_EVENT = 7;
    const TYPE_FACILITY = 8;
    const TYPE_SPECIAL_OFFER = 9;
    const TYPE_PAGE = 10;
}
