<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PageTranslation extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'seo_content' => 'object'
    ];

    public function page()
    {
        return $this->belongsTo(Page::class, 'page_id');
    }
}
