<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Badda Al-Amin Jame Mosjid| Islamic Center</title>


    <!-- SEO Meta Tags -->
    <meta name="description"
        content="Stay updated with accurate prayer times, announcements, and services from our Masjid." />
    <meta name="keywords"
        content="Mosque, Masjid, Prayer Time, Islamic Center, Jummah, Ramadan, Salah Schedule, Muslim Community" />
    <meta name="author" content="Arefin Islam" />
    <meta name="robots" content="index, follow" />

    <!-- Open Graph (Facebook, LinkedIn, WhatsApp) -->
    <meta property="og:title" content="Masjid - Accurate Prayer Times & Announcements" />
    <meta property="og:description"
        content="Get latest prayer schedules, events, and updates from your local Masjid." />
    <meta property="og:image" content="https://yourdomain.com/preview.jpg" />
    <meta property="og:url" content="https://yourdomain.com" />
    <meta property="og:type" content="website" />

    <!-- Twitter Card -->
    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Masjid - Prayer Time & Info" />
    <meta name="twitter:description" content="Follow accurate daily Salah time & Islamic announcements." />
    <meta name="twitter:image" content="https://yourdomain.com/preview.jpg" />



    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com"></script>
    <!-- Google Fonts -->
    <link
        href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700&family=Amiri:wght@400;700&display=swap"
        rel="stylesheet">
    <!-- AOS Animation -->
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <!-- Lucide Icons -->
    <script src="https://unpkg.com/lucide@latest"></script>

    <style>
        :root {
            --primary-green: #0a5f38;
            --accent-gold: #d4af37;
            --light-green: #e6f2ed;
            --dark-green: #07492a;
        }

        body {
            padding: 0;
            margin: 0;
            font-family: 'Nunito', sans-serif;
            scroll-behavior: smooth;
            background-color: #f9fafb;
        }

        .arabic {
            font-family: 'Amiri', serif;
        }

        .hero-bg {
            position: relative;
            overflow: hidden;
            z-index: 1;
            background: linear-gradient(135deg, rgba(34, 197, 94, 0.9) 0%, rgba(21, 128, 61, 0.9) 100%);
        }

        .hero-bg::before {
            content: '';
            position: absolute;
            inset: 0;
            /* background: url({{ asset('11.jpg') }}) center/cover no-repeat; */
            opacity: 0.3;
            /* Adjust this value as needed */
            z-index: -1;
        }


        .prayer-card {
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .prayer-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }

        .prayer-active {
            background-color: var(--accent-gold);
            color: white;
        }

        .donate-btn {
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(212, 175, 55, 0.3);
        }

        .donate-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(212, 175, 55, 0.4), 0 4px 6px -2px rgba(212, 175, 55, 0.2);
        }

        .islamic-pattern {
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100" viewBox="0 0 100 100"><path d="M0,0 L100,0 L100,100 L0,100 Z" fill="none" stroke="%23d4af37" stroke-width="0.5" opacity="0.1"/><path d="M50,0 C77.61,0 100,22.39 100,50 C100,77.61 77.61,100 50,100 C22.39,100 0,77.61 0,50 C0,22.39 22.39,0 50,0 Z" fill="none" stroke="%23d4af37" stroke-width="0.5" opacity="0.1"/></svg>');
            background-size: 150px;
        }

        .gallery-item {
            transition: transform 0.3s ease, opacity 0.3s ease;
        }

        .gallery-item:hover {
            transform: scale(1.03);
            opacity: 0.9;
        }

        .news-ticker {
            animation: ticker 20s linear infinite;
        }

        @keyframes ticker {
            0% {
                transform: translateX(100%);
            }

            100% {
                transform: translateX(-100%);
            }
        }

        .hover-glow:hover {
            filter: drop-shadow(0 0 6px rgba(212, 175, 55, 0.7));
        }

        .minaret-decoration {
            position: relative;
        }

        .minaret-decoration::after {
            content: "";
            position: absolute;
            top: -15px;
            left: 50%;
            transform: translateX(-50%);
            width: 8px;
            height: 30px;
            background-color: var(--accent-gold);
            border-radius: 4px;
        }

        .glow-text {
            text-shadow: 0 0 15px rgba(212, 175, 55, 0.8);
        }


        /* Responsive adjustments */
        @media (max-width: 768px) {
            .donor-scroll-container {
                height: 40vh !important;
            }

            .donation-breakdown {
                grid-template-columns: 1fr !important;
            }

            .total-amount {
                font-size: 2rem !important;
            }
        }

        @media (max-width: 640px) {
            .donor-scroll-container {
                height: 35vh !important;
            }
        }

        .donor-card {
            transition: all 0.3s ease;
            border: 1px solid rgba(10, 95, 56, 0.2);
        }

        .donor-card:hover {
            transform: scale(1.02);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            border: 1px solid var(--accent-gold);
        }

        .gold-border {
            position: relative;
        }

        .gold-border::after {
            content: "";
            position: absolute;
            bottom: 0;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background-color: var(--accent-gold);
            border-radius: 2px;
        }

        /* Scroll animation for donor list */
        @keyframes scrollUp {
            0% {
                transform: translateY(0);
            }

            100% {
                transform: translateY(-100%);
            }
        }

        .animate-scrollUp {
            animation: scrollUp 30s linear infinite;
        }

        /* Pause animation on hover */
        .donor-scroll-container:hover .animate-scrollUp {
            animation-play-state: paused;
        }
    </style>
</head>

<body class="text-gray-800">
    <!-- Navigation -->
    <nav class="fixed w-full bg-white shadow-md z-50 minaret-decoration">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="flex justify-between h-16">
                <div class="flex items-center">
                    <div class="flex-shrink-0 flex items-center">
                        <div
                            class="h-10 w-10 rounded-full bg-green-800 flex items-center justify-center text-white font-bold text-xl">
                            م</div>
                        <span
                            class="ml-3 text-xl font-bold text-green-800">{{ $mosqueSettings->mosque_name ?? 'আল-আমিন জামে মসজিদ' }}</span>
                    </div>
                </div>

                <div class="hidden md:flex items-center space-x-8">
                    <a href="#home" class="text-green-800 hover:text-green-600 font-medium">Home</a>
                    <a href="#about" class="text-gray-600 hover:text-green-800 font-medium">About</a>
                    <a href="#donate" class="text-gray-600 hover:text-green-800 font-medium">Donate</a>
                    <a href="#gallery" class="text-gray-600 hover:text-green-800 font-medium">Gallery</a>
                    <a href="#notices" class="text-gray-600 hover:text-green-800 font-medium">Notices</a>
                    <a href="#contact" class="text-gray-600 hover:text-green-800 font-medium">Contact</a>

                    <button class="bg-green-800 text-white px-4 py-2 rounded-md hover:bg-green-700 transition">Donate
                        Now</button>
                </div>

                <div class="md:hidden flex items-center">
                    <button id="mobile-menu-button" class="text-gray-600 hover:text-green-800">
                        <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6" fill="none" viewBox="0 0 24 24"
                            stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2"
                                d="M4 6h16M4 12h16M4 18h16" />
                        </svg>
                    </button>
                </div>
            </div>
        </div>

        <!-- Mobile menu -->
        <div id="mobile-menu" class="md:hidden hidden bg-white shadow-lg">
            <div class="px-2 pt-2 pb-3 space-y-1 sm:px-3">
                <a href="#home" class="block px-3 py-2 rounded-md text-base font-medium text-green-800">Home</a>
                <a href="#about"
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-green-800">About</a>
                <a href="#donate"
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-green-800">Donate</a>
                <a href="#gallery"
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-green-800">Gallery</a>
                <a href="#notices"
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-green-800">Notices</a>
                <a href="#contact"
                    class="block px-3 py-2 rounded-md text-base font-medium text-gray-600 hover:text-green-800">Contact</a>

                <button
                    class="w-full mt-2 bg-green-800 text-white px-4 py-2 rounded-md hover:bg-green-700 transition">Donate
                    Now</button>
            </div>
        </div>
    </nav>

    @if (isset($db_error))
        <div class="bg-red-500 text-white p-4 text-center">
            <h2 class="text-xl font-bold">Database Connection Error</h2>
            <p>{{ $db_error }}</p>
            <p class="mt-2">Please check your database configuration and try again</p>
        </div>
    @endif

    <!-- Hero Section -->
    @if ($homes->isNotEmpty())
        @php
            $home = $homes->first();
            $bannerImage = $home->banner_image ? asset('storage/' . $home->banner_image) : asset('default.jpg');
        @endphp
        <section id="home" class="hero-bg pt-24 pb-32 text-white"
            style="background-image: linear-gradient(rgba(2, 71, 2, 0.288), rgba(0, 30, 0, 0.541)), url('{{ $bannerImage }}'); background-size: cover; background-position: center;">

            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="grid md:grid-cols-2 gap-12 items-center">
                    <!-- Home Content -->
                    <div>
                        <h1 class="text-4xl md:text-5xl font-bold mb-6">
                            <span class="text-yellow-300 font-light">{{ $home->title }}</span>
                        </h1>
                        <p class="text-xl mb-8 leading-relaxed text-white">{{ $home->subtitle }}</p>
                        <div class="flex flex-wrap gap-4">
                            <a href="{{ $home->button_link }}"
                                class="border-2 border-yellow-500 text-yellow-300 hover:bg-yellow-500 hover:text-green-900 font-bold py-3 px-8 rounded-full text-lg transition duration-300">
                                {{ $home->button_text }}
                            </a>
                        </div>
                    </div>

                    <!-- Prayer Times -->
                    @if ($prayerTimes)
                        <div class="bg-white/10 backdrop-blur-sm p-8 rounded-xl border border-yellow-500/30">
                            <h2 class="text-2xl font-bold mb-6 text-center text-white">Today's Prayer Times</h2>
                            <div class="space-y-4">


                                <!-- Fajr -->
                                <div
                                    class="prayer-card flex justify-between items-center bg-green-900/50 p-4 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="bg-green-800 p-3 rounded-lg mr-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                data-lucide="sunrise"
                                                class="lucide lucide-sunrise text-yellow-300 w-6 h-6">
                                                <path d="M12 2v8"></path>
                                                <path d="m4.93 10.93 1.41 1.41"></path>
                                                <path d="M2 18h2"></path>
                                                <path d="M20 18h2"></path>
                                                <path d="m19.07 10.93-1.41 1.41"></path>
                                                <path d="M22 22H2"></path>
                                                <path d="m8 6 4-4 4 4"></path>
                                                <path d="M16 18a4 4 0 0 0-8 0"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <h3 class="font-bold">ফজর </h3>
                                            <p class="text-sm text-gray-300">Dawn Prayer</p>
                                        </div>
                                    </div>
                                    <span class="text-xl font-bold">
                                        {{ $prayerTimes->fajr }}

                                    </span>
                                </div>

                                <!-- Dhuhr -->
                                <div
                                    class="prayer-card flex justify-between items-center bg-green-900/50 p-4 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="bg-green-800 p-3 rounded-lg mr-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                data-lucide="sun" class="lucide lucide-sun text-yellow-300 w-6 h-6">
                                                <circle cx="12" cy="12" r="4"></circle>
                                                <path d="M12 2v2"></path>
                                                <path d="M12 20v2"></path>
                                                <path d="m4.93 4.93 1.41 1.41"></path>
                                                <path d="m17.66 17.66 1.41 1.41"></path>
                                                <path d="M2 12h2"></path>
                                                <path d="M20 12h2"></path>
                                                <path d="m6.34 17.66-1.41 1.41"></path>
                                                <path d="m19.07 4.93-1.41 1.41"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <h3 class="font-bold">যোহর</h3>
                                            <p class="text-sm text-gray-300">Noon Prayer</p>
                                        </div>
                                    </div>
                                    <span class="text-xl font-bold">
                                        {{ $prayerTimes->dhuhr }}
                                    </span>
                                </div>

                                <!-- Asr -->
                                <div
                                    class="prayer-card flex justify-between items-center bg-green-900/50 p-4 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="bg-green-800 p-3 rounded-lg mr-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                data-lucide="cloud"
                                                class="lucide lucide-cloud text-yellow-300 w-6 h-6">
                                                <path d="M17.5 19H9a7 7 0 1 1 6.71-9h1.79a4.5 4.5 0 1 1 0 9Z"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <h3 class="font-bold">আসর</h3>
                                            <p class="text-sm text-gray-300">Afternoon Prayer</p>
                                        </div>
                                    </div>
                                    <span class="text-xl font-bold">
                                        {{ $prayerTimes->asr }}
                                    </span>
                                </div>

                                <!-- Maghrib -->
                                <div
                                    class="prayer-card flex justify-between items-center bg-green-900/50 p-4 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="bg-green-800 p-3 rounded-lg mr-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                data-lucide="sunset"
                                                class="lucide lucide-sunset text-yellow-300 w-6 h-6">
                                                <path d="M12 10V2"></path>
                                                <path d="m4.93 10.93 1.41 1.41"></path>
                                                <path d="M2 18h2"></path>
                                                <path d="M20 18h2"></path>
                                                <path d="m19.07 10.93-1.41 1.41"></path>
                                                <path d="M22 22H2"></path>
                                                <path d="m16 6-4 4-4-4"></path>
                                                <path d="M16 18a4 4 0 0 0-8 0"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <h3 class="font-bold">মাগরিব</h3>
                                            <p class="text-sm text-gray-300">Sunset Prayer</p>
                                        </div>
                                    </div>
                                    <span class="text-xl font-bold">
                                        {{ $prayerTimes->maghrib }}
                                    </span>
                                </div>

                                <!-- Isha -->
                                <div
                                    class="prayer-card flex justify-between items-center bg-green-900/50 p-4 rounded-lg">
                                    <div class="flex items-center">
                                        <div class="bg-green-800 p-3 rounded-lg mr-4">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                                viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                data-lucide="sunset"
                                                class="lucide lucide-sunset text-yellow-300 w-6 h-6">
                                                <path d="M12 10V2"></path>
                                                <path d="m4.93 10.93 1.41 1.41"></path>
                                                <path d="M2 18h2"></path>
                                                <path d="M20 18h2"></path>
                                                <path d="m19.07 10.93-1.41 1.41"></path>
                                                <path d="M22 22H2"></path>
                                                <path d="m16 6-4 4-4-4"></path>
                                                <path d="M16 18a4 4 0 0 0-8 0"></path>
                                            </svg>
                                        </div>
                                        <div>
                                            <h3 class="font-bold">ইশা</h3>
                                            <p class="text-sm text-gray-300">Night Prayer</p>
                                        </div>
                                    </div>
                                    <span class="text-xl font-bold">
                                        {{ $prayerTimes->isha }}
                                    </span>
                                </div>
                            </div>

                            <div class="mt-6 text-center">
                                <p class="text-yellow-300">Jumu'ah Prayer:
                                    {{ $prayerTimes->jummah }} </p>
                            </div>
                        </div>
                    @endif
                </div>
            </div>
        </section>
    @endif

    <!-- Monthly Donors & Collection Section -->
    <section class="py-12 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <!-- Section Header -->
            <div class="text-center mb-10">
                <h1 class="text-3xl md:text-4xl font-bold text-green-800 arabic">
                    {{ $mosqueSettings->mosque_name ?? 'আল-আমিন জামে মসজিদ' }}</h1>
                <p class="text-yellow-500 mt-2 text-lg">Monthly Supporters & Contribution</p>
                <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4 rounded-full"></div>
            </div>

            <!-- Main Content -->
            <div class="grid grid-cols-1 lg:grid-cols-2 gap-8">
                <!-- Monthly Donors Section -->
                @if ($donors->isNotEmpty())
                    <div class="bg-green-50 p-6 rounded-xl border border-green-200 shadow-sm">
                        <div class="text-center mb-6">
                            <h2 class="text-2xl font-bold text-green-800 flex items-center justify-center">
                                <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none"
                                    viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                    <path stroke-linecap="round" stroke-linejoin="round"
                                        d="M17 20h5v-2a3 3 0 00-5.356-1.857M17 20H7m10 0v-2c0-.656-.126-1.283-.356-1.857M7 20v-2c0-.656.126-1.283.356-1.857m0 0a5.002 5.002 0 019.288 0M15 7a3 3 0 11-6 0 3 3 0 016 0zm6 3a2 2 0 11-4 0 2 2 0 014 0zM7 10a2 2 0 11-4 0 2 2 0 014 0z" />
                                </svg>
                                Our Monthly Donors
                            </h2>
                            <p class="text-green-600">Regular supporters of our mosque</p>
                            <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4 rounded-full"></div>
                        </div>

                        <div
                            class="donor-scroll-container overflow-hidden relative rounded-lg border border-green-300 bg-white">
                            <ul class="animate-scrollUp space-y-3 py-4">
                                <tr class="compact-donor">
                                    @foreach ($donors as $donor)
                                        <li
                                            class="flex donor-card bg-white p-4 rounded-lg shadow text-center text-green-800 font-medium">
                                            <img src="{{ asset($donor->person_image) }}" alt="Donor"
                                                class="flex-none w-12 h-12 border-2 border-islamic-gold mr-3">
                                            {{ $donor->name }}
                                            <span class="flex-1 text-yellow-600 text-sm mt-1">৳
                                                {{ number_format($donor->amount, 2) }}</span>
                                        </li>
                                    @endforeach
                                    </td>
                                </tr>    
                            </ul>
                        </div>

                        <div class="mt-6 text-center text-green-700">
                            <p>We're grateful for our regular supporters. May Allah accept their contributions.</p>
                        </div>
                    </div>
                @endif

                <!-- Last Month's Collection Section -->
                <div
                    class="bg-gradient-to-br from-green-50 to-yellow-50 p-6 rounded-xl border border-green-200 shadow-sm">
                    <div class="text-center mb-6">
                        <h2 class="text-2xl font-bold text-green-800 flex items-center justify-center">
                            <svg xmlns="http://www.w3.org/2000/svg" class="h-6 w-6 mr-2" fill="none"
                                viewBox="0 0 24 24" stroke="currentColor" stroke-width="2">
                                <path stroke-linecap="round" stroke-linejoin="round"
                                    d="M12 8c-1.657 0-3 .895-3 2s1.343 2 3 2 3 .895 3 2-1.343 2-3 2m0-8c1.11 0 2.08.402 2.599 1M12 8V7m0 1v8m0 0v1m0-1c-1.11 0-2.08-.402-2.599-1M21 12a9 9 0 11-18 0 9 9 0 0118 0z" />
                            </svg>
                            Current Month's Collection
                        </h2>
                        <p class="text-green-600">Summary of donations received</p>
                        <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4 rounded-full"></div>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow-sm mb-6">
                        <div class="text-center">
                            <p class="text-green-700 text-lg arabic">{{ now()->format('F Y') }}</p>
                            <p class="text-green-800 mt-1">Total Donations</p>
                            <div class="mt-4">
                                <span id="total-amount" class="text-4xl md:text-5xl font-bold text-green-800">
                                    ৳ {{ number_format($currentMonthTotal, 2) }}
                                </span>
                            </div>
                        </div>
                    </div>

                    <div class="bg-white p-6 rounded-xl shadow-sm">
                        <h3 class="text-xl font-bold text-green-800 text-center gold-border pb-4 mb-4">Breakdown of
                            Donations</h3>

                        <div class="mb-6">
                            <canvas id="donationChart" height="200"></canvas>
                        </div>

                        <div class="grid grid-cols-1 md:grid-cols-2 gap-4 donation-breakdown">
                            @php
                                $categories = [
                                    'monthly_chanda' => ['label' => 'Monthly Chanda', 'color' => 'bg-green-600'],
                                    'zakat' => ['label' => 'Zakat', 'color' => 'bg-red-600'],
                                    'fitrah' => ['label' => 'Fitrah', 'color' => 'bg-yellow-800'],
                                    'mosque_fund' => ['label' => 'Mosque Fund', 'color' => 'bg-cyan-600'],
                                ];
                            @endphp

                            @foreach ($categories as $key => $category)
                                @php
                                    $amount = $chartData[$key] ?? 0;
                                    $percentage = $currentMonthTotal > 0 ? ($amount / $currentMonthTotal) * 100 : 0;
                                @endphp
                                <div class="bg-green-50 p-3 rounded-lg border border-green-200">
                                    <div class="flex justify-between">
                                        <span class="text-green-800 font-medium">{{ $category['label'] }}</span>
                                        <span class="text-yellow-600 font-bold">৳
                                            {{ number_format($amount, 2) }}</span>
                                    </div>
                                    <div class="w-full bg-gray-200 rounded-full h-2 mt-2">
                                        <div class="{{ $category['color'] }} h-2 rounded-full"
                                            style="width: {{ $percentage }}%"></div>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <div class="mt-6 text-center">
                        <a href="#donate"
                            class="inline-block bg-green-800 hover:bg-green-700 text-white py-3 px-8 rounded-full font-medium transition">
                            Become a Monthly Donor
                        </a>
                    </div>
                </div>

            </div>

            <!-- Footer Note -->
            <div class="bg-green-900 text-green-200 text-center py-6 arabic mt-10 rounded-xl">
                <p class="text-lg">وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ</p>
                <p class="mt-1">"My success is only by Allah" (Quran 11:88)</p>
            </div>
        </div>
    </section>

    <!-- About Section -->
    @if ($abouts->isNotEmpty())
        @php
            $about = $abouts->first();
        @endphp
        <section id="about" class="py-20 bg-white">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <h2 class="text-3xl md:text-4xl font-bold text-green-800 mb-4">About Our Mosque</h2>
                    <div class="w-24 h-1 bg-yellow-500 mx-auto"></div>
                </div>

                <div class="grid md:grid-cols-2 gap-12 items-center mb-20">
                    <div>
                        <h3 class="text-2xl font-bold text-green-800 mb-4">Our History</h3>
                        <p class="text-gray-600 mb-4 leading-relaxed">
                            {{ $about->history_paragraph1 }}
                        </p>
                    </div>
                    <div class="bg-gray-100 rounded-xl overflow-hidden shadow-lg">
                        <div class="aspect-w-16 aspect-h-9 bg-green-800/10 flex items-center justify-center">
                            <div class="text-center p-8">
                                <i class="fas fa-mosque text-green-800 text-5xl mx-auto"></i>
                                <h3 class="text-2xl font-bold text-green-800 mt-4">
                                    {{ $mosqueSettings->mosque_name ?? 'Al-Noor Mosque' }}</h3>
                                <p class="text-gray-600 mt-2"> {{ $about->history_paragraph2 }}
                                </p>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Our Leadership -->
                @if ($leaders->isNotEmpty())
                    <div>
                        <h3 class="text-2xl font-bold text-green-800 mb-8 text-center">Our Leadership</h3>
                        <div class="grid sm:grid-cols-2 md:grid-cols-3 lg:grid-cols-4 gap-8">
                            @foreach ($leaders as $leader)
                                <div
                                    class="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 hover:shadow-xl">
                                    @if ($leader->photo)
                                        <img src="{{ asset('storage/' . $leader->photo) }}"
                                            alt="{{ $leader->name }}" class="w-full h-48 object-cover">
                                    @else
                                        <div class="bg-green-800 h-48 flex items-center justify-center">
                                            <i class="fas fa-user text-yellow-300 text-4xl"></i>
                                        </div>
                                    @endif
                                    <div class="p-6">
                                        <h4 class="font-bold text-xl text-green-800">{{ $leader->name }}</h4>
                                        <p class="text-yellow-600 font-medium">{{ $leader->designation }}</p>
                                        <p class="text-gray-600 mt-2">
                                            {{ \Illuminate\Support\Str::limit($leader->bio, 80) }}</p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>
                @endif
            </div>
        </section>
    @endif
    <!-- Donation Section -->
    <section id="donate" class="py-20 bg-white">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-green-800 mb-4">Support Our Mosque</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">Your donations help us maintain our facilities, run
                    educational programs, and serve the community</p>
                <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4"></div>
            </div>

            <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-8 mb-16">
                <div class="bg-green-50 p-6 rounded-xl border border-green-200 hover:border-yellow-400 transition-all aos-init aos-animate"
                    data-aos="zoom-in">
                    <div class="text-green-800 mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" data-lucide="calendar-days"
                            class="lucide lucide-calendar-days w-10 h-10">
                            <path d="M8 2v4"></path>
                            <path d="M16 2v4"></path>
                            <rect width="18" height="18" x="3" y="4" rx="2"></rect>
                            <path d="M3 10h18"></path>
                            <path d="M8 14h.01"></path>
                            <path d="M12 14h.01"></path>
                            <path d="M16 14h.01"></path>
                            <path d="M8 18h.01"></path>
                            <path d="M12 18h.01"></path>
                            <path d="M16 18h.01"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-green-800 mb-3">Monthly Chanda</h3>
                    <p class="text-gray-600 mb-4">Regular monthly support that helps us plan ahead for community needs.
                    </p>
                    <button class="text-green-800 font-medium hover:text-green-600">Donate Monthly</button>
                </div>

                <div class="bg-green-50 p-6 rounded-xl border border-green-200 hover:border-yellow-400 transition-all aos-init aos-animate"
                    data-aos="zoom-in" data-aos-delay="100">
                    <div class="text-green-800 mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" data-lucide="scatter-chart"
                            class="lucide lucide-scatter-chart w-10 h-10">
                            <circle cx="7.5" cy="7.5" r=".5" fill="currentColor"></circle>
                            <circle cx="18.5" cy="5.5" r=".5" fill="currentColor"></circle>
                            <circle cx="11.5" cy="11.5" r=".5" fill="currentColor"></circle>
                            <circle cx="7.5" cy="16.5" r=".5" fill="currentColor"></circle>
                            <circle cx="17.5" cy="14.5" r=".5" fill="currentColor"></circle>
                            <path d="M3 3v16a2 2 0 0 0 2 2h16"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-green-800 mb-3">Zakat</h3>
                    <p class="text-gray-600 mb-4">Fulfill your Zakat obligation to support those in need through our
                        programs.</p>
                    <button class="text-green-800 font-medium hover:text-green-600">Pay Zakat</button>
                </div>

                <div class="bg-green-50 p-6 rounded-xl border border-green-200 hover:border-yellow-400 transition-all aos-init aos-animate"
                    data-aos="zoom-in" data-aos-delay="200">
                    <div class="text-green-800 mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" data-lucide="gift" class="lucide lucide-gift w-10 h-10">
                            <rect x="3" y="8" width="18" height="4" rx="1"></rect>
                            <path d="M12 8v13"></path>
                            <path d="M19 12v7a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2v-7"></path>
                            <path d="M7.5 8a2.5 2.5 0 0 1 0-5A4.8 8 0 0 1 12 8a4.8 8 0 0 1 4.5-5 2.5 2.5 0 0 1 0 5">
                            </path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-green-800 mb-3">Fitrah</h3>
                    <p class="text-gray-600 mb-4">Contribute your Fitrah to ensure everyone can celebrate Eid with joy.
                    </p>
                    <button class="text-green-800 font-medium hover:text-green-600">Give Fitrah</button>
                </div>

                <div class="bg-green-50 p-6 rounded-xl border border-green-200 hover:border-yellow-400 transition-all aos-init aos-animate"
                    data-aos="zoom-in" data-aos-delay="300">
                    <div class="text-green-800 mb-4">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                            fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                            stroke-linejoin="round" data-lucide="building" class="lucide lucide-building w-10 h-10">
                            <rect width="16" height="20" x="4" y="2" rx="2" ry="2"></rect>
                            <path d="M9 22v-4h6v4"></path>
                            <path d="M8 6h.01"></path>
                            <path d="M16 6h.01"></path>
                            <path d="M12 6h.01"></path>
                            <path d="M12 10h.01"></path>
                            <path d="M12 14h.01"></path>
                            <path d="M16 10h.01"></path>
                            <path d="M16 14h.01"></path>
                            <path d="M8 10h.01"></path>
                            <path d="M8 14h.01"></path>
                        </svg>
                    </div>
                    <h3 class="text-xl font-bold text-green-800 mb-3">Mosque Fund</h3>
                    <p class="text-gray-600 mb-4">Support the maintenance and development of our mosque facilities.</p>
                    <button class="text-green-800 font-medium hover:text-green-600">Donate Now</button>
                </div>
            </div>

            <div class="grid lg:grid-cols-2 gap-12">
                <div>
                    <h3 class="text-2xl font-bold text-green-800 mb-6">Donation Methods</h3>

                    <div class="space-y-6">
                        <div class="flex items-start">
                            <div class="bg-green-800 p-3 rounded-lg mr-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" data-lucide="smartphone"
                                    class="lucide lucide-smartphone text-yellow-300 w-6 h-6">
                                    <rect width="14" height="20" x="5" y="2" rx="2" ry="2">
                                    </rect>
                                    <path d="M12 18h.01"></path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="font-bold text-lg text-green-800 mb-2">Mobile Banking</h4>
                                <p class="text-gray-600">Send directly via mobile banking apps</p>
                                <div class="mt-2">
                                    <p class="font-medium">Bkash: <span
                                            class="font-normal">{{ $mosqueSettings->contact_phone ?? '017XX-XXXXXX' }}</span>
                                    </p>
                                    <p class="font-medium">Nagad: <span
                                            class="font-normal">{{ $mosqueSettings->contact_phone ?? '018XX-XXXXXX' }}</span>
                                    </p>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="bg-green-800 p-3 rounded-lg mr-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" data-lucide="credit-card"
                                    class="lucide lucide-credit-card text-yellow-300 w-6 h-6">
                                    <rect width="20" height="14" x="2" y="5" rx="2"></rect>
                                    <line x1="2" x2="22" y1="10" y2="10"></line>
                                </svg>
                            </div>
                            <div>
                                <h4 class="font-bold text-lg text-green-800 mb-2">Bank Transfer</h4>
                                <p class="text-gray-600">Direct deposit to our bank account</p>
                                <div class="mt-2">
                                    <p class="font-medium">Bank: ABC Islamic Bank</p>
                                    <p class="font-medium">Account:
                                        {{ $mosqueSettings->mosque_name ?? 'Al-Noor Mosque' }} Foundation</p>
                                    <p class="font-medium">Account #: 123-456-7890</p>
                                </div>
                            </div>
                        </div>

                        <div class="flex items-start">
                            <div class="bg-green-800 p-3 rounded-lg mr-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" data-lucide="hand"
                                    class="lucide lucide-hand text-yellow-300 w-6 h-6">
                                    <path d="M18 11V6a2 2 0 0 0-2-2a2 2 0 0 0-2 2"></path>
                                    <path d="M14 10V4a2 2 0 0 0-2-2a2 2 0 0 0-2 2v2"></path>
                                    <path d="M10 10.5V6a2 2 0 0 0-2-2a2 2 0 0 0-2 2v8"></path>
                                    <path
                                        d="M18 8a2 2 0 1 1 4 0v6a8 8 0 0 1-8 8h-2c-2.8 0-4.5-.86-5.99-2.34l-3.6-3.6a2 2 0 0 1 2.83-2.82L7 15">
                                    </path>
                                </svg>
                            </div>
                            <div>
                                <h4 class="font-bold text-lg text-green-800 mb-2">In Person</h4>
                                <p class="text-gray-600">Visit the mosque office to make your donation</p>
                                <p class="mt-2">Office Hours: 9:00 AM - 5:00 PM Daily</p>
                            </div>
                        </div>
                    </div>
                </div>

                <div>
                    <h3 class="text-2xl font-bold text-green-800 mb-6">Become a Monthly Supporter</h3>
                    <form class="bg-green-50 p-8 rounded-xl">
                        <div class="grid md:grid-cols-2 gap-6 mb-6">
                            <div>
                                <label class="block text-gray-700 mb-2">First Name</label>
                                <input type="text"
                                    class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            </div>
                            <div>
                                <label class="block text-gray-700 mb-2">Last Name</label>
                                <input type="text"
                                    class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            </div>
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2">Email Address</label>
                            <input type="email"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2">Phone Number</label>
                            <input type="tel"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2">Monthly Donation Amount</label>
                            <div class="grid grid-cols-4 gap-3">
                                <button type="button"
                                    class="bg-white border border-green-600 text-green-800 py-2 rounded-lg hover:bg-green-600 hover:text-white transition">$25</button>
                                <button type="button"
                                    class="bg-white border border-green-600 text-green-800 py-2 rounded-lg hover:bg-green-600 hover:text-white transition">$50</button>
                                <button type="button"
                                    class="bg-white border border-green-600 text-green-800 py-2 rounded-lg hover:bg-green-600 hover:text-white transition">$100</button>
                                <input type="text" placeholder="Other"
                                    class="col-span-1 p-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            </div>
                        </div>

                        <button type="submit"
                            class="donate-btn w-full bg-green-800 hover:bg-green-700 text-white font-bold py-3 px-8 rounded-lg text-lg">Register
                            as Monthly Supporter</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Gallery Section -->
    @if ($galleryItems->isNotEmpty())
        <section id="gallery" class="py-20 bg-green-50 islamic-pattern">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <h2 class="text-3xl md:text-4xl font-bold text-green-800 mb-4">Community Gallery</h2>
                    <p class="text-gray-600 max-w-2xl mx-auto">Moments from our mosque activities, events, and
                        community services</p>
                    <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4"></div>
                </div>

                <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
                    @foreach ($galleryItems as $item)
                        <div
                            class="gallery-item rounded-xl overflow-hidden shadow-md transition-transform duration-300 hover:scale-105">
                            @if ($item->image_path)
                                <img src="{{ asset('storage/' . $item->image_path) }}" alt="{{ $item->title }}"
                                    class="w-full h-64 object-cover">
                            @else
                                <div
                                    class="bg-gray-200 border-2 border-dashed w-full h-64 flex items-center justify-center">
                                    <i class="fas fa-image text-4xl text-gray-400"></i>
                                </div>
                            @endif
                            <div class="p-4 bg-white">
                                <h3 class="font-bold text-green-800 text-lg">{{ $item->title }}</h3>

                                @if ($item->type)
                                    <span
                                        class="inline-block bg-green-100 text-green-800 text-xs px-2 py-1 rounded-full mb-2">
                                        {{ ucfirst($item->type) }}
                                    </span>
                                @endif

                                <p class="text-gray-600 text-sm mt-1">
                                    @if ($item->event_date)
                                        <i class="fas fa-calendar-alt mr-2"></i>
                                        {{ \Carbon\Carbon::parse($item->event_date)->format('F j, Y') }}
                                    @endif
                                </p>

                                @if ($item->description)
                                    <p class="text-gray-700 mt-3 text-sm">
                                        {{ \Illuminate\Support\Str::limit($item->description, 100) }}
                                    </p>
                                @endif
                            </div>
                        </div>
                    @endforeach
                </div>

                <div class="text-center mt-10">
                    {{-- <a href="{{ route('gallery.index') }}" 
                   class="inline-block bg-green-800 hover:bg-green-700 text-white py-3 px-8 rounded-full font-medium transition">
                    View Full Gallery
                </a> --}}
                </div>
            </div>
        </section>
    @endif

    <!-- Notices Section -->
    @if ($announcements->isNotEmpty())
        <section id="notices" class="py-20 bg-white">
            <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
                <div class="text-center mb-16">
                    <h2 class="text-3xl md:text-4xl font-bold text-green-800 mb-4">Announcements & Notices</h2>
                    <p class="text-gray-600 max-w-2xl mx-auto">Stay updated with our latest news and events</p>
                    <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4"></div>
                </div>

                <div class="bg-green-800 text-white p-4 rounded-t-xl mb-6">
                    <div class="flex items-center">
                        <i class="fas fa-exclamation-circle mr-2"></i>
                        <span class="font-bold">LATEST NEWS:</span>
                        <div class="ml-4 overflow-hidden">
                            <div class="news-ticker whitespace-nowrap inline-block">
                                @foreach ($announcements->take(3) as $announcement)
                                    <span>{{ $announcement->title }} - </span>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="grid md:grid-cols-2 gap-8 mb-10">
                    <div>
                        <h3 class="text-xl font-bold text-green-800 mb-6">Upcoming Events</h3>
                        <div class="space-y-6">
                            @foreach ($announcements->where('category', 'event') as $event)
                                <div class="flex border-b pb-6">
                                    <div class="bg-green-800 text-white text-center p-3 rounded-lg w-20">
                                        <div class="text-2xl font-bold">
                                            {{ \Carbon\Carbon::parse($event->date)->format('d') }}</div>
                                        <div class="text-sm">{{ \Carbon\Carbon::parse($event->date)->format('M') }}
                                        </div>
                                    </div>
                                    <div class="ml-4">
                                        <h4 class="font-bold text-green-800">{{ $event->title }}</h4>
                                        <p class="text-gray-600 mb-2">
                                            {{ \Illuminate\Support\Str::limit($event->description, 100) }}</p>
                                        <p class="text-sm"><i class="far fa-clock mr-1"></i> {{ $event->event_time }}
                                        </p>
                                    </div>
                                </div>
                            @endforeach
                        </div>
                    </div>

                    <div>
                        <h3 class="text-xl font-bold text-green-800 mb-6">Recent Announcements</h3>
                        <div class="bg-green-50 rounded-xl p-6">
                            <div class="space-y-6">
                                @foreach ($announcements->where('category', '!=', 'event') as $announcement)
                                    <div class="border-b pb-6">
                                        <h4 class="font-bold text-green-800 mb-2">{{ $announcement->title }}</h4>
                                        <p class="text-gray-600 mb-3">
                                            {{ \Illuminate\Support\Str::limit($announcement->description, 120) }}</p>
                                        <p class="text-sm text-gray-500">Posted:
                                            {{ \Carbon\Carbon::parse($announcement->date)->format('F j, Y') }}</p>
                                    </div>
                                @endforeach
                            </div>
                        </div>
                    </div>
                </div>

                <div class="text-center">
                    <button
                        class="border-2 border-green-800 text-green-800 hover:bg-green-800 hover:text-white font-bold py-3 px-8 rounded-lg text-lg transition">View
                        All Notices</button>
                </div>
            </div>
        </section>
    @endif

    <!-- Contact Section -->
    <section id="contact" class="py-20 bg-green-50">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="text-center mb-16">
                <h2 class="text-3xl md:text-4xl font-bold text-green-800 mb-4">Contact Us</h2>
                <p class="text-gray-600 max-w-2xl mx-auto">We'd love to hear from you. Reach out for inquiries,
                    feedback, or visit us.</p>
                <div class="w-24 h-1 bg-yellow-500 mx-auto mt-4"></div>
            </div>

            <div class="grid lg:grid-cols-2 gap-12">
                <div>
                    <h3 class="text-2xl font-bold text-green-800 mb-6">Get In Touch</h3>

                    <div class="space-y-6 mb-10">
                        @if ($mosqueSettings)
                            <div class="flex">
                                <div class="bg-green-800 p-3 rounded-lg mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" data-lucide="map-pin"
                                        class="lucide lucide-map-pin text-yellow-300 w-6 h-6">
                                        <path
                                            d="M20 10c0 4.993-5.539 10.193-7.399 11.799a1 1 0 0 1-1.202 0C9.539 20.193 4 14.993 4 10a8 8 0 0 1 16 0">
                                        </path>
                                        <circle cx="12" cy="10" r="3"></circle>
                                    </svg>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-green-800 mb-1">Address</h4>
                                    <p class="text-gray-600">{{ $mosqueSettings->address }}</p>
                                </div>
                            </div>

                            <div class="flex">
                                <div class="bg-green-800 p-3 rounded-lg mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" data-lucide="phone"
                                        class="lucide lucide-phone text-yellow-300 w-6 h-6">
                                        <path
                                            d="M13.832 16.568a1 1 0 0 0 1.213-.303l.355-.465A2 2 0 0 1 17 15h3a2 2 0 0 1 2 2v3a2 2 0 0 1-2 2A18 18 0 0 1 2 4a2 2 0 0 1 2-2h3a2 2 0 0 1 2 2v3a2 2 0 0 1-.8 1.6l-.468.351a1 1 0 0 0-.292 1.233 14 14 0 0 0 6.392 6.384">
                                        </path>
                                    </svg>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-green-800 mb-1">Phone</h4>
                                    <p class="text-gray-600">{{ $mosqueSettings->contact_phone }}</p>
                                </div>
                            </div>

                            <div class="flex">
                                <div class="bg-green-800 p-3 rounded-lg mr-4">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                        viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                        stroke-linecap="round" stroke-linejoin="round" data-lucide="mail"
                                        class="lucide lucide-mail text-yellow-300 w-6 h-6">
                                        <path d="m22 7-8.991 5.727a2 2 0 0 1-2.009 0L2 7"></path>
                                        <rect x="2" y="4" width="20" height="16" rx="2"></rect>
                                    </svg>
                                </div>
                                <div>
                                    <h4 class="font-bold text-lg text-green-800 mb-1">Email</h4>
                                    <p class="text-gray-600">{{ $mosqueSettings->email }}</p>
                                </div>
                            </div>
                        @endif

                        <div class="flex">
                            <div class="bg-green-800 p-3 rounded-lg mr-4">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                    viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                    stroke-linecap="round" stroke-linejoin="round" data-lucide="clock"
                                    class="lucide lucide-clock text-yellow-300 w-6 h-6">
                                    <circle cx="12" cy="12" r="10"></circle>
                                    <polyline points="12 6 12 12 16 14"></polyline>
                                </svg>
                            </div>
                            <div>
                                <h4 class="font-bold text-lg text-green-800 mb-1">Office Hours</h4>
                                <p class="text-gray-600">Saturday - Thursday: 9:00 AM - 5:00 PM</p>
                                <p class="text-gray-600">Friday: 9:00 AM - 12:00 PM & 2:00 PM - 5:00 PM</p>
                            </div>
                        </div>
                    </div>

                    <h3 class="text-2xl font-bold text-green-800 mb-6">Connect With Us</h3>
                    <div class="flex space-x-4">
                        <a href="#" class="hover-glow bg-green-800 text-white p-3 rounded-full">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" data-lucide="facebook"
                                class="lucide lucide-facebook w-5 h-5">
                                <path d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z"></path>
                            </svg>
                        </a>
                        <a href="#" class="hover-glow bg-green-800 text-white p-3 rounded-full">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" data-lucide="twitter"
                                class="lucide lucide-twitter w-5 h-5">
                                <path
                                    d="M22 4s-.7 2.1-2 3.4c1.6 10-9.4 17.3-18 11.6 2.2.1 4.4-.6 6-2C3 15.5.5 9.6 3 5c2.2 2.6 5.6 4.1 9 4-.9-4.2 4-6.6 7-3.8 1.1 0 3-1.2 3-1.2z">
                                </path>
                            </svg>
                        </a>
                        <a href="#" class="hover-glow bg-green-800 text-white p-3 rounded-full">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" data-lucide="instagram"
                                class="lucide lucide-instagram w-5 h-5">
                                <rect width="20" height="20" x="2" y="2" rx="5" ry="5">
                                </rect>
                                <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                <line x1="17.5" x2="17.51" y1="6.5" y2="6.5"></line>
                            </svg>
                        </a>
                        <a href="#" class="hover-glow bg-green-800 text-white p-3 rounded-full">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                stroke-linecap="round" stroke-linejoin="round" data-lucide="youtube"
                                class="lucide lucide-youtube w-5 h-5">
                                <path
                                    d="M2.5 17a24.12 24.12 0 0 1 0-10 2 2 0 0 1 1.4-1.4 49.56 49.56 0 0 1 16.2 0A2 2 0 0 1 21.5 7a24.12 24.12 0 0 1 0 10 2 2 0 0 1-1.4 1.4 49.55 49.55 0 0 1-16.2 0A2 2 0 0 1 2.5 17">
                                </path>
                                <path d="m10 15 5-3-5-3z"></path>
                            </svg>
                        </a>
                    </div>
                </div>

                <div>
                    <h3 class="text-2xl font-bold text-green-800 mb-6">Send a Message</h3>
                    <!-- In your contact section form -->
                    <form method="POST" action="{{ route('contact.store') }}"
                        class="bg-white p-8 rounded-xl shadow-md">
                        @csrf <!-- CSRF Protection Token -->

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2" for="name">Full Name*</label>
                            <input type="text" name="name" id="name" value="{{ old('name') }}"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            @error('name')
                                <span class="text-red-500 text-sm mt-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2" for="email">Email Address</label>
                            <input type="email" name="email" id="email" value="{{ old('email') }}"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            @error('email')
                                <span class="text-red-500 text-sm mt-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2" for="phone">Phone Number*</label>
                            <input type="tel" name="phone" id="phone" value="{{ old('phone') }}"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                            @error('phone')
                                <span class="text-red-500 text-sm mt-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2" for="subject">Subject*</label>
                            <select name="subject" id="subject"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">
                                <option value="">Select a subject</option>
                                <option value="General Inquiry"
                                    {{ old('subject') == 'General Inquiry' ? 'selected' : '' }}>General Inquiry
                                </option>
                                <option value="Prayer Times" {{ old('subject') == 'Prayer Times' ? 'selected' : '' }}>
                                    Prayer Times</option>
                                <option value="Donation Question"
                                    {{ old('subject') == 'Donation Question' ? 'selected' : '' }}>Donation Question
                                </option>
                                <option value="Event Information"
                                    {{ old('subject') == 'Event Information' ? 'selected' : '' }}>Event Information
                                </option>
                                <option value="Volunteering" {{ old('subject') == 'Volunteering' ? 'selected' : '' }}>
                                    Volunteering</option>
                            </select>
                            @error('subject')
                                <span class="text-red-500 text-sm mt-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <div class="mb-6">
                            <label class="block text-gray-700 mb-2" for="message">Message*</label>
                            <textarea name="message" id="message" rows="4"
                                class="w-full p-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-green-600 focus:border-transparent">{{ old('message') }}</textarea>
                            @error('message')
                                <span class="text-red-500 text-sm mt-1">{{ $message }}</span>
                            @enderror
                        </div>

                        <button type="submit"
                            class="w-full bg-green-800 hover:bg-green-700 text-white font-bold py-3 px-8 rounded-lg text-lg transition">
                            Send Message
                        </button>
                    </form>

                    <!-- Success Message -->
                    @if (session('success'))
                        <div class="mt-4 p-4 bg-green-100 text-green-800 rounded-lg">
                            {{ session('success') }}
                        </div>
                    @endif
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-green-900 text-white pt-16 pb-8">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="grid md:grid-cols-2 lg:grid-cols-4 gap-12 mb-16">
                @if ($mosqueSettings)
                    <div>
                        <div class="flex items-center mb-6">
                            <div
                                class="h-12 w-12 rounded-full bg-yellow-500 flex items-center justify-center text-green-900 font-bold text-xl">
                                م
                            </div>
                            <span
                                class="ml-3 text-xl font-bold text-yellow-300">{{ $mosqueSettings->mosque_name }}</span>
                        </div>
                        <p class="text-green-200 mb-6">{{ $mosqueSettings->footer_message }}</p>
                        <div class="flex space-x-4">
                            <a href="#" class="hover-glow text-green-200 hover:text-yellow-300">
                                <i class="fab fa-facebook-f"></i>
                            </a>
                            <a href="#" class="hover-glow text-green-200 hover:text-yellow-300">
                                <i class="fab fa-twitter"></i>
                            </a>
                            <a href="#" class="hover-glow text-green-200 hover:text-yellow-300">
                                <i class="fab fa-instagram"></i>
                            </a>
                            <a href="#" class="hover-glow text-green-200 hover:text-yellow-300">
                                <i class="fab fa-youtube"></i>
                            </a>
                        </div>
                    </div>
                @endif

                <div>
                    <h3 class="text-lg font-bold mb-6 text-yellow-300">Quick Links</h3>
                    <ul class="space-y-3">
                        <li><a href="#home" class="text-green-200 hover:text-yellow-300">Home</a></li>
                        <li><a href="#about" class="text-green-200 hover:text-yellow-300">About Us</a></li>
                        <li><a href="#prayer-times" class="text-green-200 hover:text-yellow-300">Prayer Times</a></li>
                        <li><a href="#donate" class="text-green-200 hover:text-yellow-300">Donate</a></li>
                        <li><a href="#gallery" class="text-green-200 hover:text-yellow-300">Gallery</a></li>
                        <li><a href="#notices" class="text-green-200 hover:text-yellow-300">Announcements</a></li>
                        <li><a href="#contact" class="text-green-200 hover:text-yellow-300">Contact</a></li>
                    </ul>
                </div>

                <div>
                    <h3 class="text-lg font-bold mb-6 text-yellow-300">Prayer Times</h3>
                    <ul class="space-y-3">
                        <li class="flex justify-between text-green-200">
                            <span>Fajr</span>
                            <span>{{ $prayerTimes->fajr }}
                            </span>
                        </li>
                        <li class="flex justify-between text-green-200">
                            <span>Dhuhr</span>
                            <span>{{ $prayerTimes->dhuhr }}
                            </span>
                        </li>
                        <li class="flex justify-between text-green-200">
                            <span>Asr</span>
                            <span>{{ $prayerTimes->asr }}
                            </span>
                        </li>
                        <li class="flex justify-between text-green-200">
                            <span>Maghrib</span>
                            <span>{{ $prayerTimes->maghrib }}
                            </span>
                        </li>
                        <li class="flex justify-between text-green-200">
                            <span>Isha</span>
                            <span>{{ $prayerTimes->isha }}
                            </span>
                        </li>
                        <li class="flex justify-between text-yellow-300 mt-4">
                            <span class="font-bold">Jumu'ah</span>
                            <span class="font-bold">{{ $prayerTimes->jummah }}</span>
                        </li>
                    </ul>
                </div>

                <div>
                    <h3 class="text-lg font-bold mb-6 text-yellow-300">Newsletter</h3>
                    <p class="text-green-200 mb-4">Subscribe to receive updates on events and programs.</p>
                    <form class="flex">
                        <input type="email" placeholder="Your email"
                            class="px-4 py-2 w-full rounded-l-lg focus:outline-none text-gray-800">
                        <button class="bg-yellow-500 text-green-900 font-bold px-4 rounded-r-lg">Join</button>
                    </form>
                </div>
            </div>

            <div class="border-t border-green-800 pt-8">
                <div class="flex flex-col md:flex-row justify-between items-center">
                    <p class="text-green-400 text-center md:text-left mb-4 md:mb-0">
                        <span class="arabic text-lg">وَمَا تَوْفِيقِي إِلَّا بِاللَّهِ</span><br>
                        "My success is only by Allah" (Quran 11:88)
                    </p>
                    <p class="text-green-400">© {{ date('Y') }}
                        {{ $mosqueSettings->mosque_name ?? 'Al-Noor Mosque' }}. All Rights Reserved.</p>
                </div>
            </div>
        </div>
    </footer>



    <script>
        // Animation function
        function animateValue(element, start, end, duration) {
            let startTimestamp = null;
            const step = (timestamp) => {
                if (!startTimestamp) startTimestamp = timestamp;
                const progress = Math.min((timestamp - startTimestamp) / duration, 1);
                const value = Math.floor(progress * (end - start) + start);
                element.innerHTML = `৳ ${value.toLocaleString('en-US', {maximumFractionDigits:2})}`;
                if (progress < 1) {
                    window.requestAnimationFrame(step);
                }
            };
            window.requestAnimationFrame(step);
        }
        // Format numbers with commas
        function numberWithCommas(x) {
            return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        }


        // Initialize AOS animations
        document.addEventListener('DOMContentLoaded', function() {
            AOS.init({
                duration: 800,
                once: true,
                easing: 'ease-in-out'
            });

            // Initialize Lucide icons
            lucide.createIcons();

            // Mobile menu toggle
            const mobileMenuButton = document.getElementById('mobile-menu-button');
            const mobileMenu = document.getElementById('mobile-menu');

            mobileMenuButton.addEventListener('click', function() {
                mobileMenu.classList.toggle('hidden');
            });


            // Animate the total amount
            const totalElement = document.getElementById('total-amount');
            const totalAmount = parseFloat("{{ $currentMonthTotal }}".replace(/,/g, ''));
            animateValue(totalElement, 0, totalAmount, 2000);

            // Initialize the pie chart
            const ctx = document.getElementById('donationChart').getContext('2d');
            const donationChart = new Chart(ctx, {
                type: 'doughnut',
                data: {
                    labels: ['Monthly Chanda', 'Zakat', 'Fitrah', 'Mosque Fund'],
                    datasets: [{
                        data: [
                            {{ $chartData['monthly_chanda'] }},
                            {{ $chartData['zakat'] }},
                            {{ $chartData['fitrah'] }},
                            {{ $chartData['mosque_fund'] }}
                        ],
                        backgroundColor: [
                            '#16b370',
                            '#ff6347',
                            '#866a49',
                            '#0000ff'
                        ],
                        borderColor: '#f9fafb',
                        borderWidth: 2
                    }]
                },
                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            position: 'bottom',
                            labels: {
                                font: {
                                    family: "'Nunito', sans-serif",
                                    size: 12
                                },
                                padding: 20
                            }
                        },
                        tooltip: {
                            callbacks: {
                                label: function(context) {
                                    return context.label + ': ' + context.raw.toLocaleString() + '৳';
                                }
                            }
                        }
                    },
                    cutout: '65%'
                }
            });

            // Update current date and time
            function updateDateTime() {
                const now = new Date();
                const dateElement = document.getElementById('current-date');
                const timeElement = document.getElementById('current-time');

                // Format date
                const options = {
                    weekday: 'long',
                    year: 'numeric',
                    month: 'long',
                    day: 'numeric'
                };
                // dateElement.textContent = now.toLocaleDateString('en-US', options);

                // Format time
                let hours = now.getHours();
                let minutes = now.getMinutes();
                const ampm = hours >= 12 ? 'PM' : 'AM';
                hours = hours % 12;
                hours = hours ? hours : 12;
                minutes = minutes < 10 ? '0' + minutes : minutes;
                // timeElement.textContent = `${hours}:${minutes} ${ampm}`;

                // Determine current prayer (simplified)
                const currentPrayer = document.getElementById('current-prayer');
                const hour = now.getHours();

                if (hour >= 5 && hour < 13) {
                    currentPrayer.textContent = 'Dhuhr';
                } else if (hour >= 13 && hour < 16) {
                    currentPrayer.textContent = 'Asr';
                } else if (hour >= 16 && hour < 19) {
                    currentPrayer.textContent = 'Maghrib';
                } else if (hour >= 19 || hour < 5) {
                    currentPrayer.textContent = 'Isha';
                } else {
                    currentPrayer.textContent = 'Fajr';
                }
            }

            // Initialize and update every minute
            // updateDateTime();
            // setInterval(updateDateTime, 60000);

            // Smooth scrolling for anchor links
            document.querySelectorAll('a[href^="#"]').forEach(anchor => {
                anchor.addEventListener('click', function(e) {
                    e.preventDefault();
                    const target = document.querySelector(this.getAttribute('href'));
                    if (target) {
                        window.scrollTo({
                            top: target.offsetTop - 80,
                            behavior: 'smooth'
                        });

                        // Close mobile menu if open
                        mobileMenu.classList.add('hidden');
                    }
                });
            });
        });
    </script>
</body>

</html>
