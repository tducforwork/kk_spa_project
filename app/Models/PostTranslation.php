<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PostTranslation extends Model
{
    protected $guarded = ['id'];

    protected $casts = [
        'toc' => 'array',
    ];

    public function post()
    {
        return $this->belongsTo(Post::class, 'post_id');
    }
}
