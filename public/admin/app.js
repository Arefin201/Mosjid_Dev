// DOM Ready
document.addEventListener('DOMContentLoaded', function () {
    // Mobile sidebar toggle
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const mobileMenuOverlay = document.getElementById('mobileMenuOverlay');
    const sidebar = document.getElementById('sidebar');
    const closeSidebarMobile = document.getElementById('closeSidebarMobile');

    function openSidebar() {
        sidebar.classList.remove('-translate-x-full');
        sidebar.classList.add('translate-x-0');
        mobileMenuOverlay.classList.remove('hidden');
        document.body.classList.add('overflow-hidden');
    }

    function closeSidebar() {
        sidebar.classList.remove('translate-x-0');
        sidebar.classList.add('-translate-x-full');
        mobileMenuOverlay.classList.add('hidden');
        document.body.classList.remove('overflow-hidden');
    }

    if (mobileMenuBtn) {
        mobileMenuBtn.addEventListener('click', openSidebar);
    }

    if (closeSidebarMobile) {
        closeSidebarMobile.addEventListener('click', closeSidebar);
    }

    if (mobileMenuOverlay) {
        mobileMenuOverlay.addEventListener('click', closeSidebar);
    }

    // Close sidebar when a sidebar link is clicked (for mobile)
    const sidebarLinks = document.querySelectorAll('.sidebar-link');
    sidebarLinks.forEach(link => {
        link.addEventListener('click', function () {
            if (window.innerWidth < 1024) {
                closeSidebar();
            }
        });
    });

    // Profile dropdown toggle
    const profileBtn = document.getElementById('profileBtn');
    const profileDropdown = document.getElementById('profileDropdown');

    if (profileBtn && profileDropdown) {
        profileBtn.addEventListener('click', function (e) {
            e.stopPropagation();
            profileDropdown.classList.toggle('hidden');
        });

        // Close dropdown when clicking outside
        document.addEventListener('click', function (e) {
            if (!profileDropdown.contains(e.target) && !profileBtn.contains(e.target)) {
                profileDropdown.classList.add('hidden');
            }
        });
    }

    // Update date and time
    function updateDateTime() {
        const now = new Date();
        const options = {
            weekday: 'long',
            year: 'numeric',
            month: 'long',
            day: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        };
        const dateTimeStr = now.toLocaleDateString('en-US', options);
        document.getElementById('currentDateTime').textContent = dateTimeStr;
    }

    updateDateTime();
    setInterval(updateDateTime, 60000); // update every minute

    // Set active page when a sidebar link is clicked
    sidebarLinks.forEach(link => {
        link.addEventListener('click', function () {
            // Remove active class from all links
            sidebarLinks.forEach(l => l.classList.remove('active-menu'));
            // Add active class to clicked link
            this.classList.add('active-menu');

            // Show the corresponding page
            const pageId = this.getAttribute('data-page') + 'Page';
            document.querySelectorAll('.page-content').forEach(page => {
                page.classList.add('hidden');
            });
            document.getElementById(pageId).classList.remove('hidden');

            // Update page title
            const pageTitleMap = {
                dashboard: 'Dashboard',
                donors: 'Donor List',
                'prayer-times': 'Prayer Times',
                collections: 'Collections',
                announcements: 'Announcements',
                gallery: 'Gallery',
                messages: 'Messages',
                settings: 'Settings',
                logout: 'Logout',
                monthlyCollection: 'Monthly Collection'
            };
            const title = pageTitleMap[this.getAttribute('data-page')] || 'Dashboard';
            document.getElementById('pageTitle').textContent = title;
        });
    });

    // Animate count-up values
    function animateValue(element, start, end, duration) {
        let startTimestamp = null;
        const step = (timestamp) => {
            if (!startTimestamp) startTimestamp = timestamp;
            const progress = Math.min((timestamp - startTimestamp) / duration, 1);
            const value = Math.floor(progress * (end - start) + start);
            element.textContent = element.textContent.includes('৳') ? '৳' + value : value;
            if (progress < 1) {
                window.requestAnimationFrame(step);
            }
        };
        window.requestAnimationFrame(step);
    }

    // Initialize count-up animations
    document.querySelectorAll('.count-up').forEach(el => {
        const target = parseInt(el.getAttribute('data-count'));
        animateValue(el, 0, target, 2000);
    });

    // Initialize charts
    // Collection Chart
    const collectionCtx = document.getElementById('collectionChart').getContext('2d');
    const collectionChart = new Chart(collectionCtx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
            datasets: [{
                label: 'Monthly Collection (৳)',
                data: [65000, 59000, 80000, 81000, 56000, 55000, 75000, 72000, 78000, 83000, 85000, 90000],
                borderColor: '#065f46',
                backgroundColor: 'rgba(6, 95, 70, 0.1)',
                tension: 0.3,
                fill: true
            }]
        },
        options: {
            responsive: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: false,
                    grid: {
                        color: 'rgba(0, 0, 0, 0.05)'
                    }
                },
                x: {
                    grid: {
                        display: false
                    }
                }
            }
        }
    });

    // Ramadan Countdown
    function updateRamadanCountdown() {
        const ramadanDate = new Date('March 10, 2025 00:00:00').getTime();
        const now = new Date().getTime();
        const difference = ramadanDate - now;

        if (difference > 0) {
            const days = Math.floor(difference / (1000 * 60 * 60 * 24));
            const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
            const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
            const seconds = Math.floor((difference % (1000 * 60)) / 1000);

            document.getElementById('days').textContent = days;
            document.getElementById('hours').textContent = hours;
            document.getElementById('minutes').textContent = minutes;
            document.getElementById('seconds').textContent = seconds;
        }
    }

    setInterval(updateRamadanCountdown, 1000);
    updateRamadanCountdown();

    // Modal functionality
    // Donor Modal
    const donorModal = document.getElementById('donorModal');
    const addDonorBtn = document.getElementById('addDonorBtn');
    const closeDonorModal = document.getElementById('closeDonorModal');

    if (addDonorBtn) {
        addDonorBtn.addEventListener('click', function () {
            donorModal.classList.remove('hidden');
        });
    }

    if (closeDonorModal) {
        closeDonorModal.addEventListener('click', function () {
            donorModal.classList.add('hidden');
        });
    }

    // Similar functionality for other modals

    // Initialize first page
    document.querySelector('.sidebar-link[data-page="dashboard"]').classList.add('active-menu');
    document.getElementById('dashboardPage').classList.remove('hidden');
});

// Helper functions
function openDonorModal(id) {
    document.getElementById('donorModal').classList.remove('hidden');
    document.getElementById('donorModalTitle').textContent = 'Edit Donor';
}

function deleteDonor(id) {
    if (confirm('Are you sure you want to delete this donor?')) {
        const donorRow = document.querySelector(`[onclick="deleteDonor(${id})"]`).closest('tr');
        if (donorRow) {
            donorRow.remove();
        }
    }
}

function deleteAnnouncement(id) {
    if (confirm('Are you sure you want to delete this announcement?')) {
        const announcementElement = document.querySelector(`[onclick="deleteAnnouncement(${id})"]`).closest('.announcement-card');
        if (announcementElement) {
            announcementElement.remove();
        }
    }
}

function deleteGalleryImage(id) {
    if (confirm('Are you sure you want to delete this image?')) {
        const imageElement = document.querySelector(`[onclick="deleteGalleryImage(${id})"]`).closest('.gallery-item');
        if (imageElement) {
            imageElement.remove();
        }
    }
}

function viewMessage(id) {
    alert(`Viewing message ${id}. In a real app, this would open a modal with the message details.`);
}

function deleteMessage(id) {
    if (confirm('Are you sure you want to delete this message?')) {
        const messageRow = document.querySelector(`[onclick="deleteMessage(${id})"]`).closest('tr');
        if (messageRow) {
            messageRow.remove();
        }
    }
}

    // Modal handlers
    // $('#addDonorBtn').click(() => openDonorModal());
    // $('#closeDonorModal').click(() => closeDonorModal());
    // $('#addAnnouncementBtn').click(() => openAnnouncementModal());
    // $('#closeAnnouncementModal').click(() => closeAnnouncementModal());

    // Form reset buttons
    // $('#resetDonorForm').click(() => $('#donorForm')[0].reset());
    // $('#resetAnnouncementForm').click(() => $('#announcementForm')[0].reset());

////////////////////////////////
   

        // // Global variables
        // let currentPage = 'dashboard';
        // let donors = [];
        // let announcements = [];
        // let messages = [];
        // let galleryImages = [];

        // // Initialize the dashboard
        // $(document).ready(function () {
        //     updateDateTime();
        //     setInterval(updateDateTime, 1000);

        //     initializeRamadanCountdown();
        //     setInterval(initializeRamadanCountdown, 1000);

        //     // animateCounters();
        //     // initializeCharts();
        //     // loadSampleData();

        //     // Event listeners
        //     setupEventListeners();

        //     // Initialize forms
        //     // initializeForms();
        // });

        // // Update date and time
        // function updateDateTime() {
        //     const now = new Date();
        //     const options = {
        //         weekday: 'long',
        //         year: 'numeric',
        //         month: 'long',
        //         day: 'numeric',
        //         hour: '2-digit',
        //         minute: '2-digit'
        //     };
        //     $('#currentDateTime').text(now.toLocaleDateString('en-US', options));
        // }

        // // Ramadan countdown timer
        // function initializeRamadanCountdown() {
        //     // Ramadan 2025 starts approximately March 1, 2025
        //     const ramadanDate = new Date('2025-03-01T00:00:00');
        //     const now = new Date();
        //     const difference = ramadanDate - now;

        //     if (difference > 0) {
        //         const days = Math.floor(difference / (1000 * 60 * 60 * 24));
        //         const hours = Math.floor((difference % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
        //         const minutes = Math.floor((difference % (1000 * 60 * 60)) / (1000 * 60));
        //         const seconds = Math.floor((difference % (1000 * 60)) / 1000);

        //         $('#days').text(days);
        //         $('#hours').text(hours);
        //         $('#minutes').text(minutes);
        //         $('#seconds').text(seconds);
        //     } else {
        //         $('#ramadanTimer').html('<div class="text-center"><h4 class="text-xl font-bold">Ramadan Mubarak!</h4></div>');
        //     }
        // }

        // // Animate counter numbers
        // // function animateCounters() {
        // //     $('.count-up').each(function () {
        // //         const $this = $(this);
        // //         const countTo = parseInt($this.attr('data-count'));
        // //         const prefix = $this.text().includes('৳') ? '৳' : '';

        // //         $({ countNum: 0 }).animate({
        // //             countNum: countTo
        // //         }, {
        // //             duration: 2000,
        // //             easing: 'swing',
        // //             step: function () {
        // //                 $this.text(prefix + Math.floor(this.countNum).toLocaleString());
        // //             },
        // //             complete: function () {
        // //                 $this.text(prefix + countTo.toLocaleString());
        // //             }
        // //         });
        // //     });
        // // }

        // // // Initialize charts
        // // function initializeCharts() {
        // //     // Collection trend chart
        // //     const ctx1 = document.getElementById('collectionChart').getContext('2d');
        // //     new Chart(ctx1, {
        // //         type: 'line',
        // //         data: {
        // //             labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun'],
        // //             datasets: [{
        // //                 label: 'Monthly Collection (৳)',
        // //                 data: [6500, 7000, 6800, 8500, 7800, 8500],
        // //                 borderColor: '#059669',
        // //                 backgroundColor: 'rgba(5, 150, 105, 0.1)',
        // //                 tension: 0.4,
        // //                 fill: true
        // //             }]
        // //         },
        // //         options: {
        // //             responsive: true,
        // //             maintainAspectRatio: false,
        // //             plugins: {
        // //                 legend: {
        // //                     display: false
        // //                 }
        // //             },
        // //             scales: {
        // //                 y: {
        // //                     beginAtZero: true,
        // //                     ticks: {
        // //                         callback: function (value) {
        // //                             return '৳' + value.toLocaleString();
        // //                         }
        // //                     }
        // //                 }
        // //             }
        // //         }
        // //     });

        // //     // Monthly collections chart
        // //     const ctx2 = document.getElementById('monthlyChart');
        // //     if (ctx2) {
        // //         new Chart(ctx2, {
        // //             type: 'doughnut',
        // //             data: {
        // //                 labels: ['Regular Donations', 'Special Collections', 'Zakat', 'Others'],
        // //                 datasets: [{
        // //                     data: [45000, 20000, 15000, 5000],
        // //                     backgroundColor: ['#059669', '#0891b2', '#7c3aed', '#dc2626']
        // //                 }]
        // //             },
        // //             options: {
        // //                 responsive: true,
        // //                 maintainAspectRatio: false,
        // //                 plugins: {
        // //                     legend: {
        // //                         position: 'bottom'
        // //                     }
        // //                 }
        // //             }
        // //         });
        // //     }
        // // }

        // // Load sample data
        // // function loadSampleData() {
        // //     // Sample donors data
        // //     donors = [
        // //         { id: 1, name: 'Mohammed Rahman', phone: '+880-1712-345678', email: 'rahman@email.com', amount: 2000, paymentMethod: 'bank', status: 'active', lastPaid: '2024-06-15', startDate: '2024-01-01' },
        // //         { id: 2, name: 'Fatima Ahmed', phone: '+880-1723-456789', email: 'fatima@email.com', amount: 1500, paymentMethod: 'mobile', status: 'active', lastPaid: '2024-06-14', startDate: '2024-02-01' },
        // //         { id: 3, name: 'Abdul Karim', phone: '+880-1734-567890', email: 'karim@email.com', amount: 3000, paymentMethod: 'cash', status: 'inactive', lastPaid: '2024-05-20', startDate: '2024-01-15' },
        // //         { id: 4, name: 'Aisha Khan', phone: '+880-1745-678901', email: 'aisha@email.com', amount: 2500, paymentMethod: 'card', status: 'active', lastPaid: '2024-06-16', startDate: '2024-03-01' },
        // //         { id: 5, name: 'Omar Hassan', phone: '+880-1756-789012', email: 'omar@email.com', amount: 1000, paymentMethod: 'mobile', status: 'active', lastPaid: '2024-06-13', startDate: '2024-04-01' }
        // //     ];

        // //     // Sample announcements
        // //     announcements = [
        // //         { id: 1, title: 'Ramadan Schedule 2025', date: '2024-06-15', category: 'ramadan', description: 'Special prayer times and iftar arrangements for the holy month of Ramadan.' },
        // //         { id: 2, title: 'Fundraising for New Wing', date: '2024-06-10', category: 'fundraising', description: 'We are raising funds for the construction of a new wing to accommodate more worshippers.' },
        // //         { id: 3, title: 'Weekly Quran Study Circle', date: '2024-06-08', category: 'event', description: 'Join us every Friday evening for Quran study and discussion.' }
        // //     ];

        // //     // Sample messages
        // //     messages = [
        // //         { id: 1, name: 'Ahmed Ali', email: 'ahmed@email.com', subject: 'Prayer Time Inquiry', message: 'Could you please confirm the Friday prayer time?', date: '2024-06-16', status: 'unread' },
        // //         { id: 2, name: 'Sarah Ahmed', email: 'sarah@email.com', subject: 'Donation Question', message: 'I would like to know about monthly donation options.', date: '2024-06-15', status: 'read' },
        // //         { id: 3, name: 'Ibrahim Khan', email: 'ibrahim@email.com', subject: 'Event Participation', message: 'How can I participate in the upcoming community event?', date: '2024-06-14', status: 'unread' }
        // //     ];

        // //     renderDonorTable();
        // //     renderAnnouncements();
        // //     renderMessages();
        // // }

        // // Setup event listeners
        // function setupEventListeners() {
        //     // Mobile menu toggle
        //     $('#mobileMenuBtn').click(function () {
        //         $('#sidebar').removeClass('-translate-x-full');
        //         $('#mobileMenuOverlay').removeClass('hidden');
        //     });

        //     $('#mobileMenuOverlay').click(function () {
        //         $('#sidebar').addClass('-translate-x-full');
        //         $('#mobileMenuOverlay').addClass('hidden');
        //     });

        //     // Sidebar navigation
        //     $('.sidebar-link').click(function (e) {
        //         e.preventDefault();
        //         const page = $(this).data('page');

        //         if (page === 'logout') {
        //             if (confirm('Are you sure you want to logout?')) {
        //                 alert('Logged out successfully!');
        //             }
        //             return;
        //         }

        //         switchPage(page);

        //         // Update active menu
        //         $('.sidebar-link').removeClass('active-menu');
        //         $(this).addClass('active-menu');

        //         // Close mobile menu
        //         $('#sidebar').addClass('-translate-x-full');
        //         $('#mobileMenuOverlay').addClass('hidden');
        //     });

        //     // Profile dropdown
        //     $('#profileBtn').click(function (e) {
        //         e.stopPropagation();
        //         $('#profileDropdown').toggleClass('hidden');
        //     });

        //     $(document).click(function () {
        //         $('#profileDropdown').addClass('hidden');
        //     });

        //     // Modal handlers
        //     $('#addDonorBtn').click(() => openDonorModal());
        //     $('#closeDonorModal').click(() => closeDonorModal());
        //     $('#addAnnouncementBtn').click(() => openAnnouncementModal());
        //     $('#closeAnnouncementModal').click(() => closeAnnouncementModal());

        //     // Form reset buttons
        //     $('#resetDonorForm').click(() => $('#donorForm')[0].reset());
        //     $('#resetAnnouncementForm').click(() => $('#announcementForm')[0].reset());

        //     // Search and filter
        //     $('#donorSearch').on('input', function () {
        //         renderDonorTable($(this).val(), $('#donorFilter').val());
        //     });

        //     $('#donorFilter').change(function () {
        //         renderDonorTable($('#donorSearch').val(), $(this).val());
        //     });

        //     // Gallery upload
        //     $('#galleryUpload').change(function (e) {
        //         handleGalleryUpload(e.target.files);
        //     });
        // }

        // // Initialize forms with validation
        // // function initializeForms() {
        // //     // Donor form validation
        // //     $('#donorForm').validate({
        // //         rules: {
        // //             name: { required: true, minlength: 2 },
        // //             phone: { required: true, minlength: 10 },
        // //             email: { email: true },
        // //             amount: { required: true, min: 1 }
        // //         },
        // //         messages: {
        // //             name: { required: 'Please enter donor name', minlength: 'Name must be at least 2 characters' },
        // //             phone: { required: 'Please enter phone number', minlength: 'Phone number must be at least 10 digits' },
        // //             email: { email: 'Please enter a valid email address' },
        // //             amount: { required: 'Please enter donation amount', min: 'Amount must be greater than 0' }
        // //         },
        // //         submitHandler: function (form) {
        // //             saveDonor(form);
        // //         }
        // //     });

        // //     // Announcement form validation
        // //     $('#announcementForm').validate({
        // //         rules: {
        // //             title: { required: true, minlength: 3 },
        // //             date: { required: true },
        // //             description: { required: true, minlength: 10 }
        // //         },
        // //         messages: {
        // //             title: { required: 'Please enter announcement title', minlength: 'Title must be at least 3 characters' },
        // //             date: { required: 'Please select a date' },
        // //             description: { required: 'Please enter description', minlength: 'Description must be at least 10 characters' }
        // //         },
        // //         submitHandler: function (form) {
        // //             saveAnnouncement(form);
        // //         }
        // //     });

        // //     // Prayer time form
        // //     $('#prayerTimeForm').submit(function (e) {
        // //         e.preventDefault();
        // //         savePrayerTimes(this);
        // //     });

        // //     // Settings form
        // //     $('#settingsForm').submit(function (e) {
        // //         e.preventDefault();
        // //         saveSettings(this);
        // //     });
        // // }

        // // Switch pages
        // function switchPage(page) {
        //     currentPage = page;

        //     // Hide all pages
        //     $('.page-content').addClass('hidden');

        //     // Show selected page
        //     $(`#${page}Page`).removeClass('hidden');

        //     // Update page title
        //     // const titles = {
        //     //     'dashboard': 'Dashboard',
        //     //     'donors': 'Donor Management',
        //     //     'prayer-times': 'Prayer Times',
        //     //     'collections': 'Collections',
        //     //     'announcements': 'Announcements',
        //     //     'gallery': 'Gallery',
        //     //     'messages': 'Messages',
        //     //     'settings': 'Settings'
        //     // };

        //     // $('#pageTitle').text(titles[page] || 'Dashboard');
        // }

        // // Donor management functions
        // // function openDonorModal(donorId = null) {
        // //     $('#donorModal').removeClass('hidden');

        // //     if (donorId) {
        // //         const donor = donors.find(d => d.id === donorId);
        // //         if (donor) {
        // //             $('#donorModalTitle').text('Edit Donor');
        // //             $('input[name="name"]').val(donor.name);
        // //             $('input[name="phone"]').val(donor.phone);
        // //             $('input[name="email"]').val(donor.email);
        // //             $('input[name="amount"]').val(donor.amount);
        // //             $('select[name="paymentMethod"]').val(donor.paymentMethod);
        // //             $('input[name="startDate"]').val(donor.startDate);
        // //             $('#donorForm').data('editing', donorId);
        // //         }
        // //     } else {
        // //         $('#donorModalTitle').text('Add New Donor');
        // //         $('#donorForm')[0].reset();
        // //         $('#donorForm').removeData('editing');
        // //     }
        // // }

        // // function closeDonorModal() {
        // //     $('#donorModal').addClass('hidden');
        // //     $('#donorForm')[0].reset();
        // //     $('#donorForm').removeData('editing');
        // // }

        // // function saveDonor(form) {
        // //     const formData = new FormData(form);
        // //     const donorData = {
        // //         name: formData.get('name'),
        // //         phone: formData.get('phone'),
        // //         email: formData.get('email'),
        // //         amount: parseInt(formData.get('amount')),
        // //         paymentMethod: formData.get('paymentMethod'),
        // //         startDate: formData.get('startDate'),
        // //         status: 'active',
        // //         lastPaid: new Date().toISOString().split('T')[0]
        // //     };

        // //     const editingId = $(form).data('editing');

        // //     if (editingId) {
        // //         // Update existing donor
        // //         const index = donors.findIndex(d => d.id === editingId);
        // //         if (index !== -1) {
        // //             donors[index] = { ...donors[index], ...donorData };
        // //         }
        // //     } else {
        // //         // Add new donor
        // //         donorData.id = Date.now();
        // //         donors.push(donorData);
        // //     }

        // //     renderDonorTable();
        // //     closeDonorModal();

        // //     // Show success message
        // //     showNotification('Donor saved successfully!', 'success');
        // // }

        // // function deleteDonor(donorId) {
        // //     if (confirm('Are you sure you want to delete this donor?')) {
        // //         donors = donors.filter(d => d.id !== donorId);
        // //         renderDonorTable();
        // //         showNotification('Donor deleted successfully!', 'success');
        // //     }
        // // }

        // // function renderDonorTable(searchTerm = '', statusFilter = '') {
        // //     let filteredDonors = donors;

        // //     // Apply search filter
        // //     if (searchTerm) {
        // //         filteredDonors = filteredDonors.filter(donor =>
        // //             donor.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
        // //             donor.phone.includes(searchTerm) ||
        // //             donor.email.toLowerCase().includes(searchTerm.toLowerCase())
        // //         );
        // //     }

        // //     // Apply status filter
        // //     if (statusFilter) {
        // //         filteredDonors = filteredDonors.filter(donor => donor.status === statusFilter);
        // //     }

        // //     const tbody = $('#donorTableBody');
        // //     tbody.empty();

        // //     filteredDonors.forEach((donor, index) => {
        // //         const row = `
        // //             <tr class="border-b hover:bg-gray-50">
        // //                 <td class="px-4 py-3">${index + 1}</td>
        // //                 <td class="px-4 py-3 font-medium">${donor.name}</td>
        // //                 <td class="px-4 py-3">${donor.phone}</td>
        // //                 <td class="px-4 py-3">৳${donor.amount.toLocaleString()}</td>
        // //                 <td class="px-4 py-3 capitalize">${donor.paymentMethod}</td>
        // //                 <td class="px-4 py-3">
        // //                     <span class="px-2 py-1 text-xs rounded-full ${donor.status === 'active' ? 'status-active' : 'status-inactive'}">
        // //                         ${donor.status}
        // //                     </span>
        // //                 </td>
        // //                 <td class="px-4 py-3">${donor.lastPaid}</td>
        // //                 <td class="px-4 py-3">
        // //                     <button onclick="openDonorModal(${donor.id})" class="text-blue-600 hover:text-blue-800 mr-2">
        // //                         <i class="fas fa-edit"></i>
        // //                     </button>
        // //                     <button onclick="deleteDonor(${donor.id})" class="text-red-600 hover:text-red-800">
        // //                         <i class="fas fa-trash"></i>
        // //                     </button>
        // //                 </td>
        // //             </tr>
        // //         `;
        // //         tbody.append(row);
        // //     });

        // //     // Update pagination info
        // //     $('#donorTotal').text(filteredDonors.length);
        // //     $('#donorShowingStart').text(filteredDonors.length > 0 ? 1 : 0);
        // //     $('#donorShowingEnd').text(Math.min(10, filteredDonors.length));
        // // }

        // // Announcement management
        // // function openAnnouncementModal() {
        // //     $('#announcementModal').removeClass('hidden');
        // //     $('#announcementForm')[0].reset();
        // //     $('input[name="date"]').val(new Date().toISOString().split('T')[0]);
        // // }

        // // function closeAnnouncementModal() {
        // //     $('#announcementModal').addClass('hidden');
        // //     $('#announcementForm')[0].reset();
        // // }

        // // function saveAnnouncement(form) {
        // //     const formData = new FormData(form);
        // //     const announcementData = {
        // //         id: Date.now(),
        // //         title: formData.get('title'),
        // //         date: formData.get('date'),
        // //         category: formData.get('category'),
        // //         description: formData.get('description')
        // //     };

        // //     announcements.unshift(announcementData);
        // //     renderAnnouncements();
        // //     closeAnnouncementModal();

        // //     showNotification('Announcement saved successfully!', 'success');
        // // }

        // // function deleteAnnouncement(announcementId) {
        // //     if (confirm('Are you sure you want to delete this announcement?')) {
        // //         announcements = announcements.filter(a => a.id !== announcementId);
        // //         renderAnnouncements();
        // //         showNotification('Announcement deleted successfully!', 'success');
        // //     }
        // // }

        // // function renderAnnouncements() {
        // //     const container = $('#announcementsList');
        // //     container.empty();

        // //     announcements.forEach(announcement => {
        // //         const categoryColors = {
        // //             'general': 'bg-gray-100 text-gray-800 border-gray-500',
        // //             'prayer': 'bg-green-100 text-green-800 border-green-500',
        // //             'event': 'bg-blue-100 text-blue-800 border-blue-500',
        // //             'fundraising': 'bg-purple-100 text-purple-800 border-purple-500',
        // //             'ramadan': 'bg-yellow-100 text-yellow-800 border-yellow-500'
        // //         };

        // //         const categoryClass = categoryColors[announcement.category] || categoryColors['general'];

        // //         const card = `
        // //             <div class="announcement-card p-4 rounded-lg border-l-4 ${categoryClass}">
        // //                 <div class="flex justify-between items-start">
        // //                     <div>
        // //                         <h4 class="font-semibold text-lg">${announcement.title}</h4>
        // //                         <p class="text-gray-600 mt-2">${announcement.description}</p>
        // //                     </div>
        // //                     <div class="flex space-x-2">
        // //                         <button onclick="deleteAnnouncement(${announcement.id})" 
        // //                                 class="text-red-600 hover:text-red-800 p-2 rounded-full hover:bg-red-100">
        // //                             <i class="fas fa-trash"></i>
        // //                         </button>
        // //                     </div>
        // //                 </div>
        // //                 <div class="flex justify-between items-center mt-4">
        // //                     <span class="text-xs px-2 py-1 rounded-full bg-white border border-gray-300 capitalize">
        // //                         ${announcement.category}
        // //                     </span>
        // //                     <span class="text-xs text-gray-500">
        // //                         <i class="far fa-calendar mr-1"></i>${announcement.date}
        // //                     </span>
        // //                 </div>
        // //             </div>
        // //         `;
        // //         container.append(card);
        // //     });
        // // }

        // // Messages management
        // // function renderMessages() {
        // //     const tbody = $('#messagesTableBody');
        // //     tbody.empty();

        // //     messages.forEach((message, index) => {
        // //         const row = `
        // //             <tr class="border-b hover:bg-gray-50">
        // //                 <td class="px-4 py-3 font-medium">${message.name}</td>
        // //                 <td class="px-4 py-3">${message.email}</td>
        // //                 <td class="px-4 py-3">${message.subject}</td>
        // //                 <td class="px-4 py-3">${message.date}</td>
        // //                 <td class="px-4 py-3">
        // //                     <span class="px-2 py-1 text-xs rounded-full ${message.status === 'unread' ? 'bg-blue-100 text-blue-800' : 'bg-gray-100 text-gray-800'}">
        // //                         ${message.status}
        // //                     </span>
        // //                 </td>
        // //                 <td class="px-4 py-3">
        // //                     <button onclick="viewMessage(${message.id})" class="text-green-600 hover:text-green-800 mr-2">
        // //                         <i class="fas fa-eye"></i>
        // //                     </button>
        // //                     <button onclick="deleteMessage(${message.id})" class="text-red-600 hover:text-red-800">
        // //                         <i class="fas fa-trash"></i>
        // //                     </button>
        // //                 </td>
        // //             </tr>
        // //         `;
        // //         tbody.append(row);
        // //     });
        // // }

        // // function viewMessage(messageId) {
        // //     const message = messages.find(m => m.id === messageId);
        // //     if (message) {
        // //         // Update status to read
        // //         message.status = 'read';
        // //         renderMessages();

        // //         // Show message content in modal
        // //         alert(`Message from: ${message.name}\nEmail: ${message.email}\nSubject: ${message.subject}\n\n${message.message}`);
        // //     }
        // // }

        // // function deleteMessage(messageId) {
        // //     if (confirm('Are you sure you want to delete this message?')) {
        // //         messages = messages.filter(m => m.id !== messageId);
        // //         renderMessages();
        // //         showNotification('Message deleted successfully!', 'success');
        // //     }
        // // }

        // // Gallery management
        // // function handleGalleryUpload(files) {
        // //     if (files.length === 0) return;

        // //     for (let i = 0; i < files.length; i++) {
        // //         const file = files[i];
        // //         const reader = new FileReader();

        // //         reader.onload = function (e) {
        // //             galleryImages.push({
        // //                 id: Date.now() + i,
        // //                 name: file.name,
        // //                 url: e.target.result,
        // //                 date: new Date().toISOString().split('T')[0]
        // //             });

        // //             renderGallery();
        // //         };

        // //         reader.readAsDataURL(file);
        // //     }

        // //     showNotification('Images uploaded successfully!', 'success');
        // // }

        // // function renderGallery() {
        // //     const container = $('#galleryGrid');
        // //     container.empty();

        // //     galleryImages.forEach(image => {
        // //         const item = `
        // //             <div class="gallery-item relative">
        // //                 <div class="aspect-w-1 aspect-h-1 bg-gray-200 rounded-lg overflow-hidden">
        // //                     <img src="${image.url}" alt="${image.name}" class="object-cover w-full h-full">
        // //                 </div>
        // //                 <div class="gallery-delete cursor-pointer" onclick="deleteGalleryImage(${image.id})">
        // //                     <i class="fas fa-trash text-white"></i>
        // //                 </div>
        // //                 <div class="p-2">
        // //                     <p class="text-sm font-medium truncate">${image.name}</p>
        // //                     <p class="text-xs text-gray-500">${image.date}</p>
        // //                 </div>
        // //             </div>
        // //         `;
        // //         container.append(item);
        // //     });
        // // }

        // // function deleteGalleryImage(imageId) {
        // //     if (confirm('Are you sure you want to delete this image?')) {
        // //         galleryImages = galleryImages.filter(img => img.id !== imageId);
        // //         renderGallery();
        // //         showNotification('Image deleted successfully!', 'success');
        // //     }
        // // }

        // // Form submission handlers
        // // function savePrayerTimes(form) {
        // //     const formData = new FormData(form);
        // //     const prayerTimes = {
        // //         fajr: formData.get('fajr'),
        // //         dhuhr: formData.get('dhuhr'),
        // //         asr: formData.get('asr'),
        // //         maghrib: formData.get('maghrib'),
        // //         isha: formData.get('isha'),
        // //         jummah: formData.get('jummah')
        // //     };

        // //     // In a real app, you would save to database here
        // //     localStorage.setItem('prayerTimes', JSON.stringify(prayerTimes));
        // //     showNotification('Prayer times saved successfully!', 'success');
        // // }

        // // function saveSettings(form) {
        // //     const formData = new FormData(form);
        // //     const settings = {
        // //         mosqueName: formData.get('mosqueName'),
        // //         contactPhone: formData.get('contactPhone'),
        // //         email: formData.get('email'),
        // //         address: formData.get('address'),
        // //         footerMessage: formData.get('footerMessage'),
        // //         language: formData.get('language')
        // //     };

        // //     // In a real app, you would save to database here
        // //     localStorage.setItem('mosqueSettings', JSON.stringify(settings));
        // //     showNotification('Settings saved successfully!', 'success');
        // // }

        // // Utility function to show notifications
        // function showNotification(message, type = 'success') {
        //     alert(`${type.toUpperCase()}: ${message}`);
        
