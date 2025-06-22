<?php

// app/Models/HomeBanner.php
namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomeBanner extends Model
{
    use HasFactory;

    protected $table = 'home_banners';
    
    protected $fillable = [
        'title',
        'subtitle',
        'button_text',
        'button_link',
        'banner_image'
    ];

    // Accessor for image URL
    public function getImageUrlAttribute()
    {
        return $this->banner_image ? asset('storage/' . $this->banner_image) : null;
    }
}
