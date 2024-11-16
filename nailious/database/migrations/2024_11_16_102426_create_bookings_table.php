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
        Schema::create('bookings', function (Blueprint $table) {
            $table->id(); // Primary key
            $table->string('booking_id')->unique(); // ID unik untuk pemesanan
            $table->unsignedBigInteger('cust_id'); // ID pelanggan
            $table->unsignedBigInteger('nail_artist_id'); // ID nail artist
            $table->unsignedBigInteger('service_id'); // ID layanan yang dipesan
            $table->date('booking_date'); // Tanggal pemesanan
            $table->time('booking_time'); // Waktu pemesanan
            $table->decimal('total_price', 10, 2); // Total biaya pemesanan
            $table->timestamps(); // Kolom created_at dan updated_at

        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
