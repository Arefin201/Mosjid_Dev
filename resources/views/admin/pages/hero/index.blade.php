@extends('admin.layouts.app')

@section('title', 'Mosque - Home Banner')
@section('page-title', 'Home Banner Configuration')

@section('content')
    <div class="section-content">
        <div class="bg-white rounded-xl shadow-sm p-6">
            <h2 class="text-2xl font-bold text-gray-800 mb-6">Home Section Management</h2>

            @if (session('success'))
                <div class="bg-green-100 border-l-4 border-green-500 text-green-700 p-4 mb-6" role="alert">
                    <p>{{ session('success') }}</p>
                </div>
            @endif

            <form action="{{ route('admin.home-banner.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                @method('PUT')

                <div class="grid grid-cols-1 lg:grid-cols-2 gap-6">
                    <div>
                        <h3 class="text-lg font-semibold mb-4">Banner Configuration</h3>

                        <div class="mb-4">
                            <label class="block text-gray-700 mb-2">Title</label>
                            <input type="text" name="title"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                                value="{{ old('title', $banner->title) }}" placeholder="Welcome to Your Local Mosque">
                            @error('title')
                                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 mb-2">Subtitle</label>
                            <textarea name="subtitle" class="w-full h-36 px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                                rows="2" placeholder="Center for Islamic Education, Community and Spirituality">{{ old('subtitle', $banner->subtitle) }}</textarea>
                            @error('subtitle')
                                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 mb-2">Button Text</label>
                            <input type="text" name="button_text"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                                value="{{ old('button_text', $banner->button_text) }}" placeholder="Learn About Us">
                            @error('button_text')
                                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="mb-4">
                            <label class="block text-gray-700 mb-2">Button Link</label>
                            <input type="text" name="button_link"
                                class="w-full px-4 py-2 border rounded-lg focus:outline-none focus:ring-2 focus:ring-primary"
                                value="{{ old('button_link', $banner->button_link) }}" placeholder="/about">
                            @error('button_link')
                                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>

                    <div>
                        <h3 class="text-lg font-semibold mb-4">Banner Image</h3>

                        <div class="border-2 border-dashed border-gray-300 rounded-lg p-6 text-center mb-4">
                            @if ($banner->banner_image)
                                <img id="currentImagePreview" src="{{ $banner->image_url }}" alt="Mosque Banner"
                                    class="w-full h-48 object-cover rounded-lg mb-4">
                            @else
                                <div id="imagePlaceholder"
                                    class="bg-gray-200 border-2 border-dashed rounded-xl w-full h-48 mb-4 flex items-center justify-center">
                                    <span class="text-gray-500">No image uploaded</span>
                                </div>
                            @endif

                            <label for="banner_image" class="btn-primary text-white px-6 py-2 rounded-lg cursor-pointer">
                                <i class="fas fa-upload mr-2"></i>Upload Image
                                <input type="file" id="banner_image" name="banner_image" accept="image/*" class="hidden">
                            </label>
                            @error('banner_image')
                                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
                            @enderror
                        </div>

                        <div class="bg-blue-50 p-4 rounded-lg">
                            <h4 class="font-semibold text-blue-800 mb-2">Recommendation</h4>
                            <p class="text-sm text-gray-600">Use 1920x1080 pixel resolution for banner images.
                                The image should be high quality and relevant.</p>
                        </div>
                    </div>
                </div>

                <div class="md:col-span-2 lg:col-span-3">
                    <button type="submit" class="btn-primary text-white px-6 py-2 rounded-lg"> <i
                            class="fas fa-save mr-2"></i>Save Changes
                    </button>
                </div>

                <div class="mt-8">
                    <h3 class="text-lg font-semibold mb-4">Real-time Preview</h3>

                    <div class="border rounded-lg overflow-hidden">
                        <div class="bg-gray-800 text-white p-3 flex items-center">
                            <div class="flex space-x-2">
                                <div class="w-3 h-3 bg-red-500 rounded-full"></div>
                                <div class="w-3 h-3 bg-yellow-500 rounded-full"></div>
                                <div class="w-3 h-3 bg-green-500 rounded-full"></div>
                            </div>
                            <div class="flex-1 text-center">Preview</div>
                        </div>
                        <div id="previewBanner"
                            class="h-64 bg-cover bg-center flex flex-col items-center justify-center text-white p-6 text-center"
                            style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('{{ $banner->banner_image ? $banner->image_url : '' }}');">
                            <h2 class="text-3xl font-bold mb-3" id="previewTitle">
                                {{ old('title', $banner->title) }}
                            </h2>
                            <p class="text-lg mb-6 max-w-2xl" id="previewSubtitle">
                                {{ old('subtitle', $banner->subtitle) }}
                            </p>
                            <button
                                class="bg-white text-blue-800 px-6 py-3 rounded-lg font-medium hover:bg-gray-100 transition"
                                id="previewButton">
                                {{ old('button_text', $banner->button_text) }}
                            </button>
                        </div>
                    </div>
                </div>

            </form>
        </div>
    </div>
@endsection

@section('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Get elements
            const titleInput = document.querySelector('input[name="title"]');
            const subtitleInput = document.querySelector('textarea[name="subtitle"]');
            const buttonTextInput = document.querySelector('input[name="button_text"]');
            const imageInput = document.querySelector('input[name="banner_image"]');

            const previewTitle = document.getElementById('previewTitle');
            const previewSubtitle = document.getElementById('previewSubtitle');
            const previewButton = document.getElementById('previewButton');
            const previewBanner = document.getElementById('previewBanner');
            const currentImagePreview = document.getElementById('currentImagePreview');
            const imagePlaceholder = document.getElementById('imagePlaceholder');

            // Text updates
            [titleInput, subtitleInput, buttonTextInput].forEach(input => {
                input.addEventListener('input', function() {
                    if (input === titleInput) {
                        previewTitle.textContent = input.value || '{{ $banner->title }}';
                    } else if (input === subtitleInput) {
                        previewSubtitle.textContent = input.value || '{{ $banner->subtitle }}';
                    } else if (input === buttonTextInput) {
                        previewButton.textContent = input.value || '{{ $banner->button_text }}';
                    }
                });
            });

            // Image preview and background update
            imageInput.addEventListener('change', function(e) {
                if (this.files && this.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function(e) {
                        // Update preview banner background
                        previewBanner.style.backgroundImage =
                            `linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url(${e.target.result})`;

                        // Update image preview
                        if (currentImagePreview) {
                            currentImagePreview.src = e.target.result;
                        } else if (imagePlaceholder) {
                            imagePlaceholder.innerHTML =
                                `<img src="${e.target.result}" alt="Preview" class="w-full h-48 object-cover rounded-lg mb-4">`;
                        }
                    }

                    reader.readAsDataURL(this.files[0]);
                }
            });

            // Initialize preview with current image
            @if ($banner->banner_image)
                previewBanner.style.backgroundImage =
                    `linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('{{ $banner->image_url }}')`;
            @endif
        });
    </script>
@endsection

<style>
    .section-content {
        max-width: 1200px;
        margin: 0 auto;
    }

    .btn-primary {
        background-color: #3b82f6;
        display: inline-block;
        transition: background-color 0.3s ease;
    }

    .btn-primary:hover {
        background-color: #2563eb;
    }

    .bg-primary {
        background-color: #3b82f6;
    }

    .bg-secondary {
        background-color: #2563eb;
    }

    .bg-red {
        background-color: #ef4444;
    }

    .focus\:ring-primary:focus {
        --tw-ring-color: rgba(59, 130, 246, 0.5);
    }

    #previewBanner {
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
    }

    .border-dashed {
        border-style: dashed;
    }

    @media (max-width: 768px) {
        .grid-cols-1 {
            grid-template-columns: 1fr;
        }

        .lg\:grid-cols-2 {
            grid-template-columns: 1fr;
        }
    }
</style>
