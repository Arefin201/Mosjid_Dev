@extends('admin.layouts.app')

@section('title', 'Mosque - Create Announcement')
@section('page-title', 'Create Announcement')

@section('content')

<!-- Header -->

<!-- Main Content -->
<div class="grid lg:grid-cols-2 gap-6">

    <!-- Left Column: About Items -->
    <div class="bg-white rounded-lg border border-gray-200 shadow">
        <div class="p-6 border-b border-gray-200">
            <h2 class="text-2xl font-semibold text-gray-800">About Items</h2>
        </div>
        <div class="p-6 space-y-4">

            @foreach ([
                ['title' => 'Our Mission', 'type' => 'text', 'content' => 'To serve Allah and the Muslim community through worship, education, and social services.'],
                ['title' => 'History', 'type' => 'image', 'content' => 'Established in 1995, our mosque has been serving the community for over 25 years.'],
                ['title' => 'Community Services', 'type' => 'video', 'content' => 'We provide food distribution, counseling, and educational programs for all community members.'],
            ] as $item)
            <div class="p-4 border border-gray-200 rounded-lg bg-white flex justify-between items-start">
                <div class="flex-1">
                    <h4 class="font-semibold text-gray-800">{{ $item['title'] }}</h4>
                    <p class="text-sm text-gray-600 mt-1 truncate">{{ $item['content'] }}</p>
                    <span class="inline-block mt-2 px-2 py-1 bg-gray-100 text-sm text-gray-700 rounded">
                        {{ $item['type'] }}
                    </span>
                </div>
                <div class="flex space-x-2 ml-4">
                    <a href="{{route('admin.about.edit')}}" class="p-2 border border-gray-300 rounded hover:bg-gray-100">
                        <i class="fas fa-edit text-gray-600"></i>
                    </a>
                    <a class="p-2 border border-gray-300 rounded hover:bg-gray-100">
                        <i class="fas fa-trash text-red-500"></i>
                    </a>
                </div>
            </div>
            @endforeach

            <!-- Add New -->
            <button
                class="w-full flex items-center justify-center px-4 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition">
                <i class="fas fa-plus mr-2"></i>
                Add New Item
            </button>

        </div>
    </div>

    <!-- Right Column: Edit Form -->
    {{-- <div class="bg-white rounded-lg border border-gray-200 shadow">
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
    </div> --}}
</div>

@endsection
