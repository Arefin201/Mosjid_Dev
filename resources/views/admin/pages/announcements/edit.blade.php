@extends('admin.layouts.app')

@section('title', 'Mosque - Edit Announcement')
@section('page-title', 'Edit Announcement')

@section('content')
    <div class="bg-white rounded-lg shadow-sm p-6">
        <form action="{{ route('admin.announcements.update', $announcement->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="space-y-4">
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Title *</label>
                    <input type="text" name="title" required 
                           value="{{ old('title', $announcement->title) }}"
                           class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Date *</label>
                    <input type="date" name="date" required 
                           value="{{ old('date', $announcement->date->format('Y-m-d')) }}"
                           class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>

                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Category</label>
                    <select name="category"
                        class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                        @foreach(['general', 'prayer', 'event', 'fundraising', 'ramadan'] as $option)
                            <option value="{{ $option }}" 
                                {{ $announcement->category === $option ? 'selected' : '' }}>
                                {{ ucfirst($option) }}
                            </option>
                        @endforeach
                    </select>
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Event Time (for events)</label>
                    <input type="text" name="event_time" 
                           value="{{ old('event_time', $announcement->event_time) }}"
                           placeholder="e.g., 8:00 AM - 12:00 PM"
                           class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">
                </div>
                
                <div>
                    <label class="block text-sm font-medium text-gray-700 mb-1">Description *</label>
                    <textarea name="description" required rows="4"
                              class="w-full px-3 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500">{{ old('description', $announcement->description) }}</textarea>
                </div>

                <div class="flex space-x-3 pt-4">
                    <button type="submit" class="flex-1 btn-primary text-white py-2 rounded-lg">
                        <i class="fas fa-save mr-2"></i>Update Announcement
                    </button>
                    <a href="{{ route('admin.announcements.index') }}"
                       class="flex-1 bg-gray-500 text-center text-white py-2 rounded-lg hover:bg-gray-600">
                        <i class="fas fa-times mr-2"></i>Cancel
                    </a>
                </div>
            </div>
        </form>
    </div>
@endsection