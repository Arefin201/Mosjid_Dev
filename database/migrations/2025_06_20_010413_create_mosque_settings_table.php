<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('mosque_settings', function (Blueprint $table) {
             $table->id();
            $table->string('mosque_name');
            $table->string('contact_phone');
            $table->string('email')->nullable();
            $table->text('address');
            $table->text('footer_message');
            $table->string('language', 10)->default('en');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('mosque_settings');
    }
};
