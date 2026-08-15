<?php

namespace App\Http\Controllers\mobile_api;
use App\Models\movieModel;
use App\Http\Controllers\Controller;
use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index(){
        $movies=Movie::with('category')->paginate(20);
        return response()->json([
            'data' => $movies->items(),
            'pagination' => [
                'current_page' => $movies->currentPage(),
                'per_page' => $movies->perPage(),
                'total' => $movies->total(),
                'last_page' => $movies->lastPage(),
                'has_more' => $movies->hasMorePages(),
            ],
        ]);
    }
}
