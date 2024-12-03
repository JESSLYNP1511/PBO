<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\BookingController;
use App\Http\Controllers\NailArtistController;
use Illuminate\Support\Facades\Route;


// Authentication Routes
Route::post('register', [AuthController::class, 'register']); // Register a new user
Route::post('login', [AuthController::class, 'login']); // Login a user

// Service Routes
Route::get('services', [BookingController::class, 'listServices']); // List all services

// Booking Routes
Route::post('book-service', [BookingController::class, 'bookService']); // Book a service
Route::get('user/bookings/{user_id}', [BookingController::class, 'getUserBookings']); // Get all bookings for a user

// Artist Routes
Route::get('artists', [NailArtistController::class, 'index']); // List all nail artists