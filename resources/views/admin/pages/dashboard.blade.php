@extends('admin.layouts.app')

@section('title', 'Dashboard')
@section('page-title', 'Dashboard')

@section('content')
    <!-- Dashboard Page -->
    <div id="dashboardPage" class="page-content">
        @if (isset($db_error))
            <div class="bg-red-500 text-white p-4 text-center">
                <h2 class="text-xl font-bold">Database Connection Error</h2>
                <p>{{ $db_error }}</p>
                <p class="mt-2">Please check your database configuration and try again</p>
            </div>
        @endif

        <!-- Ramadan Countdown -->
        <div class="ramadan-timer mb-8">
            <h3 class="text-xl font-bold mb-4">
                <i class="fas fa-moon mr-2"></i>
                Ramadan Countdown 2025
            </h3>
            <div class="flex justify-center space-x-2" id="ramadanTimer">
                <div class="timer-unit">
                    <div class="text-2xl font-bold" id="days">--</div>
                    <div class="text-sm">Days</div>
                </div>
                <div class="timer-unit">
                    <div class="text-2xl font-bold" id="hours">--</div>
                    <div class="text-sm">Hours</div>
                </div>
                <div class="timer-unit">
                    <div class="text-2xl font-bold" id="minutes">--</div>
                    <div class="text-sm">Minutes</div>
                </div>
                <div class="timer-unit">
                    <div class="text-2xl font-bold" id="seconds">--</div>
                    <div class="text-sm">Seconds</div>
                </div>
            </div>
        </div>

        <!-- Stats Cards -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6 mb-8 stats-cards">
            <div class="bg-white p-6 rounded-lg shadow-sm card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm">Total Donors</p>
                        <p class="text-3xl font-bold count-up" data-count="{{ $stats['donors'] }}">0</p>
                    </div>
                    <div class="bg-green-100 p-3 rounded-full">
                        <i class="fas fa-users text-green-600 text-xl"></i>
                    </div>
                </div>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm">Monthly Collection</p>
                        <p class="text-3xl font-bold text-gray-800">৳{{ number_format($stats['monthly_collection']) }}</p>
                    </div>
                    <div class="bg-blue-100 p-3 rounded-full">
                        <i class="fas fa-hand-holding-usd text-blue-600 text-xl"></i>
                    </div>
                </div>
            </div>

           
            <div class="bg-white p-6 rounded-lg shadow-sm card-hover">
                <div class="flex items-center justify-between">
                    <div>
                        <p class="text-gray-600 text-sm">Announcements</p>
                        <p class="text-3xl font-bold count-up" data-count="{{ $stats['announcements'] }}">0</p>
                    </div>
                    <div class="bg-purple-100 p-3 rounded-full">
                        <i class="fas fa-bullhorn text-purple-600 text-xl"></i>
                    </div>
                </div>
            </div>
        </div>

        <!-- Charts Row -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8 charts-row">
            <div class="bg-white p-6 rounded-lg shadow-sm">
                <h3 class="text-lg font-semibold mb-4">Monthly Collection Trend</h3>
                <canvas id="collectionChart" width="400" height="200"></canvas>
            </div>

            <div class="bg-white p-6 rounded-lg shadow-sm">
                <h3 class="text-lg font-semibold mb-4">Today's Prayer Times</h3>
                <div class="space-y-3">
                    <div class="prayer-time-card p-4 rounded-lg">
                        <div class="flex justify-between items-center">
                            <span class="font-medium">Fajr</span>
                            <span class="text-lg font-bold">
                                {{ $prayerTimes->fajr ?? 'N/A' }}
                            </span>
                        </div>
                    </div>
                    <div class="prayer-time-card p-4 rounded-lg">
                        <div class="flex justify-between items-center">
                            <span class="font-medium">Dhuhr</span>
                            <span class="text-lg font-bold">
                                {{ $prayerTimes->dhuhr ?? 'N/A' }}
                            </span>
                        </div>
                    </div>
                    <div class="prayer-time-card p-4 rounded-lg">
                        <div class="flex justify-between items-center">
                            <span class="font-medium">Asr</span>
                            <span class="text-lg font-bold">
                                {{ $prayerTimes->asr ?? 'N/A' }}
                            </span>
                        </div>
                    </div>
                    <div class="prayer-time-card p-4 rounded-lg">
                        <div class="flex justify-between items-center">
                            <span class="font-medium">Maghrib</span>
                            <span class="text-lg font-bold">
                                {{ $prayerTimes->maghrib ?? 'N/A' }}
                            </span>
                        </div>
                    </div>
                    <div class="prayer-time-card p-4 rounded-lg">
                        <div class="flex justify-between items-center">
                            <span class="font-medium">Isha</span>
                            <span class="text-lg font-bold">
                                {{ $prayerTimes->isha ?? 'N/A' }}
                            </span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Recent Donors & Announcements -->
        <div class="grid grid-cols-1 lg:grid-cols-2 gap-6 mb-8">
            <!-- Recent Donors -->
            <div class="bg-white p-6 rounded-lg shadow-sm">
                <h3 class="text-lg font-semibold mb-4">Recent Donors</h3>
                <div class="overflow-x-auto">
                    <table class="min-w-full divide-y divide-gray-200">
                        <thead class="bg-gray-50">
                            <tr>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Name</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Amount</th>
                                <th class="px-6 py-3 text-left text-xs font-medium text-gray-500 uppercase tracking-wider">Date</th>
                            </tr>
                        </thead>
                        <tbody class="bg-white divide-y divide-gray-200">
                            @forelse($recentDonors as $donor)
                            <tr>
                                <td class="px-6 py-4 whitespace-nowrap">{{ $donor->name }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">৳{{ number_format($donor->amount) }}</td>
                                <td class="px-6 py-4 whitespace-nowrap">
                                    {{ $donor->last_paid ? \Carbon\Carbon::parse($donor->last_paid)->format('M d, Y') : 'N/A' }}
                                </td>
                            </tr>
                            @empty
                            <tr>
                                <td colspan="3" class="px-6 py-4 text-center text-gray-500">
                                    No donors found
                                </td>
                            </tr>
                            @endforelse
                        </tbody>
                    </table>
                </div>
            </div>
            
            <!-- Recent Announcements -->
            <div class="bg-white p-6 rounded-lg shadow-sm">
                <h3 class="text-lg font-semibold mb-4">Recent Announcements</h3>
                <div class="space-y-4">
                    @forelse($recentAnnouncements as $announcement)
                    <div class="announcement-card p-4 border rounded-lg hover:bg-gray-50 transition-colors">
                        <h4 class="font-bold text-lg truncate">{{ $announcement->title }}</h4>
                        <p class="text-gray-600 text-sm mt-1">
                            {{ \Carbon\Carbon::parse($announcement->date)->format('M d, Y') }}
                        </p>
                        <p class="text-sm mt-2 line-clamp-2">{{ $announcement->description }}</p>
                    </div>
                    @empty
                    <div class="text-center py-4 text-gray-500">
                        No announcements found
                    </div>
                    @endforelse
                </div>
            </div>
        </div>
    </div>
@endsection

@section('scripts')
<script>
    // Dashboard initialization
    document.addEventListener('DOMContentLoaded', function() {
        initializeCharts();
        startCountUpAnimations();
        startRamadanCountdown();
    });

    // Initialize charts
    function initializeCharts() {
        const ctx = document.getElementById('collectionChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
                datasets: [{
                    label: 'Monthly Collection (৳)',
                    data: [65000, 70000, 68000, 85000, 78000, 85000],
                    borderColor: '#059669',
                    backgroundColor: 'rgba(5, 150, 105, 0.1)',
                    tension: 0.4,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: { legend: { display: false } },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function(value) {
                                return '৳' + value.toLocaleString();
                            }
                        }
                    }
                }
            }
        });
    }

    // Animate counting up numbers
    function startCountUpAnimations() {
        document.querySelectorAll('.count-up').forEach(el => {
            const target = +el.dataset.count;
            const prefix = el.dataset.prefix || '';
            let count = 0;
            const increment = target / 100;
            const updateCount = () => {
                if (count < target) {
                    count += increment;
                    el.textContent = prefix + Math.round(count).toLocaleString();
                    requestAnimationFrame(updateCount);
                } else {
                    el.textContent = prefix + target.toLocaleString();
                }
            };
            updateCount();
        });
    }

    // Ramadan countdown timer
    function startRamadanCountdown() {
        const ramadanDate = new Date('March 1, 2025 00:00:00').getTime();
        
        function updateTimer() {
            const now = new Date().getTime();
            const diff = ramadanDate - now;
            
            if (diff <= 0) {
                document.getElementById('days').textContent = '0';
                document.getElementById('hours').textContent = '0';
                document.getElementById('minutes').textContent = '0';
                document.getElementById('seconds').textContent = '0';
                return;
            }
            
            const days = Math.floor(diff / (1000 * 60 * 60 * 24));
            const hours = Math.floor((diff % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((diff % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((diff % (1000 * 60)) / 1000);
            
            document.getElementById('days').textContent = days;
            document.getElementById('hours').textContent = hours.toString().padStart(2, '0');
            document.getElementById('minutes').textContent = minutes.toString().padStart(2, '0');
            document.getElementById('seconds').textContent = seconds.toString().padStart(2, '0');
        }
        
        updateTimer();
        setInterval(updateTimer, 1000);
    }
</script>
@endsection

@section('styles')
<style>
    .timer-unit {
        @apply bg-green-50 rounded-lg p-4 text-center min-w-[70px];
    }
    .card-hover {
        @apply transition-all duration-300 hover:shadow-md hover:-translate-y-1;
    }
    .prayer-time-card {
        @apply bg-gray-50 hover:bg-green-50 transition-colors;
    }
    .announcement-card {
        @apply transition-all hover:shadow-md;
    }
</style>
@endsection