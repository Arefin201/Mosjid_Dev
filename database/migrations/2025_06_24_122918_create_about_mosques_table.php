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
        Schema::create('about_mosques', function (Blueprint $table) {
            $table->id();
            $table->string('mosque_name')->nullable();
            $table->text('history_paragraph1')->nullable();
            $table->text('history_paragraph2')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('about_mosques');
    }
};
