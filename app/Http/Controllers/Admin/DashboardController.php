<?php

namespace App\Http\Controllers\Admin;

use App\Models\Donor;
use App\Models\PrayerTime;
use App\Models\Announcement;
use App\Models\MonthlyCollection; // Added MonthlyCollection model
use App\Http\Controllers\Controller;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class DashboardController extends Controller
{
    public function index()
    {
        try {
            DB::connection()->getPdo();

            // Calculate stats
            $currentMonth = Carbon::now()->month;
            $currentYear = Carbon::now()->year;
            
            $stats = [
                'donors' => Donor::count(),
                'announcements' => Announcement::count(),
                'monthly_collection' => MonthlyCollection::whereYear('collection_date', $currentYear)
                                            ->whereMonth('collection_date', $currentMonth)
                                            ->sum('total_amount'),
            ];

            $prayerTimes = PrayerTime::first();
            $recentDonors = Donor::where('status', 'active')
                                ->orderBy('amount', 'desc')
                                ->take(5)
                                ->get();
                                
            $recentAnnouncements = Announcement::orderBy('id', 'desc')
                                            ->take(3)
                                            ->get();

            return view('admin.pages.dashboard', compact(
                'stats',
                'prayerTimes',
                'recentDonors',
                'recentAnnouncements'
            ));

        } catch (\Exception $e) {
            return view('admin.pages.dashboard', [
                'db_error' => 'Database connection failed: ' . $e->getMessage(),
                'stats' => [
                    'donors' => 0,
                    'monthly_collection' => 0,
                    'announcements' => 0,
                ],
                'prayerTimes' => null,
                'recentDonors' => [],
                'recentAnnouncements' => []
            ]);
        }
    }
}