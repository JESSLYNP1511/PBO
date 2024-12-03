<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\UserResource;
use App\Models\NailiciousUser;

class AuthController extends Controller
{
    /**
     * Register a new user.
     */
    public function register(Request $request)
    {
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => 'required|string|min:6',
            'phone' => 'required|string',
        ]);

        // Create the user
        $user = NailiciousUser::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password), // Hash the password
            'phone' => $request->phone,
        ]);

        // Return the user data (no token)
        return response()->json([
            'user' => new UserResource($user),
            'message' => 'User registered successfully',
        ]);
    }

    /**
     * Log in an existing user.
     */
    public function login(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|string',
        ]);

        // Check if the user's credentials are correct
        $user = NailiciousUser::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        // Return the user ID and login status (logged in)
        return response()->json([
            'user_id' => $user->id,
            'name' => $user->name,
            'email' => $user->email,
            'phone' => $user->phone,
            'status' => 'logged_in',
        ]);
    }
}
