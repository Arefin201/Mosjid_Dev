<header class="bg-white shadow-sm border-b">
    <div class="flex items-center justify-between px-4 sm:px-6 py-4">
        <div class="flex items-center">
            <button id="mobileMenuBtn" class="lg:hidden mr-4 text-gray-600 mobile-menu-btn">
                <i class="fas fa-bars text-xl"></i>
            </button>
            <div>
                <h2 id="pageTitle" class="text-xl sm:text-2xl font-semibold text-gray-800">Dashboard</h2>
                <p class="text-xs sm:text-sm text-gray-600" id="currentDateTime"></p>
            </div>
        </div>

        <div class="flex items-center space-x-4">
            <button class="relative text-gray-600 hover:text-gray-800">
                <i class="fas fa-bell text-xl"></i>
                <span
                    class="absolute -top-2 -right-2 bg-red-500 text-white text-xs rounded-full w-5 h-5 flex items-center justify-center notification-badge">3</span>
            </button>

            <div class="relative">
                <button id="profileBtn"
                    class="flex items-center space-x-2 bg-gray-100 rounded-lg px-3 py-2 hover:bg-gray-200">
                    <img src="data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' fill='none' viewBox='0 0 24 24' stroke='currentColor'%3E%3Cpath stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z'/%3E%3C/svg%3E"
                        alt="Admin" class="w-8 h-8 rounded-full bg-green-700 text-white p-1">
                    <span class="text-sm font-medium hidden sm:block">Admin</span>
                    <i class="fas fa-chevron-down text-xs"></i>
                </button>

                <div id="profileDropdown"
                    class="absolute right-0 mt-2 w-48 bg-white rounded-lg shadow-lg border hidden">
                    <a href="{{ route('admin.profile.index') }}"
                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Profile</a>
                    <a href="{{ route('admin.settings.mosque') }}"
                        class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">Settings</a>
                    <a href="{{ route('admin.logout') }}"
                        class="block px-4 py-2 text-sm text-red-600 hover:bg-gray-100">Logout</a>
                </div>
            </div>
        </div>
    </div>
</header>
