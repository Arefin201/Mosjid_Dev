<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('monthly_collections', function (Blueprint $table) {
            $table->id();
            $table->date('collection_date');
            $table->decimal('total_amount', 10, 2);
            $table->enum('category', [
                'monthly_chanda',
                'zakat',
                'fitrah',
                'mosque_fund',
                'other'
            ])->default('monthly_chanda');
            $table->text('notes')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('monthly_collections');
    }
};
