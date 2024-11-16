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
        Schema::create('nail_artists', function (Blueprint $table) {
            $table->id(); // Primary key
            $table->string('name'); // Nama nail artist
            $table->string('nail_artist_id')->unique(); // ID unik nail artist
            $table->decimal('rate_price', 10, 2); // Rata-rata biaya layanan (format desimal)
            $table->string('specialization')->nullable(); // Spesialisasi nail artist
            $table->boolean('availability')->default(1); // Status ketersediaan (1 = tersedia, 0 = tidak tersedia)
            $table->integer('total_customer')->default(0); // Jumlah pelanggan yang dilayani
            $table->json('schedule')->nullable(); // Jadwal kerja dalam format JSON
            $table->decimal('rating', 3, 2)->nullable(); // Rating rata-rata pelanggan (skala 1-5, dua desimal)
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nail_artists');
    }
};
