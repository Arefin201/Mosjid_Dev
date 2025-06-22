<?php

namespace App\Http\Controllers\Admin;

use App\Models\MonthlyCollection;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\DB;

class MonthlyCollectionController extends Controller
{
    public function index(Request $request)
    {
        $query = MonthlyCollection::query()
            ->orderBy('collection_date', 'desc');
            
        // Apply year filter
        if ($request->has('year') && $request->year != '') {
            $query->whereYear('collection_date', $request->year);
        }
        
        // Apply month filter
        if ($request->has('month') && $request->month != '') {
            $query->whereMonth('collection_date', $request->month);
        }
        
        // Apply category filter
        if ($request->has('category') && $request->category != '') {
            $query->where('category', $request->category);
        }
        
        $collections = $query->paginate(10);
        
        // Get category distribution data
        $categoryDistribution = MonthlyCollection::select('category', DB::raw('SUM(total_amount) as total'))
            ->groupBy('category')
            ->pluck('total', 'category')
            ->toArray();
            
        // Recent activity data
        $recentActivity = [
            [
                'color' => 'bg-green-100',
                'icon' => 'fas fa-plus text-green-600',
                'title' => 'New collection added',
                'description' => 'May 2023 Monthly Chanda collection',
                'time' => '2 hours ago'
            ],
            [
                'color' => 'bg-blue-100',
                'icon' => 'fas fa-file-download text-blue-600',
                'title' => 'Report downloaded',
                'description' => 'April 2023 collection report',
                'time' => 'Yesterday'
            ]
        ];
        
        return view('admin.pages.monthly-collection.index', compact(
            'collections',
            'categoryDistribution',
            'recentActivity'
        ));
    }

    public function create()
    {
        $categories = [
            'monthly_chanda' => 'Monthly Chanda',
            'zakat' => 'Zakat',
            'fitrah' => 'Fitrah',
            'mosque_fund' => 'Mosque Fund',
            'other' => 'Other'
        ];
        
        return view('admin.pages.monthly-collection.create', compact('categories'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'collection_date' => 'required|date|unique:monthly_collections,collection_date',
            'total_amount' => 'required|numeric|min:0',
            'category' => 'required|in:monthly_chanda,zakat,fitrah,mosque_fund,other',
            'notes' => 'nullable|string'
        ]);

        // Convert to first day of month
        $collectionDate = Carbon::parse($request->collection_date)->firstOfMonth();

        MonthlyCollection::create([
            'collection_date' => $collectionDate,
            'total_amount' => $request->total_amount,
            'category' => $request->category,
            'notes' => $request->notes
        ]);

        return redirect()->route('admin.monthly-collections.index')
            ->with('success', 'Monthly collection created successfully');
    }

    public function edit(MonthlyCollection $monthlyCollection)
    {
        $categories = [
            'monthly_chanda' => 'Monthly Chanda',
            'zakat' => 'Zakat',
            'fitrah' => 'Fitrah',
            'mosque_fund' => 'Mosque Fund',
            'other' => 'Other'
        ];
        
        return view('admin.pages.monthly-collection.edit', compact('monthlyCollection', 'categories'));
    }

    public function update(Request $request, MonthlyCollection $monthlyCollection)
    {
        $request->validate([
            'collection_date' => 'required|date|unique:monthly_collections,collection_date,' . $monthlyCollection->id,
            'total_amount' => 'required|numeric|min:0',
            'category' => 'required|in:monthly_chanda,zakat,fitrah,mosque_fund,other',
            'notes' => 'nullable|string'
        ]);

        // Convert to first day of month
        $collectionDate = Carbon::parse($request->collection_date)->firstOfMonth();

        $monthlyCollection->update([
            'collection_date' => $collectionDate,
            'total_amount' => $request->total_amount,
            'category' => $request->category,
            'notes' => $request->notes
        ]);

        return redirect()->route('admin.monthly-collections.index')
            ->with('success', 'Monthly collection updated successfully');
    }

    public function destroy(MonthlyCollection $monthlyCollection)
    {
        $monthlyCollection->delete();
        return redirect()->route('admin.monthly-collections.index')
            ->with('success', 'Monthly collection deleted successfully');
    }
}