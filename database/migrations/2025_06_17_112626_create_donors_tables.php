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
        Schema::create('donors_tables', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('phone');
            $table->string('email')->nullable();
            $table->decimal('amount', 10, 2);
            $table->string('person_image')->nullable();
            $table->enum('payment_method', ['cash', 'bank', 'mobile', 'card']);
            $table->enum('status', ['active', 'inactive'])->default('active');
            $table->date('last_paid')->nullable();
            $table->date('start_date')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('donors_tables');
    }
};
