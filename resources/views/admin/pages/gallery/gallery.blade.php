@extends('admin.layouts.app')

@section('title', 'Mosque - Gallery Page')
@section('page-title', 'Gallery Page')

@section('content')

    <!-- Gallery Page -->
    <div id="galleryPage" class="page-content">
        <div class="bg-white rounded-lg shadow-sm p-6">
            <div class="flex justify-between items-center mb-6">
                <h3 class="text-xl font-semibold">Event Gallery</h3>
                <label for="galleryUpload" class="btn-primary text-white px-6 py-2 rounded-lg cursor-pointer">
                    <i class="fas fa-upload mr-2"></i>Upload Images
                    <input type="file" id="galleryUpload" multiple="" accept="image/*" class="hidden">
                </label>
            </div>

            <div id="galleryGrid" class="grid grid-cols-1 sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-4">
                <div class="gallery-item relative">
                    <div class="aspect-w-1 aspect-h-1 bg-gray-200 rounded-lg overflow-hidden">
                        <img src="image/jpeg;base6" alt="133900813291737175.jpg" class="object-cover w-full h-full">
                    </div>
                    <div class="gallery-delete cursor-pointer" onclick="deleteGalleryImage(1750188621177)">
                        <i class="fas fa-trash text-white"></i>
                    </div>
                    <div class="p-2">
                        <p class="text-sm font-medium truncate">133900813291737175.jpg</p>
                        <p class="text-xs text-gray-500">2025-06-17</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
@endsection
