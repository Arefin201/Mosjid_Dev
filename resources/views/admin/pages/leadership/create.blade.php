@extends('admin.layouts.app')

@section('title', 'Add New Leader')
@section('page-title', 'Add New Leader')

@section('content')
    <div class="container mx-auto px-6 py-8">
        {{-- Display general errors --}}
        @if ($errors->has('general'))
            <div class="bg-red-100 border border-red-400 text-red-700 px-4 py-3 rounded mb-6">
                <strong>Error:</strong> {{ $errors->first('general') }}
            </div>
        @endif

        <form action="{{ route('admin.leadership.store') }}" method="POST" enctype="multipart/form-data">
            @csrf
            <div class="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div class="space-y-4">
                    {{-- Name Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Name <span class="text-red-500">*</span>
                        </label>
                        <input type="text" 
                               name="name" 
                               value="{{ old('name') }}"
                               placeholder="Enter full name" 
                               class="w-full px-3 py-2 border {{ $errors->has('name') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors" 
                               required>
                        @error('name')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- Designation Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Designation / Role <span class="text-red-500">*</span>
                        </label>
                        <input type="text" 
                               name="designation" 
                               value="{{ old('designation') }}"
                               placeholder="Enter designation or role" 
                               class="w-full px-3 py-2 border {{ $errors->has('designation') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors" 
                               required>
                        @error('designation')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- Email Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Email</label>
                        <input type="email" 
                               name="email" 
                               value="{{ old('email') }}"
                               placeholder="Enter email address" 
                               class="w-full px-3 py-2 border {{ $errors->has('email') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors">
                        @error('email')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- Phone Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">Phone</label>
                        <input type="tel" 
                               name="phone" 
                               value="{{ old('phone') }}"
                               placeholder="Enter phone number" 
                               class="w-full px-3 py-2 border {{ $errors->has('phone') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors">
                        @error('phone')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>
                </div>

                <div class="space-y-4">
                    {{-- Photo Upload Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Photo <span class="text-red-500">*</span>
                        </label>
                        <div class="photo-upload-area rounded-lg p-8 text-center cursor-pointer border-2 border-dashed {{ $errors->has('photo') || $errors->has('photo_url') ? 'border-red-500' : 'border-gray-300' }}" 
                             onclick="document.getElementById('photoInput').click()">
                            <div class="mb-4">
                                <svg class="w-12 h-12 text-gray-400 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                                </svg>
                            </div>
                            <p class="text-gray-600 text-sm mb-2">Upload photo</p>
                            <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                                Choose File
                            </button>
                            <p class="text-gray-400 text-xs mt-2">Max 2MB, JPEG/PNG/GIF/WebP</p>
                            <p class="text-gray-400 text-xs">Min: 100x100px, Max: 2000x2000px</p>
                        </div>
                        <input type="file" 
                               id="photoInput" 
                               name="photo" 
                               accept="image/jpeg,image/png,image/jpg,image/gif,image/webp" 
                               class="hidden">
                        
                        {{-- Photo URL Field --}}
                        <div class="mt-3">
                            <input type="url" 
                                   id="photoUrl" 
                                   name="photo_url" 
                                   value="{{ old('photo_url') }}"
                                   placeholder="Or enter photo URL (must end with .jpg, .png, .gif, .webp)" 
                                   class="w-full px-3 py-2 border {{ $errors->has('photo_url') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors">
                        </div>
                        
                        @error('photo')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                        @error('photo_url')
                            <p class="mt-1 text-sm text-red-600">{{ $message }}</p>
                        @enderror
                    </div>

                    {{-- Biography Field --}}
                    <div>
                        <label class="block text-sm font-medium text-gray-700 mb-2">
                            Biography
                            <span class="text-gray-500 text-xs">(10-1000 characters)</span>
                        </label>
                        <textarea name="bio" 
                                  placeholder="Enter biography (minimum 10 characters)" 
                                  rows="6" 
                                  class="w-full px-3 py-2 border {{ $errors->has('bio') ? 'border-red-500' : 'border-gray-300' }} rounded-lg focus:ring-2 focus:ring-emerald-500 focus:border-emerald-500 transition-colors resize-none"
                                  maxlength="1000">{{ old('bio') }}</textarea>
                        <div class="flex justify-between items-center mt-1">
                            @error('bio')
                                <p class="text-sm text-red-600">{{ $message }}</p>
                            @else
                                <p class="text-xs text-gray-500">Minimum 10 characters required</p>
                            @enderror
                            <p class="text-xs text-gray-500">
                                <span id="bioCharCount">{{ old('bio') ? strlen(old('bio')) : 0 }}</span>/1000
                            </p>
                        </div>
                    </div>
                </div>
            </div>

            <div class="flex justify-end gap-3 mt-8 pt-6 border-t border-gray-200">
                <a href="{{ route('admin.leadership') }}" 
                   class="px-6 py-2 text-gray-600 hover:text-gray-800 hover:bg-gray-100 rounded-lg transition-colors">
                    Cancel
                </a>
                <button type="submit" 
                        class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2 rounded-lg transition-colors">
                    Add Leader
                </button>
            </div>
        </form>
    </div>
@endsection

@section('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function() {
        const photoInput = document.getElementById('photoInput');
        const photoUrl = document.getElementById('photoUrl');
        const photoUploadArea = document.querySelector('.photo-upload-area');
        const bioTextarea = document.querySelector('textarea[name="bio"]');
        const bioCharCount = document.getElementById('bioCharCount');
        
        // Photo upload preview
        if (photoInput) {
            photoInput.addEventListener('change', function(e) {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();
                    reader.onload = function(e) {
                        photoUploadArea.innerHTML = `
                            <img src="${e.target.result}" class="w-full h-64 object-cover rounded-lg mb-2" alt="Preview">
                            <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                                Change Photo
                            </button>
                        `;
                    }
                    reader.readAsDataURL(this.files[0]);
                    
                    // Clear photo URL when file is selected
                    if (photoUrl) {
                        photoUrl.value = '';
                    }
                }
            });
        }

        // Clear file input when URL is entered
        if (photoUrl) {
            photoUrl.addEventListener('input', function() {
                if (this.value.trim() !== '') {
                    photoInput.value = '';
                    // Reset upload area
                    photoUploadArea.innerHTML = `
                        <div class="mb-4">
                            <svg class="w-12 h-12 text-gray-400 mx-auto" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M7 16a4 4 0 01-.88-7.903A5 5 0 1115.9 6L16 6a5 5 0 011 9.9M15 13l-3-3m0 0l-3 3m3-3v12"></path>
                            </svg>
                        </div>
                        <p class="text-gray-600 text-sm mb-2">Upload photo</p>
                        <button type="button" class="bg-gray-100 hover:bg-gray-200 text-gray-700 px-4 py-2 rounded-lg text-sm transition-colors">
                            Choose File
                        </button>
                        <p class="text-gray-400 text-xs mt-2">Max 2MB, JPEG/PNG/GIF/WebP</p>
                        <p class="text-gray-400 text-xs">Min: 100x100px, Max: 2000x2000px</p>
                    `;
                }
            });
        }

        // Biography character counter
        if (bioTextarea && bioCharCount) {
            bioTextarea.addEventListener('input', function() {
                bioCharCount.textContent = this.value.length;
            });
        }

        // Form validation before submit
        const form = document.querySelector('form');
        if (form) {
            form.addEventListener('submit', function(e) {
                const name = document.querySelector('input[name="name"]').value.trim();
                const designation = document.querySelector('input[name="designation"]').value.trim();
                const photo = document.querySelector('input[name="photo"]').files[0];
                const photoUrlValue = document.querySelector('input[name="photo_url"]').value.trim();
                
                if (!name || !designation) {
                    e.preventDefault();
                    alert('Please fill in all required fields.');
                    return;
                }
                
                if (!photo && !photoUrlValue) {
                    e.preventDefault();
                    alert('Please provide either a photo file or a photo URL.');
                    return;
                }
                
                if (photo && photoUrlValue) {
                    e.preventDefault();
                    alert('Please provide either a photo file or a photo URL, not both.');
                    return;
                }
            });
        }
    });
</script>
@endsection