<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNailArtistsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('artists', function (Blueprint $table) {
            $table->id(); // Primary Key
            $table->string('name'); // Artist name
            $table->string('email')->unique(); // Email address
            $table->string('specialty')->nullable(); // Specialty (e.g., Nail Art, Manicure)
            $table->text('bio')->nullable(); // Bio or description
            $table->string('photo')->nullable(); // Profile picture
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
        Schema::dropIfExists('artists');
    }
}
