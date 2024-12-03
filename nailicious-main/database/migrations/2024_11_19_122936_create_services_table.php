<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateServicesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('services', function (Blueprint $table) {
            $table->id(); // Primary Key
            $table->string('name'); // Service name (e.g., "Manicure", "Nail Art")
            $table->text('description')->nullable(); // Description of the service
            $table->decimal('price', 8, 2); // Price of the service
            $table->timestamps(); // Created_at and Updated_at
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('services');
    }
}
