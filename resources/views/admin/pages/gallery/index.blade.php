@extends('admin.layouts.app')

@section('title', 'Gallery & Community Events')
@section('page-title', 'Gallery & Community Events')

@section('content')
    <div class="container mx-auto px-6 py-8">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-2xl font-bold text-gray-800">Gallery & Community Events</h1>
            <a href="{{ route('admin.gallery.create') }}"
                class="bg-emerald-600 hover:bg-emerald-700 text-white px-4 py-2 rounded-lg flex items-center gap-2">
                <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                </svg>
                Add New Item
            </a>
        </div>

        <div class="bg-white rounded-xl shadow-lg p-6 mb-8">
            <h2 class="text-xl font-bold text-gray-800 mb-4">Gallery Items ({{ $galleryItems->count() }})</h2>

            <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                @foreach ($galleryItems as $item)
                    <div class="border border-gray-200 rounded-lg overflow-hidden">
                        <div class="relative">
                            @if (filter_var($item->image_path, FILTER_VALIDATE_URL))
                                <img src="{{ $item->image_path }}" alt="{{ $item->title }}"
                                    class="w-full h-48 object-cover">
                            @else
                                <img src="{{ asset('storage/' . $item->image_path) }}" alt="{{ $item->title }}"
                                    class="w-full h-48 object-cover">
                            @endif

                            @if ($item->is_featured)
                                <span class="absolute top-2 right-2 bg-amber-500 text-white text-xs px-2 py-1 rounded">
                                    Featured
                                </span>
                            @endif
                        </div>
                        <div class="p-4">
                            <h3 class="font-bold text-gray-800 mb-1">{{ $item->title }}</h3>
                            <div class="flex items-center gap-2 mb-2">
                                <span class="text-sm text-red-600">{{ $item->type }}</span>
                                @if ($item->event_date)
                                    <span class="text-sm text-red-800">• {{ $item->event_date->format('M d, Y') }}</span>
                                @endif
                            </div>
                            <p class="text-gray-600 text-sm mb-4 line-clamp-2">{{ $item->description }}</p>

                            <div class="flex justify-end gap-2">
                                <a href="{{ route('admin.gallery.edit', $item->id) }}"
                                    class="text-blue-600 hover:text-blue-800">
                                    <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                            d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                                        </path>
                                    </svg>
                                </a>
                                {{-- Remove this --}}

                                <form action="{{ route('admin.gallery.destroy', $item->id) }}" method="POST">
                                    @csrf
                                    @method('DELETE')
                                    <button type="submit" class="text-red-600 hover:text-red-800"
                                        onclick="return confirm('Are you sure?')">
                                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                            </path>
                                        </svg>
                                    </button>
                                </form>
                            </div>
                        </div>
                    </div>
                @endforeach

                <!-- Add New Card -->
                <a href="{{ route('admin.gallery.create') }}"
                    class="border-2 border-dashed border-gray-300 rounded-lg flex flex-col items-center justify-center p-8 text-gray-500 hover:border-emerald-500 hover:text-emerald-600 transition-colors">
                    <svg class="w-12 h-12 mb-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                    </svg>
                    <span class="font-medium">Add New Item</span>
                </a>
            </div>
        </div>
    </div>
@endsection
