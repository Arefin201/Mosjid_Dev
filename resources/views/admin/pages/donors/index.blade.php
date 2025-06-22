@extends('admin.layouts.app')

@section('title', 'Mosque - Donor Management')
@section('page-title', 'Donor Management')

@section('content')
    <div id="donorsPage" class="page-content">
        <div class="bg-white rounded-lg shadow-sm p-6">
            <div class="flex flex-col lg:flex-row justify-between items-center mb-6">
                <h3 class="text-xl font-semibold mb-4 lg:mb-0">Donor Management</h3>
                <div class="flex flex-col sm:flex-row space-y-2 sm:space-y-0 sm:space-x-4">
                    <form id="searchForm" method="GET" action="{{ route('admin.donors.index') }}" class="flex items-center">
                        <input type="text" name="search" id="donorSearch" placeholder="Search donors..."
                            value="{{ request()->input('search') }}"
                            class="px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        <select name="status" id="donorFilter"
                            class="ml-2 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                            <option value="">All Status</option>
                            <option value="active" {{ request()->input('status') == 'active' ? 'selected' : '' }}>Active
                            </option>
                            <option value="inactive" {{ request()->input('status') == 'inactive' ? 'selected' : '' }}>
                                Inactive</option>
                        </select>
                        <button type="submit" class="ml-2 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                            <i class="fas fa-search"></i>
                        </button>
                    </form>
                    <a href="{{ route('admin.donors.create') }}" id="addDonorBtn"
                        class="btn-primary text-white px-6 py-2 rounded-lg">
                        <i class="fas fa-plus mr-2"></i>Add Donor
                    </a>
                </div>
            </div>

            <div class="table-container overflow-x-auto">
                <table class="w-full table-auto">
                    <thead>
                        <tr class="bg-gray-50">
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Serial</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Name</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Phone</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Amount</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Method</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Status</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Last Paid</th>
                            <th class="px-4 py-3 text-left font-medium text-gray-700">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="donorTableBody">
                        @forelse ($donors as $index => $donor)
                            <tr class="border-b hover:bg-gray-50">
                                <td class="px-4 py-3">{{ $index + 1 }}</td>
                                <td class="px-4 py-3 font-medium">{{ $donor->name }}</td>
                                <td class="px-4 py-3">{{ $donor->phone }}</td>
                                <td class="px-4 py-3">৳{{ number_format($donor->amount, 2) }}</td>
                                <td class="px-4 py-3 capitalize">{{ $donor->payment_method }}</td>
                                <td class="px-4 py-3">
                                    <span
                                        class="px-2 py-1 text-xs rounded-full {{ $donor->status == 'active' ? 'status-active' : 'status-inactive' }}">
                                        {{ $donor->status }}
                                    </span>
                                </td>
                                <td class="px-4 py-3">
                                    {{ $donor->last_paid ? $donor->last_paid->format('Y-m-d') : 'Never' }}</td>
                                <td class="px-4 py-3">
                                    <a href="{{ route('admin.donors.edit', $donor->id) }}"
                                        class="text-blue-600 hover:text-blue-800 mr-2">
                                        <i class="fas fa-edit"></i>
                                    </a>
                                    <form action="{{ route('admin.donors.destroy', $donor) }}" method="POST"
                                        class="inline-block">
                                        @csrf
                                        @method('DELETE')
                                        <button type="submit" class="text-red-600 hover:text-red-800"
                                            onclick="return confirm('Are you sure?')">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    </form>
                            </tr>
                        @empty
                            <tr>
                                <td colspan="8" class="px-4 py-3 text-center text-gray-500">
                                    No donors found
                                </td>
                            </tr>
                        @endforelse
                    </tbody>
                </table>
            </div>

            <!-- Pagination -->
            <div class="flex justify-between items-center mt-6">
                <div class="text-sm text-gray-600">
                    Showing {{ $donors->firstItem() }} to {{ $donors->lastItem() }} of
                    {{ $donors->total() }} donors
                </div>
                <div class="flex space-x-2" id="donorPagination">
                    @if ($donors->onFirstPage())
                        <span class="px-3 py-1 bg-gray-200 rounded text-gray-400 cursor-not-allowed">Previous</span>
                    @else
                        <a href="{{ $donors->previousPageUrl() }}"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">Previous</a>
                    @endif

                    @foreach ($donors->getUrlRange(1, $donors->lastPage()) as $page => $url)
                        @if ($page == $donors->currentPage())
                            <span class="px-3 py-1 bg-green-600 text-white rounded">{{ $page }}</span>
                        @else
                            <a href="{{ $url }}"
                                class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">{{ $page }}</a>
                        @endif
                    @endforeach

                    @if ($donors->hasMorePages())
                        <a href="{{ $donors->nextPageUrl() }}"
                            class="px-3 py-1 bg-gray-200 rounded hover:bg-gray-300">Next</a>
                    @else
                        <span class="px-3 py-1 bg-gray-200 rounded text-gray-400 cursor-not-allowed">Next</span>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('modals')
    <div id="donorModal" class="fixed inset-0 z-50 hidden bg-black bg-opacity-50 flex items-center justify-center p-4">
        <!-- Modal content -->
    </div>
@endpush

@push('styles')
    <style>
        .status-active {
            background-color: #d1fae5;
            color: #065f46;
        }

        .status-inactive {
            background-color: #fee2e2;
            color: #b91c1c;
        }
    </style>
@endpush
