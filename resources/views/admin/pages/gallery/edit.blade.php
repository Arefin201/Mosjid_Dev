@extends('admin.layouts.app')

@section('title', 'Edit Gallery Item')
@section('page-title', 'Gallery & Community Events')

@section('content')
    <div class="container mx-auto px-6 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6 max-w-3xl mx-auto">
            <h2 class="text-xl font-bold text-gray-800 mb-6">Edit Gallery Item</h2>
            
            <form action="{{ route('admin.gallery.update', $galleryItem->id) }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')
                
                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <div class="col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Title</label>
                        <input type="text" name="title" value="{{ $galleryItem->title }}" placeholder="Enter title" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500" required>
                    </div>
                    
                    <div class="col-span-2">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                        <textarea name="description" rows="3" placeholder="Enter description..." class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">{{ $galleryItem->description }}</textarea>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Type</label>
                        <select name="type" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500" required>
                            <option value="prayer" {{ $galleryItem->type == 'prayer' ? 'selected' : '' }}>Prayer</option>
                            <option value="event" {{ $galleryItem->type == 'event' ? 'selected' : '' }}>Community Event</option>
                            <option value="other" {{ $galleryItem->type == 'other' ? 'selected' : '' }}>Other</option>
                        </select>
                    </div>
                    
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Event Date (Optional)</label>
                        <input type="date" name="event_date" value="{{ $galleryItem->event_date ? $galleryItem->event_date->format('Y-m-d') : '' }}" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
                    </div>
                </div>
                
                <div class="mb-6">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Current Image</label>
                    
                    @if(filter_var($galleryItem->image_path, FILTER_VALIDATE_URL))
                        <img src="{{ $galleryItem->image_path }}" alt="{{ $galleryItem->title }}" class="w-full max-w-xs rounded-lg mb-4">
                    @else
                        <img src="{{ asset('storage/'.$galleryItem->image_path) }}" alt="{{ $galleryItem->title }}" class="w-full max-w-xs rounded-lg mb-4">
                    @endif
                    
                    <label class="block text-sm font-medium text-gray-700 mb-2">Update Media</label>
                    
                    <div class="border-2 border-dashed border-gray-300 rounded-lg p-8 text-center cursor-pointer mb-4" onclick="document.getElementById('imageInput').click()">
                        <div class="mb-4">
                            <svg class="w-12 h-12 text-gray-400 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                        </div>
                        <p class="text-gray-600 text-sm mb-2">Upload new image</p>
                        <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                            Choose File
                        </button>
                        <p class="text-gray-400 text-xs mt-2">Or enter new image URL</p>
                    </div>
                    
                    <input type="file" id="imageInput" name="image" accept="image/*" class="hidden">
                    
                    <div class="mt-4">
                        <label class="block text-sm font-medium text-gray-700 mb-2">Or enter new image URL</label>
                        <input type="url" name="image_url" placeholder="https://example.com/new-image.jpg" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
                    </div>
                </div>
                
                <div class="flex items-center mb-6">
                    <input type="checkbox" name="is_featured" id="is_featured" {{ $galleryItem->is_featured ? 'checked' : '' }} class="w-4 h-4 text-emerald-600 rounded focus:ring-emerald-500">
                    <label for="is_featured" class="ml-2 text-sm text-gray-700">Mark as Featured</label>
                </div>
                
                <div class="flex justify-end gap-3">
                    <a href="{{ route('admin.gallery.index') }}" class="px-6 py-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg transition-colors">
                        Cancel
                    </a>
                    <button type="submit" class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2 rounded-lg transition-colors">
                        Update Item
                    </button>
                </div>
            </form>
        </div>
    </div>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const imageInput = document.getElementById('imageInput');
        const uploadArea = document.querySelector('.border-dashed');
        
        if (imageInput) {
            imageInput.addEventListener('change', function(e) {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        uploadArea.innerHTML = `
                            <img src="${e.target.result}" class="w-full h-64 object-cover rounded-lg mb-2" alt="Preview">
                            <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                                Change Image
                            </button>
                        `;
                    }
                    reader.readAsDataURL(this.files[0]);
                }
            });
        }
    });
</script>
@endsection