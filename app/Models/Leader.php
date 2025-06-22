<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Leader extends Model
{

    protected $fillable = [
        'name',
        'designation',
        'email',
        'phone',
        'photo',
        'bio',
        'order'
    ];

    public function getPhotoUrlAttribute()
    {
        if ($this->photo) {
            if (filter_var($this->photo, FILTER_VALIDATE_URL)) {
                return $this->photo;
            }
            return asset('storage/' . $this->photo);
        }
        return 'https://via.placeholder.com/400x300?text=No+Image';
    }
    
}
