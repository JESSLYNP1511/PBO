<?php

namespace App\Http\Controllers;

use App\Models\NailArtist; // Assuming you have an Artist model

class NailArtistController extends Controller
{
    /**
     * Get the list of all nail artists.
     */
    public function index()
    {
        // Get all artists
        $artists = NailArtist::all();

        // Return the list of artists as a JSON response
        return response()->json($artists);
    }
}
