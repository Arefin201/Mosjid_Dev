@extends('admin.layouts.app')

@section('title', 'Leadership Management')
@section('page-title', 'Leadership Management')

@section('content')
    <main class="p-4 sm:p-6">
        <div class="container mx-auto px-6 py-8">
            <div class="flex justify-between items-center mb-8">
                <h1 class="text-3xl font-bold text-gray-800">Leadership Management</h1>
                <div class="flex gap-3">
                    <a href="{{ route('admin.leadership.create') }}" id="addLeaderBtn"
                        class="bg-emerald-600 hover:bg-emerald-700 text-white px-6 py-2 rounded-lg flex items-center gap-2 transition-colors duration-200">
                        <svg class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4"></path>
                        </svg>
                        Add Leader
                    </a>
                    
                </div>
            </div>

            <div id="leadersGrid" class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                @foreach ($leaders as $key=> $leader)
                    <div class="leader-card bg-white rounded-xl shadow-lg overflow-hidden" data-id="{{ $leader->id }}"
                        data-order="{{ $leader->order }}">
                        <div class="relative">
                            <img src="{{ $leader->photo_url }}" alt="{{ $leader->name }}" class="w-full h-64 object-cover">
                            <div
                                class="absolute top-4 left-4 bg-white rounded-full w-8 h-8 flex items-center justify-center font-bold text-gray-700 shadow-md">
                                {{ $key+1 }}
                            </div>
                        </div>
                        <div class="p-6">
                            <h3 class="text-xl font-bold text-gray-800 mb-1">{{ $leader->name }}</h3>
                            <p class="text-orange-500 font-semibold mb-3">{{ $leader->designation }}</p>
                            <p class="text-gray-600 text-sm mb-4">{{ $leader->bio }}</p>

                            <div class="space-y-2 mb-6">
                                @if ($leader->email)
                                    <div class="flex items-center gap-2 text-sm text-gray-600">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207">
                                            </path>
                                        </svg>
                                        {{ $leader->email }}
                                    </div>
                                @endif

                                @if ($leader->phone)
                                    <div class="flex items-center gap-2 text-sm text-blue-600">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z">
                                            </path>
                                        </svg>
                                        {{ $leader->phone }}
                                    </div>
                                @endif
                            </div>

                            <div class="flex justify-between items-center">
                                <div class="flex gap-2">
                                    <button
                                        class="move-up-btn action-btn p-2 text-gray-500 hover:text-emerald-600 hover:bg-emerald-50 rounded-lg"
                                        title="Move Up">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M5 15l7-7 7 7"></path>
                                        </svg>
                                    </button>
                                    <button
                                        class="move-down-btn action-btn p-2 text-gray-500 hover:text-emerald-600 hover:bg-emerald-50 rounded-lg"
                                        title="Move Down">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M19 9l-7 7-7-7"></path>
                                        </svg>
                                    </button>
                                </div>
                                <div class="flex gap-2">
                                    <a href="{{ route('admin.leadership.edit', $leader->id) }}"
                                        class="action-btn p-2 text-gray-500 hover:text-blue-600 hover:bg-blue-50 rounded-lg"
                                        title="Edit">
                                        <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z">
                                            </path>
                                        </svg>
                                    </a>
                                    {{-- Remove this --}}

                                    <form action="{{ route('admin.leadership.destroy', $leader->id) }}" method="POST">
                                        @csrf
                                        @method('DELETE')
                                       <button
                                        class="delete-btn action-btn p-2 text-gray-500 hover:text-red-600 hover:bg-red-50 rounded-lg"
                                        title="submit" data-id="{{ $leader->id }}"  onclick="return confirm('Are you sure?')">
                                         <svg class="w-4 h-4" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                                d="M19 7l-.867 12.142A2 2 0 0116.138 21H7.862a2 2 0 01-1.995-1.858L5 7m5 4v6m4-6v6m1-10V4a1 1 0 00-1-1h-4a1 1 0 00-1 1v3M4 7h16">
                                            </path>
                                        </svg>
                                    </button> 
                                    </form>
                                    {{-- Add this instead --}}
                                    
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    </main>


@endsection

@section('scripts')
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Modal Handling
            const addLeaderBtn = document.getElementById('addLeaderBtn');
            const closeModal = document.getElementById('closeModal');
            const cancelBtn = document.getElementById('cancelBtn');
            const addLeaderModal = document.getElementById('addLeaderModal');

            if (addLeaderBtn) {
                addLeaderBtn.addEventListener('click', function(e) {
                    e.preventDefault();
                    addLeaderModal.style.display = 'flex';
                });
            }

            if (closeModal) {
                closeModal.addEventListener('click', function() {
                    addLeaderModal.style.display = 'none';
                });
            }

            if (cancelBtn) {
                cancelBtn.addEventListener('click', function() {
                    addLeaderModal.style.display = 'none';
                });
            }

            // Photo Upload Handling
            const photoInput = document.getElementById('photoInput');
            const photoUrl = document.getElementById('photoUrl');
            const photoUploadArea = document.querySelector('.photo-upload-area');

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
                    }
                });
            }

            // Move Leader Cards
            document.querySelectorAll('.move-up-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const card = this.closest('.leader-card');
                    const prevCard = card.previousElementSibling;

                    if (prevCard) {
                        card.parentNode.insertBefore(card, prevCard);
                        updateOrderNumbers();
                    }
                });
            });

            document.querySelectorAll('.move-down-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const card = this.closest('.leader-card');
                    const nextCard = card.nextElementSibling;

                    if (nextCard) {
                        card.parentNode.insertBefore(nextCard, card);
                        updateOrderNumbers();
                    }
                });
            });

            function updateOrderNumbers() {
                document.querySelectorAll('.leader-card').forEach((card, index) => {
                    const orderBadge = card.querySelector('.order-badge');
                    if (orderBadge) {
                        orderBadge.textContent = index + 1;
                    }
                    card.dataset.order = index + 1;
                });
            }

            // Save Order Changes
            const saveChangesBtn = document.getElementById('saveChangesBtn');
            if (saveChangesBtn) {
                saveChangesBtn.addEventListener('click', async function() {
                    const order = [];
                    document.querySelectorAll('.leader-card').forEach(card => {
                        order.push(card.dataset.id);
                    });

                    try {
                        const response = await fetch("{{ route('admin.leadership.reorder') }}", {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': document.querySelector(
                                    'meta[name="csrf-token"]').content
                            },
                            body: JSON.stringify({
                                order
                            })
                        });

                        const data = await response.json();

                        if (response.ok) {
                            alert('Order saved successfully!');
                        } else {
                            alert('Error: ' + (data.message || 'Failed to save order'));
                        }
                    } catch (error) {
                        console.error('Error:', error);
                        alert('Network error occurred');
                    }
                });
            }

            // Delete Leader
            document.querySelectorAll('.delete-btn').forEach(btn => {
                btn.addEventListener('click', function() {
                    const leaderId = this.dataset.id;

                    if (confirm('Are you sure you want to delete this leader?')) {
                        fetch(`/admin/leadership/${leaderId}`, {
                                method: 'DELETE',
                                headers: {
                                    'X-CSRF-TOKEN': document.querySelector(
                                        'meta[name="csrf-token"]').content
                                }
                            })
                            .then(response => response.json())
                            .then(data => {
                                if (data.success) {
                                    this.closest('.leader-card').remove();
                                    updateOrderNumbers();
                                } else {
                                    alert('Error: ' + (data.message || 'Failed to delete'));
                                }
                            })
                            .catch(error => {
                                console.error('Error:', error);
                                alert('Network error occurred');
                            });
                    }
                });
            });
        });
    </script>
@endsection
