@extends('admin.layouts.app')

@section('title', 'Mosque - Create Announcement')
@section('page-title', 'Create Announcement')

@section('content')


    <!-- Right Column: Edit Form -->
    <div class="bg-white rounded-lg border border-gray-200 shadow">
        <div class="p-6 border-b border-gray-200">
            <h2 class="text-2xl font-semibold text-gray-800">Edit About Item</h2>
        </div>
        <div class="p-6 space-y-6">

            <!-- Title -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Title</label>
                <input type="text" class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:outline-none"
                    value="Our Mission" placeholder="Enter title">
            </div>

            <!-- Content Type -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Content Type</label>
                <div class="flex border border-gray-300 rounded-lg overflow-hidden">
                    <button class="flex-1 py-2 bg-gray-200 text-gray-800 font-medium">Text</button>
                    <button class="flex-1 py-2 bg-white hover:bg-gray-100">Image</button>
                    <button class="flex-1 py-2 bg-white hover:bg-gray-100">Video</button>
                </div>
            </div>

            <!-- Content -->
            <div>
                <label class="block text-sm font-medium text-gray-700 mb-2">Content</label>
                <textarea rows="6" class="w-full px-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:outline-none"
                    placeholder="Enter content...">To serve Allah and the Muslim community through worship, education, and social services.</textarea>
            </div>

            <!-- Image Upload (Hidden by Default) -->
            <div class="hidden">
                <label class="block text-sm font-medium text-gray-700 mb-2">Image Upload</label>
                <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center">
                    <i class="fas fa-cloud-upload-alt text-3xl text-gray-400 mb-4"></i>
                    <p class="text-sm text-gray-600">Click to upload or drag and drop</p>
                    <p class="text-xs text-gray-500">PNG, JPG, GIF up to 10MB</p>
                    <button class="mt-3 px-4 py-2 border border-gray-300 rounded hover:bg-gray-100">
                        Choose File
                    </button>
                </div>

                <div class="mt-4">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Or enter image URL</label>
                    <input type="text"
                        class="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:outline-none"
                        placeholder="https://example.com/image.jpg">
                </div>
            </div>

            <!-- Actions -->
            <div class="flex space-x-3 pt-4">
                <button class="flex-1 px-4 py-2 bg-green-600 text-white rounded-lg hover:bg-green-700">
                    Save Changes
                </button>
                <button class="flex-1 px-4 py-2 border border-gray-300 rounded-lg hover:bg-gray-100">
                    Cancel
                </button>
            </div>

        </div>
    </div>


@endsection
