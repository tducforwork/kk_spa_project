<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Traits\Translatable;

class SpecialOffer extends Model
{
    use Translatable;

    protected $guarded = ['id'];

    public function translations()
    {
        return $this->hasMany(SpecialOfferTranslation::class, 'special_offer_id');
    }

    public function images()
    {
        return $this->hasMany(SpecialOfferImage::class, 'special_offer_id')->orderBy('type');
    }

    public function mainImages()
    {
        return $this->hasMany(SpecialOfferImage::class, 'special_offer_id')->where('type', 1);
    }

    public function introImages()
    {
        return $this->hasMany(SpecialOfferImage::class, 'special_offer_id')->where('type', 2);
    }

    public function admin()
    {
        return $this->belongsTo(Admin::class, 'admin_id');
    }
}
