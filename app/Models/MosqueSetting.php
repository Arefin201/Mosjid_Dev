<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class MosqueSetting extends Model
{
     use HasFactory;

    protected $fillable = [
        'mosque_name',
        'contact_phone',
        'email',
        'address',
        'footer_message',
        'language',
    ];
}
