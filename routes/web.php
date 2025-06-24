<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\WelcomeController;
use App\Http\Controllers\Admin\UserController;
use App\Http\Controllers\Admin\DonorController;
use App\Http\Controllers\Admin\ContactController;
use App\Http\Controllers\Admin\GalleryController;
use App\Http\Controllers\Admin\MessageController;
use App\Http\Controllers\Admin\SettingController;
use App\Http\Controllers\Admin\DashboardController;
use App\Http\Controllers\Admin\CollectionController;
use App\Http\Controllers\Admin\HomeBannerController;
use App\Http\Controllers\Admin\LeadershipController;
use App\Http\Controllers\Admin\PrayerTimeController;
use App\Http\Controllers\Admin\AboutMosqueController;
use App\Http\Controllers\Admin\AnnouncementController;
use App\Http\Controllers\Admin\MosqueSettingController;
use App\Http\Controllers\Admin\MonthlyCollectionController;
use App\Http\Controllers\Auth\AuthenticatedSessionController;

Route::get('/', [WelcomeController::class, 'index'])->name('welcome');
Route::post('/contact', [ContactController::class, 'store'])->name('contact.store');



Route::get('/test-db', function () {
    try {
        DB::connection()->getPdo();
        return "Connected successfully to: " . DB::connection()->getDatabaseName();
    } catch (\Exception $e) {
        return "Connection failed: " . $e->getMessage();
    }
});


Route::middleware(['auth'])->prefix('admin')->group(function () {

    // Log-Out
    Route::get('/logout', [UserController::class, 'logout'])->name('admin.logout');
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('admin.dashboard');

    // Home All Route
    Route::get('/home', [HomeBannerController::class, 'edit'])->name('admin.home');
    Route::put('/home-banner', [HomeBannerController::class, 'update'])->name('admin.home-banner.update');

    // Donor All Route
    Route::get('/donors', [DonorController::class, 'index'])->name('admin.donors.index');
    Route::get('/donors/create', [DonorController::class, 'create'])->name('admin.donors.create');
    Route::post('/donors', [DonorController::class, 'store'])->name('admin.donors.store');
    Route::get('/donors/{donor}}/edit', [DonorController::class, 'edit'])->name('admin.donors.edit');
    Route::put('/donors/{donor}', [DonorController::class, 'update'])->name('admin.donors.update');
    Route::delete('/donors/{donor}', [DonorController::class, 'destroy'])->name('admin.donors.destroy');

    // Announcements All Route
    Route::get('/announcements', [AnnouncementController::class, 'index'])->name('admin.announcements.index');
    Route::get('/announcements/create', [AnnouncementController::class, 'create'])->name('admin.announcements.create');
    Route::post('/announcements', [AnnouncementController::class, 'store'])->name('admin.announcements.store');
    Route::get('/announcements/{announcement}}/edit', [AnnouncementController::class, 'edit'])->name('admin.announcements.edit');
    Route::put('/announcements/{announcement}', [AnnouncementController::class, 'update'])->name('admin.announcements.update');
    Route::delete('/announcements/{announcement}', [AnnouncementController::class, 'destroy'])->name('admin.announcements.destroy');

    // PrayerTime Route List
    Route::get('/prayer-times', [PrayerTimeController::class, 'edit'])
        ->name('admin.prayer-times.edit');
    Route::put('/prayer-times', [PrayerTimeController::class, 'update'])
        ->name('admin.prayer-times.update');

    // Leadership Route List
    Route::get('/leadership', [LeadershipController::class, 'index'])->name('admin.leadership');
    Route::get('/leadership/create', [LeadershipController::class, 'create'])->name('admin.leadership.create');
    Route::post('/leadership', [LeadershipController::class, 'store'])->name('admin.leadership.store');
    Route::get('/leadership/{leader}/edit', [LeadershipController::class, 'edit'])->name('admin.leadership.edit');
    Route::put('/leadership/{leader}', [LeadershipController::class, 'update'])->name('admin.leadership.update');
    Route::delete('/leadership/{leader}', [LeadershipController::class, 'destroy'])->name('admin.leadership.destroy');
    Route::post('/leadership/reorder', [LeadershipController::class, 'reorder'])->name('admin.leadership.reorder');


    // Gallery Routes
    Route::get('/gallery', [GalleryController::class, 'index'])->name('admin.gallery.index');
    Route::get('/gallery/create', [GalleryController::class, 'create'])->name('admin.gallery.create');
    Route::post('/gallery', [GalleryController::class, 'store'])->name('admin.gallery.store');
    Route::get('/gallery/{galleryItem}/edit', [GalleryController::class, 'edit'])->name('admin.gallery.edit');
    Route::put('/gallery/{galleryItem}', [GalleryController::class, 'update'])->name('admin.gallery.update');
    Route::delete('/gallery/{galleryItem}', [GalleryController::class, 'destroy'])->name('admin.gallery.destroy');

    // Mosque Settings Routes
    Route::get('/settings', [MosqueSettingController::class, 'index'])->name('admin.settings.mosque');
    Route::post('/settings', [MosqueSettingController::class, 'update'])->name('admin.settings.mosque.update');

    // Monthly Collections Routes
    Route::prefix('monthly-collections')->group(function () {
        Route::get('/', [MonthlyCollectionController::class, 'index'])->name('admin.monthly-collections.index');
        Route::get('/create', [MonthlyCollectionController::class, 'create'])->name('admin.monthly-collections.create');
        Route::post('/', [MonthlyCollectionController::class, 'store'])->name('admin.monthly-collections.store');
        Route::get('/{monthlyCollection}/edit', [MonthlyCollectionController::class, 'edit'])->name('admin.monthly-collections.edit');
        Route::put('/{monthlyCollection}', [MonthlyCollectionController::class, 'update'])->name('admin.monthly-collections.update');
        Route::delete('/{monthlyCollection}', [MonthlyCollectionController::class, 'destroy'])->name('admin.monthly-collections.destroy');
    });

    // Contact  Routes
    Route::get('/contact', [ContactController::class, 'index'])->name('admin.contact.index');
    Route::get('/contact/{contact}/view', [ContactController::class, 'view'])->name('admin.contact.view');


    //About Sction Route
 Route::get('/about', [AboutMosqueController::class, 'edit'])->name('admin.about');
    Route::put('/about', [AboutMosqueController::class, 'update'])->name('admin.about.update');
    
    // profile All Route
    Route::view('/profile', 'admin.pages.profile.index')->name('admin.profile.index');


});


require __DIR__ . '/auth.php';



