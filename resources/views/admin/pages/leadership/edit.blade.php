@extends('admin.layouts.app')

@section('title', 'Edit Leader')
@section('page-title', 'Edit Leader')

@section('content')
    <div class="container mx-auto px-6 py-8">
        <form action="{{ route('admin.leadership.update', $leader->id) }}" method="POST" enctype="multipart/form-data">
            @csrf
            @method('PUT')
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Name</label>
                        <input type="text" name="name" value="{{ $leader->name }}" placeholder="Enter name" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Designation / Role</label>
                        <input type="text" name="designation" value="{{ $leader->designation }}" placeholder="Enter designation Or Role" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors" required>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input type="email" name="email" value="{{ $leader->email }}" placeholder="Enter email" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors">
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Phone</label>
                        <input type="tel" name="phone" value="{{ $leader->phone }}" placeholder="Enter phone" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors">
                    </div>
                </div>
                <div class="space-y-4">
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Photo</label>
                        @if($leader->photo)
                            <img src="{{ $leader->photo_url }}" alt="{{ $leader->name }}" class="w-full h-64 object-cover rounded-lg mb-4">
                        @else
                            <div class="photo-upload-area rounded-lg p-8 text-center cursor-pointer border-2 border-dashed border-gray-300" onclick="document.getElementById('photoInput').click()">
                                <div class="mb-4">
                                    <svg class="w-12 h-12 text-gray-400 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                                    </svg>
                                </div>
                                <p class="text-gray-600 text-sm mb-2">Upload photo</p>
                                <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                                    Choose File
                                </button>
                                <p class="text-gray-400 text-xs mt-2">Or enter photo URL</p>
                            </div>
                        @endif
                        <input type="file" id="photoInput" name="photo" accept="image/*" class="hidden">
                        <input type="url" id="photoUrl" name="photo_url" value="{{ filter_var($leader->photo, FILTER_VALIDATE_URL) ? $leader->photo : '' }}" placeholder="Or enter photo URL" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors mt-2">
                        <p class="text-sm text-gray-500 mt-1">Leave blank to keep current photo</p>
                    </div>
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Biography</label>
                        <textarea name="bio" placeholder="Enter biography" rows="6" class="w-full px-3 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors resize-none">{{ $leader->bio }}</textarea>
                    </div>
                </div>
            </div>
            <div class="flex justify-end gap-3 mt-8 pt-6 border-t border-gray-200">
                <a href="{{ route('admin.leadership') }}" class="px-6 py-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg transition-colors">
                    Cancel
                </a>
                <button type="submit" class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2 rounded-lg transition-colors">
                    Update Leader
                </button>
            </div>
        </form>
    </div>
@endsection