<?php

namespace App\Http\Controllers\mobile_api;
use App\Http\Controllers\Controller;
use App\Models\Favorite;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class FavoriteController extends Controller
{
    public function index()
    {
        $favorites = auth()->user()
            ->favorites()
            ->with('movie')
            ->latest()
            ->paginate(20);
        return response()->json([
            'success' => true,
            'data' => $favorites->items(),
            'pagination' => [
                'current_page' => $favorites->currentPage(),
                'per_page' => $favorites->perPage(),
                'total' => $favorites->total(),
                'last_page' => $favorites->lastPage(),
                'has_more' => $favorites->hasMorePages(),
            ],
        ]);
    }
    public function store(Request $request)
    {
        $data = $request->validate([
            'movie_id' => 'required|exists:movies,id',
        ]);

        $favorite = auth()->user()->favorites()->firstOrCreate([
            'movie_id' => $data['movie_id'],
        ]);

        return response()->json([
            'success' => true,
            'message' => 'Movie added to favorites',
            'data' => $favorite,
        ], 201);
    }
    public function destroy($id)
    {
        $favorite = auth()->user()->favorites()->where('movie_id', $id)->firstOrFail();
        $favorite->delete();
        return response()->json(['success' => true, 'message' => 'Favorite removed']);
    }
}
