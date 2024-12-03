<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateBookingsTable extends Migration
{
    public function up()
    {
        Schema::create('bookings', function (Blueprint $table) {
            $table->id(); // Auto-incrementing primary key
            $table->foreignId('user_id')->references("id")->on("nailicious_users")->constrained()->onDelete('cascade'); // Foreign key for user
            $table->foreignId('artist_id')->constrained()->onDelete('cascade'); // Foreign key for artist
            $table->foreignId('service_id')->constrained()->onDelete('cascade'); // Foreign key for service
            $table->text('note')->nullable(); // Optional note field for user instructions
            $table->timestamp('booking_time'); // Timestamp for the booking time
            $table->enum('status', ['pending', 'confirmed', 'completed', 'cancelled'])->default('pending'); // Status field
            $table->text("artist_name");
            $table->text("service_name");
            $table->integer("price");
            $table->timestamps(); // Timestamps for created_at and updated_at
        });
    }

    public function down()
    {
        Schema::dropIfExists('bookings');
    }
}
