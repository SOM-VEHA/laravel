<?php

namespace App\Http\Controllers\mobile_api;
use App\Models\movieModel;
use App\Http\Controllers\Controller;
use App\Models\Movie;
use Illuminate\Http\Request;

class MovieController extends Controller
{
    public function index(Request $request)
    {
        $perPage = $request->integer('per_page', 10);

        $movies = Movie::query()
            ->with('category')
            ->when(
                $request->filled('category_id'),
                function ($query) use ($request) {
                    $query->where('category_id', $request->category_id);
                }
            )
            ->latest()
            ->paginate($perPage);

        return response()->json([
            'success' => true,

            'data' => $movies->items(),

            'pagination' => [
                'current_page' => $movies->currentPage(),
                'last_page' => $movies->lastPage(),
                'per_page' => $movies->perPage(),
                'total' => $movies->total(),
                'has_more' => $movies->hasMorePages(),
            ],
        ]);
    }
    public function search(Request $request){

    }
//    public function index(){
//        $movies=Movie::with('category')->paginate(20);
//        return response()->json([
//            'data' => $movies->items(),
//            'pagination' => [
//                'current_page' => $movies->currentPage(),
//                'per_page' => $movies->perPage(),
//                'total' => $movies->total(),
//                'last_page' => $movies->lastPage(),
//                'has_more' => $movies->hasMorePages(),
//            ],
//        ]);
//    }
    public function show($id){
        $movie = Movie::with('category')->findOrFail($id);
        return response()->json([
            'data' => $movie,
        ]);
    }
    public function related($id)
    {
        $movie = Movie::with('category')->findOrFail($id);
        $relatedMovies = Movie::where('category_id', $movie->category_id)
            ->where('id', '!=', $movie->id)
            ->latest()
            ->paginate(10);

//        $relatedMovies = Movie::where('category_id', $movie->category_id)
//            ->where('id', '!=', $movie->id) // ❗ exclude current movie
//            ->latest()
//            ->take(10)
//            ->get();

        return response()->json([
            'data' => $relatedMovies->items(),
            'pagination' => [
                'current_page' => $relatedMovies->currentPage(),
                'per_page' => $relatedMovies->perPage(),
                'total' => $relatedMovies->total(),
                'last_page' => $relatedMovies->lastPage(),
                'has_more' => $relatedMovies->hasMorePages(),
            ],
        ]);
    }

    public  function  isPopularMovie()
    {
        $movies=Movie::where('is_popular',1)->with('category')->paginate(20);
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

    public  function  action()
    {
        $movies=Movie::where('category_id',1)->with('category')->paginate(20);
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
    public  function  ghost()
    {
        $movies=Movie::where('category_id',2)->with('category')->paginate(20);
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
