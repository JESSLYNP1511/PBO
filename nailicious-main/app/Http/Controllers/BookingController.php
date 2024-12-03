<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Log;
use App\Models\Booking;
use App\Models\NailArtist;
use App\Models\Service;
use Illuminate\Http\Request;

class BookingController extends Controller
{
    /**
     * Book a service for a user.
     */
    public function bookService(Request $request)
    {
        // // Validate the request data
        // $request->validate([
        //     'service_id' => 'required|exists:services,id', // Ensure the service exists
        //     'user_id' => 'required|exists:users,id', // Ensure the user exists
        //     'artist_id' => 'required|exists:artists,id', // Ensure the artist exists
        //     'note' => 'nullable|string', // Optional note field
        //     'booking_time' => 'required|date', // Ensure booking time is a valid date
        // ]);

        // Get the selected service
        $service = Service::find($request->service_id);
        $artis = NailArtist::find($request->artist_id);

        // Create a new booking
        $booking = Booking::create([
            'user_id' => $request->user_id,
            'artist_id' => $request->artist_id,
            'service_id' => $service->id,
            'note' => $request->note,
            'booking_time' => $request->booking_time,
            'status' => 'pending', 
            'artist_name' => $artis->name,
            'service_name' => $service->name,
            'price' => $service->price,
        ]);

        // Return a response with booking details
        return response()->json([
            'message' => 'Service booked successfully',
            'booking' => $booking,
        ]);
    }

    /**
     * View all available services.
     */
    public function listServices()
    {
        // Get all services
        $services = Service::all();

        // Return response with services list
        return response()->json($services);
    }

    /**
     * View the user's bookings.
     */
    public function getUserBookings(Request $request)
    {
        // Get the user's bookings
        $bookings = Booking::where('user_id', $request->user_id)->get();

        // Return response with user's bookings
        return response()->json($bookings);
    }
}
