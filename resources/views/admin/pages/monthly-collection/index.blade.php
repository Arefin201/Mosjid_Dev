@extends('admin.layouts.app')

@section('title', 'Monthly Collections')
@section('page-title', 'Monthly Collections')

@section('content')

<div class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
    <div class="bg-white overflow-hidden shadow-sm sm:rounded-lg">
        <div class="p-6 bg-white border-b border-gray-200">
            <div class="flex justify-between items-center mb-6">
                <h2 class="text-2xl font-semibold text-gray-800">Monthly Collections</h2>
                <a href="{{ route('admin.monthly-collections.create') }}" class="bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded flex items-center">
                    <i class="fas fa-plus mr-2"></i> Add New Collection
                </a>
            </div>

            <!-- Stats Summary -->
            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8">
                <div class="bg-white rounded-xl shadow p-6">
                    <div class="flex items-center">
                        <div class="rounded-full bg-blue-100 p-3">
                            <i class="fas fa-wallet text-blue-600 text-xl"></i>
                        </div>
                        <div class="ml-4">
                            <p class="text-sm font-medium text-gray-600">Total Collections</p>
                            <p class="text-2xl font-bold text-gray-900">৳ {{ number_format($collections->sum('total_amount'), 2) }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-white rounded-xl shadow p-6">
                    <div class="flex items-center">
                        <div class="rounded-full bg-green-100 p-3">
                            <i class="fas fa-calendar-check text-green-600 text-xl"></i>
                        </div>
                        <div class="ml-4">
                            <p class="text-sm font-medium text-gray-600">Monthly Chanda</p>
                            <p class="text-2xl font-bold text-gray-900">৳ {{ number_format($collections->where('category', 'monthly_chanda')->sum('total_amount'), 2) }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-white rounded-xl shadow p-6">
                    <div class="flex items-center">
                        <div class="rounded-full bg-purple-100 p-3">
                            <i class="fas fa-hands-helping text-purple-600 text-xl"></i>
                        </div>
                        <div class="ml-4">
                            <p class="text-sm font-medium text-gray-600">Zakat</p>
                            <p class="text-2xl font-bold text-gray-900">৳ {{ number_format($collections->where('category', 'zakat')->sum('total_amount'), 2) }}</p>
                        </div>
                    </div>
                </div>
                
                <div class="bg-white rounded-xl shadow p-6">
                    <div class="flex items-center">
                        <div class="rounded-full bg-yellow-100 p-3">
                            <i class="fas fa-star-and-crescent text-yellow-600 text-xl"></i>
                        </div>
                        <div class="ml-4">
                            <p class="text-sm font-medium text-gray-600">Fitrah</p>
                            <p class="text-2xl font-bold text-gray-900">৳ {{ number_format($collections->where('category', 'fitrah')->sum('total_amount'), 2) }}</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Filter Section -->
            <div class="mb-6 bg-gray-50 p-4 rounded-lg">
                <h3 class="text-lg font-medium text-gray-800 mb-3">Filter Collections</h3>
                <form id="filterForm" method="GET" action="{{ route('admin.monthly-collections.index') }}" class="grid grid-cols-1 md:grid-cols-4 gap-4">
                    <div>
                        <label for="year" class="block text-sm font-medium text-gray-700">Year</label>
                        <select id="year" name="year" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="">All Years</option>
                            @for ($y = date('Y'); $y >= 2020; $y--)
                                <option value="{{ $y }}" {{ request('year') == $y ? 'selected' : '' }}>{{ $y }}</option>
                            @endfor
                        </select>
                    </div>
                    
                    <div>
                        <label for="month" class="block text-sm font-medium text-gray-700">Month</label>
                        <select id="month" name="month" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="">All Months</option>
                            @foreach (['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'] as $key => $month)
                                <option value="{{ $key + 1 }}" {{ request('month') == $key + 1 ? 'selected' : '' }}>{{ $month }}</option>
                            @endforeach
                        </select>
                    </div>
                    
                    <div>
                        <label for="category" class="block text-sm font-medium text-gray-700">Category</label>
                        <select id="category" name="category" class="mt-1 block w-full py-2 px-3 border border-gray-300 bg-white rounded-md shadow-sm focus:outline-none focus:ring-blue-500 focus:border-blue-500 sm:text-sm">
                            <option value="">All Categories</option>
                            <option value="monthly_chanda" {{ request('category') == 'monthly_chanda' ? 'selected' : '' }}>Monthly Chanda</option>
                            <option value="zakat" {{ request('category') == 'zakat' ? 'selected' : '' }}>Zakat</option>
                            <option value="fitrah" {{ request('category') == 'fitrah' ? 'selected' : '' }}>Fitrah</option>
                            <option value="mosque_fund" {{ request('category') == 'mosque_fund' ? 'selected' : '' }}>Mosque Fund</option>
                            <option value="other" {{ request('category') == 'other' ? 'selected' : '' }}>Other</option>
                        </select>
                    </div>
                    
                    <div class="flex items-end">
                        <button type="submit" class="w-full bg-blue-500 hover:bg-blue-700 text-white font-bold py-2 px-4 rounded">
                            Apply Filters
                        </button>
                    </div>
                </form>
            </div>

            <!-- Collections Table -->
            <div class="bg-white rounded-xl shadow-lg overflow-hidden animate-fade-in">
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">ID</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Month</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Category</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider mobile-hidden">Notes</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider mobile-hidden">Created At</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Actions</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @foreach ($collections as $collection)
                            <tr class="table-row">
                                <td class="px-6 py-4 whitespace-nowrap text-sm font-medium text-gray-900">MC{{ str_pad($collection->id, 4, '0', STR_PAD_LEFT) }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500">{{ $collection->collection_date->format('F Y') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    @php
                                        $categoryClasses = [
                                            'monthly_chanda' => 'bg-green-100 text-green-800',
                                            'zakat' => 'bg-purple-100 text-purple-800',
                                            'fitrah' => 'bg-yellow-100 text-yellow-800',
                                            'mosque_fund' => 'bg-blue-100 text-blue-800',
                                            'other' => 'bg-gray-100 text-gray-800',
                                        ];
                                        
                                        $categoryLabels = [
                                            'monthly_chanda' => 'Monthly Chanda',
                                            'zakat' => 'Zakat',
                                            'fitrah' => 'Fitrah',
                                            'mosque_fund' => 'Mosque Fund',
                                            'other' => 'Other',
                                        ];
                                    @endphp
                                    <span class="px-3 py-1 text-xs rounded-full {{ $categoryClasses[$collection->category] }}">
                                        {{ $categoryLabels[$collection->category] }}
                                    </span>
                                </td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-900 font-bold">৳ {{ number_format($collection->total_amount, 2) }}</td>
                                <td class="px-6 py-4 text-sm text-gray-500 mobile-hidden">{{ $collection->notes ?? 'N/A' }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm text-gray-500 mobile-hidden">{{ $collection->created_at->format('M d, Y') }}</td>
                                <td class="px-6 py-4 whitespace-nowrap text-sm">
                                    <div class="flex space-x-2">
                                        <a href="{{ route('admin.monthly-collections.edit', $collection->id) }}" class="action-btn text-blue-600 hover:text-blue-800">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                        <form action="{{ route('admin.monthly-collections.destroy', $collection->id) }}" method="POST" class="inline-block">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="action-btn text-red-600 hover:text-red-800" onclick="return confirm('Are you sure you want to delete this collection?')">
                                                <i class="fas fa-trash-alt"></i>
                                            </button>
                                        </form>
                                        <a href="#" class="action-btn text-green-600 hover:text-green-800">
                                            <i class="fas fa-download"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
                
                <!-- Pagination -->
                <div class="bg-gray-50 px-6 py-4 flex flex-col md:flex-row items-center justify-between border-t border-gray-200">
                    <div class="text-sm text-gray-700 mb-4 md:mb-0">
                        Showing <span class="font-medium">{{ $collections->firstItem() }}</span> to 
                        <span class="font-medium">{{ $collections->lastItem() }}</span> of 
                        <span class="font-medium">{{ $collections->total() }}</span> results
                    </div>
                    <div class="flex space-x-2">
                        @if ($collections->onFirstPage())
                            <span class="px-3 py-1 rounded-md bg-gray-200 text-gray-400 cursor-not-allowed">
                                <i class="fas fa-chevron-left"></i>
                            </span>
                        @else
                            <a href="{{ $collections->previousPageUrl() }}" class="px-3 py-1 rounded-md bg-gray-200 text-gray-700 hover:bg-gray-300">
                                <i class="fas fa-chevron-left"></i>
                            </a>
                        @endif
                        
                        @foreach ($collections->getUrlRange(1, $collections->lastPage()) as $page => $url)
                            @if ($page == $collections->currentPage())
                                <span class="px-3 py-1 rounded-md bg-blue-500 text-white">{{ $page }}</span>
                            @else
                                <a href="{{ $url }}" class="px-3 py-1 rounded-md bg-gray-200 text-gray-700 hover:bg-gray-300">{{ $page }}</a>
                            @endif
                        @endforeach
                        
                        @if ($collections->hasMorePages())
                            <a href="{{ $collections->nextPageUrl() }}" class="px-3 py-1 rounded-md bg-gray-200 text-gray-700 hover:bg-gray-300">
                                <i class="fas fa-chevron-right"></i>
                            </a>
                        @else
                            <span class="px-3 py-1 rounded-md bg-gray-200 text-gray-400 cursor-not-allowed">
                                <i class="fas fa-chevron-right"></i>
                            </span>
                        @endif
                    </div>
                </div>
            </div>
            
            
        </div>
    </div>
</div>
@endsection


