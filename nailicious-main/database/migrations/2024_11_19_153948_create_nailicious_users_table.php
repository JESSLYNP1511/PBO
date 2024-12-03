<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateNailiciousUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('nailicious_users', function (Blueprint $table) {
            $table->id(); // Primary Key
            $table->string('name'); // User's full name
            $table->string('email')->unique(); // Unique email for login
            $table->string('password'); // Password for authentication
            $table->string('phone')->nullable(); // Optional phone number
            $table->timestamp('email_verified_at')->nullable(); // Email verification timestamp
            $table->rememberToken(); // Token for "remember me" functionality
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
        Schema::dropIfExists('users');
    }
}
