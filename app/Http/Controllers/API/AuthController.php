<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;

use Illuminate\Http\{Request, Response};

class AuthController extends Controller
{
    /**
     * Authenticate a user and generate an authentication token.
     */
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => ['required', 'email'],
            'password' => ['required'],
        ]);

        if (Auth::attempt($credentials)) {
            $token = $request->user()->createToken('mobile-token');

            return ['token' => $token->plainTextToken];
        }

        return response()->json([
            'error' => 'The provided credentials do not match our records.',
        ], Response::HTTP_UNAUTHORIZED);
    }
}
