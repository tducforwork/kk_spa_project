<?php

namespace App\Models;

use App\Constants\Status;
use App\Traits\Translatable;
use Illuminate\Database\Eloquent\Model;

class Page extends Model
{
    use Translatable;

    protected $casts = [
        'seo_content' => 'object'
    ];

    public function scopeNotDefault($query)
    {
        return $query->where('is_default', Status::NO);
    }

    public function translations()
    {
        return $this->hasMany(PageTranslation::class, 'page_id');
    }
}
