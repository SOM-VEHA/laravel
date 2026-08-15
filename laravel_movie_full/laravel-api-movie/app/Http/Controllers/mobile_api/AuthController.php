<?php

namespace App\Http\Controllers\mobile_api;
use App\Models\User;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
class AuthController extends Controller
{
    public function login(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'password' => 'required'
        ]);

        if (auth()->attempt($credentials)) {
            $user = auth()->user();
            $token = auth()->user()->createToken('auth_token')->plainTextToken;
            return response()->json([
                'success' => true,
                'token' => $token,
                'token_type' => 'Bearer',
                'data' => $user
            ]);
        }

        return response()->json(
            [
                'success' => false,
                'message' => 'Invalid credentials'
            ], 401);
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'name' => 'required|string|max:255',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|string|min:6|confirmed',
        ]);

        $user = User::create([
            'name' => $data['name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
        ]);

        return response()->json([
            'success' => true,
            'message' => 'User registered successfully',
            'data' => $user,
        ]);
    }

    public function logout()
    {
        auth()->user()->tokens()->delete();
        return response()->json(['success' => true, 'message' => 'Logged out successfully']);

//        $request->user()->currentAccessToken()->delete();
//
//        return response()->json([
//            'success' => true,
//            'message' => 'Logout successful',
//        ]);
    }
}
