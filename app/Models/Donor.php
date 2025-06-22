<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Donor extends Model
{
    protected $table = 'donors_tables';
    protected $guarded = [];

    // Add this to your Donor model
    protected $casts = [
        'last_paid' => 'date',
        'start_date' => 'date',
        'amount' => 'decimal:2'
    ];

    // Add this accessor for edit URL
    public function getEditUrlAttribute()
    {
        return route('admin.donors.edit', $this);
    }
}
