<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class MonthlyCollection extends Model
{
    use HasFactory;

    protected $fillable = [
        'collection_date',
        'total_amount',
        'category',
        'notes'
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'collection_date' => 'date',
        'total_amount' => 'decimal:2',
        'created_at' => 'datetime',
        'updated_at' => 'datetime',
    ];

    /**
     * Get the formatted collection date.
     */
    public function getFormattedCollectionDateAttribute()
    {
        return $this->collection_date->format('F Y');
    }

    /**
     * Get the formatted amount with currency.
     */
    public function getFormattedAmountAttribute()
    {
        return '৳' . number_format($this->total_amount, 2);
    }

    /**
     * Get the category label.
     */
    public function getCategoryLabelAttribute()
    {
        $categories = [
            'monthly_chanda' => 'Monthly Chanda',
            'zakat' => 'Zakat',
            'fitrah' => 'Fitrah',
            'mosque_fund' => 'Mosque Fund',
            'other' => 'Other'
        ];

        return $categories[$this->category] ?? ucfirst(str_replace('_', ' ', $this->category));
    }

    /**
     * Scope a query to filter by month and year.
     */
    public function scopeByMonth($query, $month, $year)
    {
        return $query->whereMonth('collection_date', $month)
                    ->whereYear('collection_date', $year);
    }

    /**
     * Scope a query to filter by category.
     */
    public function scopeByCategory($query, $category)
    {
        return $query->where('category', $category);
    }

    /**
     * Get collections for the current month.
     */
    public function scopeCurrentMonth($query)
    {
        return $query->whereMonth('collection_date', now()->month)
                    ->whereYear('collection_date', now()->year);
    }
}