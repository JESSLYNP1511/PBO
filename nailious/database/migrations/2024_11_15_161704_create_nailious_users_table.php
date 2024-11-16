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
        Schema::create('nailious_users', function (Blueprint $table) {
            $table->id(); // Primary key
            $table->string('name'); // Nama pengguna
            $table->string('email')->unique(); // Email pengguna (unik)
            $table->string('cust_id')->nullable(); // Customer ID (opsional)
            $table->json('history')->nullable(); // Riwayat booking dalam format JSON
            $table->string('phone_number')->nullable(); // Nomor telepon pengguna
            $table->date('customer_since')->nullable(); // Tanggal pertama kali menjadi pelanggan
            $table->timestamps(); // Kolom created_at dan updated_at
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('nailious_users');
    }
};
