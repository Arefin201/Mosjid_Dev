<?php

namespace App\Http\Controllers;

use Carbon\Carbon;
use App\Models\Donor;
use App\Models\Leader;
use App\Models\Message;
use App\Models\HomeBanner;
use App\Models\PrayerTime;
use App\Models\AboutMosque;
use App\Models\GalleryItem;
use App\Models\Announcement;

use Illuminate\Http\Request;
use App\Models\MosqueSetting;
use App\Models\MonthlyCollection;
use Illuminate\Support\Facades\DB;

class WelcomeController extends Controller
{
    public function index()
    {
        try {
            // Check database connection
            DB::connection()->getPdo();

            $homes = HomeBanner::all();
            $abouts = AboutMosque::all();
            $prayerTimes = PrayerTime::first();
            $donors = Donor::where('status', 'active')->orderBy('amount', 'desc')->get();
            $announcements = Announcement::orderBy('id', 'desc')->take(8)->get();
            $galleryItems = GalleryItem::
                orderBy('created_at', 'desc')
                ->take(9)
                ->get();
            $leaders = Leader::orderBy('order')->get();
            $mosqueSettings = MosqueSetting::first();

            // Get current month collections
            $currentMonthStart = now()->startOfMonth();
            $currentMonthEnd = now()->endOfMonth();
            $currentMonthCollections = MonthlyCollection::whereBetween('collection_date', [
                $currentMonthStart,
                $currentMonthEnd
            ])->get();

            // Calculate current month total
            $currentMonthTotal = $currentMonthCollections->sum('total_amount');

            // Group by category
            $breakdown = $currentMonthCollections->groupBy('category')->map->sum('total_amount');

            // Prepare chart data in specific order
            $chartData = [
                'monthly_chanda' => $breakdown->get('monthly_chanda', 0),
                'zakat' => $breakdown->get('zakat', 0),
                'fitrah' => $breakdown->get('fitrah', 0),
                'mosque_fund' => $breakdown->get('mosque_fund', 0),
            ];

            return view('welcome', compact(
                'homes',
                'prayerTimes',
                'donors',
                'abouts',
                'announcements',
                'galleryItems',
                'leaders',
                'mosqueSettings',
                'currentMonthTotal',
                'chartData'
            ));

        } catch (\Exception $e) {
            // Handle database connection error
            return view('welcome', [
                'db_error' => 'Database connection failed: ' . $e->getMessage()
            ]);
        }
    }
}