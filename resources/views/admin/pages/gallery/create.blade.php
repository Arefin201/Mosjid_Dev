@extends('admin.layouts.app')

@section('title', 'Add Gallery Item')
@section('page-title', 'Gallery & Community Events')

@section('content')
    <div class="container mx-auto px-6 py-8">
        <div class="bg-white rounded-xl shadow-lg p-6 max-w-3xl mx-auto">
            <h2 class="text-xl font-bold text-gray-800 mb-6">Add Gallery Item</h2>

            @if ($errors->any())
                <div class="bg-red-50 border-l-4 border-red-500 p-4 mb-6 rounded">
                    <div class="flex">
                        <div class="flex-shrink-0">
                            <svg class="h-5 w-5 text-red-500" viewBox="0 0 20 20" fill="currentColor">
                                <path fill-rule="evenodd"
                                    d="M10 18a8 8 0 100-16 8 8 0 000 16zM8.707 7.293a1 1 0 00-1.414 1.414L8.586 10l-1.293 1.293a1 1 0 101.414 1.414L10 11.414l1.293 1.293a1 1 0 001.414-1.414L11.414 10l1.293-1.293a1 1 0 00-1.414-1.414L10 8.586 8.707 7.293z"
                                    clip-rule="evenodd" />
                            </svg>
                        </div>
                        <div class="ml-3">
                            <h3 class="text-sm font-medium text-red-800">There were {{ $errors->count() }} errors with your
                                submission</h3>
                            <div class="mt-2 text-sm text-red-700">
                                <ul class="list-disc pl-5 space-y-1">
                                    @foreach ($errors->all() as $error)
                                        <li>{{ $error }}</li>
                                    @endforeach
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            @endif

            <form action="{{ route('admin.gallery.store') }}" method="POST" enctype="multipart/form-data">
                @csrf

                <div class="grid grid-cols-1 md:grid-cols-2 gap-6 mb-6">
                    <div class="col-span-2">
                        <label for="title" class="block text-sm font-medium text-gray-700 mb-2">Title *</label>
                        <input type="text" id="title" name="title" value="{{ old('title') }}"
                            placeholder="Enter title"
                            class="w-full px-4 py-2 border {{ $errors->has('title') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                            required maxlength="255">
                        @error('title')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div class="col-span-2">
                        <label for="description" class="block text-sm font-medium text-gray-700 mb-2">Description</label>
                        <textarea id="description" name="description" rows="3" placeholder="Enter description..."
                            class="w-full px-4 py-2 border {{ $errors->has('description') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">{{ old('description') }}</textarea>
                        @error('description')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror

                    </div>


                    <div class="col-span-2">
                        <label for="type" class="block text-sm font-medium text-gray-700 mb-2">Type *</label>
                        <input type="text" id="type" name="type" value="{{ old('type') }}"
                            placeholder="Enter type"
                            class="w-full px-4 py-2 border {{ $errors->has('type') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500"
                            required maxlength="255">
                        @error('type')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    <div>
                        <label for="event_date" class="block text-sm font-medium text-gray-700 mb-2">Event Date
                            (Optional)</label>
                        <input type="date" id="event_date" name="event_date" value="{{ old('event_date') }}"
                            class="w-full px-4 py-2 border {{ $errors->has('event_date') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500">
                        @error('event_date')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <div class="mb-6">
                    <label class="block text-sm font-medium text-gray-700 mb-2">Media Upload *</label>

                    <div class="border-2 border-dashed {{ $errors->has('image') ? 'border-red-500' : 'border-gray-300' }} rounded-lg p-8 text-center cursor-pointer mb-4"
                        onclick="document.getElementById('imageInput').click()">
                        <div class="mb-4">
                            <svg class="w-12 h-12 text-gray-400 mx-auto" fill="none" stroke="currentColor"
                                viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                    d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12">
                                </path>
                            </svg>
                        </div>
                        <p class="text-gray-600 text-sm mb-2">Upload image</p>
                        <button type="button"
                            class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                            Choose File
                        </button>
                        <p class="text-gray-400 text-xs mt-2">Or enter image URL</p>
                    </div>

                    <input type="file" id="imageInput" name="image" accept="image/*" class="hidden">
                    @error('image')
                        <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                    @enderror


                </div>

                <div class="flex items-center mb-6">
                    <input type="checkbox" name="is_featured" id="is_featured"
                        class="w-4 h-4 text-emerald-600 rounded focus:ring-emerald-500"
                        {{ old('is_featured') ? 'checked' : '' }}>
                    <label for="is_featured" class="ml-2 text-sm text-gray-700">Mark as Featured</label>
                </div>

                <div class="flex justify-end gap-3">
                    <a href="{{ route('admin.gallery.index') }}"
                        class="px-6 py-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg transition-colors">
                        Cancel
                    </a>
                    <button type="submit"
                        class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2 rounded-lg transition-colors">
                        Add Item
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
                        const file = this.files[0];
                        const validTypes = ['image/jpeg', 'image/png', 'image/gif', 'image/webp'];
                        const maxSize = 5 * 1024 * 1024; // 5MB

                        if (!validTypes.includes(file.type)) {
                            alert('Please upload a valid image file (JPEG, PNG, GIF, or WEBP).');
                            this.value = '';
                            return;
                        }

                        if (file.size > maxSize) {
                            alert('Image size should not exceed 5MB.');
                            this.value = '';
                            return;
                        }

                        const reader = new FileReader();
                        reader.onload = function(e) {
                            uploadArea.innerHTML = `
                            <img src="${e.target.result}" class="w-full h-64 object-cover rounded-lg mb-2" alt="Preview">
                            <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                                Change Image
                            </button>
                        `;
                        }
                        reader.readAsDataURL(file);
                    }
                });
            }

            // Validate that either file or URL is provided
            const form = document.querySelector('form');
            form.addEventListener('submit', function(e) {
                const imageInput = document.getElementById('imageInput');
                const imageUrl = document.getElementById('image_url');

                if (!imageInput.files[0] && !imageUrl.value.trim()) {
                    e.preventDefault();
                    alert('Please either upload an image or provide an image URL.');
                }
            });
        });
    </script>
@endsection
