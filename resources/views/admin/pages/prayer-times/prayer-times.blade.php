 @extends('admin.layouts.app')

 @section('title', 'Mosque - Prayer Times')
 @section('page-title', 'Prayer Time Management')

 @section('content')
     <div class="container mx-auto px-4 max-w-6xl">
         <div class="bg-white rounded-xl shadow-lg p-8">
             <!-- Header -->
             <div class="text-center mb-8">
                 <h1 class="text-3xl font-bold text-gray-800 mb-2">
                     <i class="fas fa-mosque text-green-600 mr-3"></i>
                     Prayer Time Management
                 </h1>
                 <p class="text-gray-600">Manage daily prayer times for your mosque</p>
             </div>

             <!-- Success Message -->
             @if (session('success'))
                 <div class="success-message bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded-lg relative mb-6"
                     role="alert">
                     <span class="block sm:inline">{{ session('success') }}</span>
                     <button onclick="this.parentElement.style.display='none'"
                         class="absolute top-0 bottom-0 right-0 px-4 py-3">
                         <i class="fas fa-times"></i>
                     </button>
                 </div>
             @endif

             <!-- Prayer Times Form -->
             <form id="prayerTimeForm" method="POST" action="{{ route('admin.prayer-times.update') }}"
                 class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
                 @csrf
                 @method('PUT')

                 <!-- Fajr -->
                 <div class="prayer-card rounded-lg p-6">
                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-sun prayer-icon"></i>Fajr (Dawn Prayer)
                     </label>
                     <input type="time" name="fajr" value="{{ old('fajr', $prayerTime->raw_fajr) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('fajr')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Dhuhr -->
                 <div class="prayer-card rounded-lg p-6">
                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-sun prayer-icon"></i>Dhuhr (Noon Prayer)
                     </label>
                     <input type="time" name="dhuhr" value="{{ old('dhuhr', $prayerTime->raw_dhuhr) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('dhuhr')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Asr -->
                 <div class="prayer-card rounded-lg p-6">
                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-cloud-sun prayer-icon"></i>Asr (Afternoon Prayer)
                     </label>
                     <input type="time" name="asr" value="{{ old('asr', $prayerTime->raw_asr) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('asr')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Maghrib -->
                 <div class="prayer-card rounded-lg p-6">
                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-moon prayer-icon"></i>Maghrib (Sunset Prayer)
                     </label>
                     <input type="time" name="maghrib" value="{{ old('maghrib', $prayerTime->raw_maghrib) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('maghrib')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Isha -->
                 <div class="prayer-card rounded-lg p-6">

                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-star prayer-icon"></i>Isha (Night Prayer)
                     </label>
                     <input type="time" name="isha" value="{{ old('isha', $prayerTime->raw_isha) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('isha')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Jummah -->
                 <div class="prayer-card rounded-lg p-6">
                     <label class="form-label block text-sm mb-3">
                         <i class="fas fa-users prayer-icon"></i>Jummah (Friday Prayer)
                     </label>
                     <input type="time" name="jummah" value="{{ old('jummah', $prayerTime->raw_jummah) }}"
                         class="time-input w-full px-4 py-3 border border-gray-300 rounded-lg focus:outline-none focus:ring-2 focus:ring-green-500 focus:border-transparent">
                     @error('jummah')
                         <div class="text-red-500 text-sm mt-1">{{ $message }}</div>
                     @enderror
                 </div>

                 <!-- Submit Button -->
                 <div class="md:col-span-2 lg:col-span-3 text-center mt-6">
                     <button type="submit" class="btn-primary text-white px-8 py-3 rounded-lg font-semibold shadow-lg">
                         <i class="fas fa-save mr-2"></i>Save Prayer Times
                     </button>
                 </div>
             </form>

             <!-- Current Time Display -->
             <div class="mt-8 text-center">
                 <div class="bg-gray-100 rounded-lg p-4 inline-block">
                     <h3 class="text-lg font-semibold text-gray-700 mb-2">Current Time</h3>
                     <div id="currentTime" class="text-2xl font-mono text-green-600"></div>
                 </div>
             </div>
         </div>
     </div>
 @endsection

 @push('scripts')
     <script>
         // Update current time
         function updateCurrentTime() {
             const now = new Date();
             const timeString = now.toLocaleTimeString('en-US', {
                 hour12: false,
                 hour: '2-digit',
                 minute: '2-digit',
                 second: '2-digit'
             });
             document.getElementById('currentTime').textContent = timeString;
         }

         // Update time every second
         setInterval(updateCurrentTime, 1000);
         updateCurrentTime(); // Initial call

         // Add focus animations to inputs
         document.querySelectorAll('.time-input').forEach(input => {
             input.addEventListener('focus', function() {
                 this.parentNode.style.transform = 'scale(1.02)';
             });

             input.addEventListener('blur', function() {
                 this.parentNode.style.transform = 'scale(1)';
             });
         });
     </script>
 @endpush
