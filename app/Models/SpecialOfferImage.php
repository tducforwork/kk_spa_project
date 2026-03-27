<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class SpecialOfferImage extends Model
{
    protected $guarded = ['id'];

    public function specialOffer()
    {
        return $this->belongsTo(SpecialOffer::class, 'special_offer_id');
    }
}
