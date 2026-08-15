<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Favorite;
use App\Models\User;
use App\Models\Product;
use Illuminate\Support\Facades\Auth;
class FavoriteController extends Controller
{
    // Add to favorites
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
        ]);
        $favorite = Favorite::firstOrCreate([
            'user_id' => Auth::id(),
            'product_id' => $request->product_id,
        ]);
        return response()->json([
            'code' => 200,
            'status' => true,
            'message' => 'Added to favorites',
            'favorites' => $favorite
        ]);
    }

    // Get user favorites
    public function index()
    {
        $favorites = Favorite::with('product')->where('user_id', Auth::id())->get();
        return response()->json([
            'code' =>200,
            'status'=> true,
            'message' => 'Favorites retrieved successfully',
            'favorites' => $favorites
        ]);
    }

    // Remove from favorites
    public function destroy($id)
    {
        $favorite = Favorite::where('id', $id)->where('user_id', Auth::id())->firstOrFail();
        $favorite->delete();
        return response()->json([
            'code' => 200,
            'message' => 'Removed from favorites',
            'status' => true,
            'message' => 'Removed from favorites'
        ]);
    }
}
