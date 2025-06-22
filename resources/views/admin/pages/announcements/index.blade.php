@extends('admin.layouts.app')

@section('title', 'Mosque - Announcements')
@section('page-title', 'Announcements')

@section('content')
    <div class="space-y-6">
        <div class="bg-white rounded-lg shadow-sm p-6">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-xl font-semibold">Announcements</h3>
                <a href="{{ route('admin.announcements.create') }}" class="btn-primary text-white px-6 py-2 rounded-lg">
                    <i class="fas fa-plus mr-2"></i>Add Announcement
                </a>
            </div>

            @if(session('success'))
                <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-4" role="alert">
                    <p>{{ session('success') }}</p>
                </div>
            @endif

            <div class="space-y-4">
                @forelse($announcements as $announcement) {{-- Use @forelse instead of @foreach --}}
                    @php
                        $colors = [
                            'general' => 'bg-gray-100 text-gray-800 border-gray-500',
                            'prayer' => 'bg-blue-100 text-blue-800 border-blue-500',
                            'event' => 'bg-purple-100 text-purple-800 border-purple-500',
                            'fundraising' => 'bg-green-100 text-green-800 border-green-500',
                            'ramadan' => 'bg-yellow-100 text-yellow-800 border-yellow-500',
                        ];
                        $colorClass = $colors[$announcement->category] ?? $colors['general'];
                    @endphp
                    
                    <div class="p-4 rounded-lg border-l-4 {{ $colorClass }}">
                        <div class="flex justify-between items-start">
                            <div>
                                <h4 class="font-semibold text-lg">{{ $announcement->title }}</h4>
                                <p class="mt-2">{{ $announcement->description }}</p>
                                @if($announcement->event_time)
                                    <div class="mt-2">
                                        <i class="far fa-clock mr-1"></i> {{ $announcement->event_time }}
                                    </div>
                                @endif
                            </div>
                            <div class="flex space-x-2">
                                <a href="{{ route('admin.announcements.edit', parameters: $announcement->id) }}" 
                                   class="text-blue-600 hover:text-blue-800 p-2 rounded-full hover:bg-blue-100">
                                    <i class="fas fa-edit"></i>
                                </a>
                                <form action="{{ route('admin.announcements.destroy', $announcement->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit"
                                            class="text-red-600 hover:text-red-800 p-2 rounded-full hover:bg-red-100">
                                        <i class="fas fa-trash"></i>
                                    </button>
                                </form>
                            </div>
                        </div>
                        <div class="flex justify-between items-center mt-4">
                            <span class="text-xs px-2 py-1 rounded-full bg-white border border-gray-300 capitalize">
                                {{ $announcement->category }}
                            </span>
                            <span class="text-xs text-gray-500">
                                <i class="far fa-calendar mr-1"></i>{{ $announcement->date->format('Y-m-d') }}
                            </span>
                        </div>
                    </div>
                @empty {{-- Handle empty state --}}
                    <div class="bg-gray-100 text-center py-12 rounded-lg">
                        <i class="fas fa-bullhorn text-4xl text-gray-400 mb-4"></i>
                        <p class="text-gray-600">No announcements found</p>
                        <a href="{{ route('admin.announcements.create') }}" class="mt-4 btn-primary inline-block text-white px-6 py-2 rounded-lg">
                            <i class="fas fa-plus mr-2"></i>Create First Announcement
                        </a>
                    </div>
                @endforelse
            </div>
        </div>
    </div>
@endsection