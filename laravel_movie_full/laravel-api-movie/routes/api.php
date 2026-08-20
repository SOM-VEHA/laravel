<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\mobile_api\SlideController;
use App\Http\Controllers\mobile_api\MovieController;
use App\Http\Controllers\mobile_api\CategoriesController;
use App\Http\Controllers\mobile_api\AuthController;
use App\Http\Controllers\mobile_api\FavoriteController;
use App\Http\Controllers\admin\AdminMovieController;
use App\Http\Controllers\admin\AdminCategoryController;
use App\Http\Controllers\admin\AdminSlideController;
//auth
Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
// Public
Route::get('slides', [SlideController::class, 'index']);
Route::get('movies', [MovieController::class, 'index']);
Route::get('movies/search', [MovieController::class, 'search']);
Route::get('movies/popula', [MovieController::class, 'isPopularMovie']);
Route::get('movies/action', [MovieController::class, 'action']);
Route::get('movies/ghost', [MovieController::class, 'ghost']);
Route::get('movies/{id}', [MovieController::class, 'show']);
Route::get('movies/{id}/related', [MovieController::class, 'related']);
Route::get('categories', [CategoriesController::class, 'index']);
// Authenticated
Route::middleware('auth:sanctum')->group(function () {
    Route::post('logout', [AuthController::class, 'logout']);
    //favorite
    Route::get('favorites', [FavoriteController::class, 'index']);
    Route::post('favorites', [FavoriteController::class, 'store']);
    Route::delete('favorites/{id}', [FavoriteController::class, 'destroy']);
    // =========================
    // ADMIN
    // =========================
//    Route::middleware('admin')->prefix('admin')->group(function () {
//        // Movies
//        Route::get('movies', [AdminMovieController::class, 'index'])->middleware('permission:movie.view');
//        // Categories
//        Route::apiResource('categories', AdminCategoryController::class);
//        // Slides
//        Route::apiResource('slides', AdminSlideController::class);
//    });


    // Admin
    Route::prefix('admin')->group(function () {

        // Movies
        Route::get('movies', [AdminMovieController::class, 'index'])->middleware('permission:read');
        Route::post('movies', [AdminMovieController::class, 'store'])->middleware('permission:create');
        Route::get('movies/{movie}', [AdminMovieController::class, 'show'])->middleware('permission:read');
        Route::put('movies/{movie}', [AdminMovieController::class, 'update'])->middleware('permission:update');
        Route::delete('movies/{movie}', [AdminMovieController::class, 'destroy'])->middleware('permission:delete');


        // Categories
        Route::get('categories', [AdminCategoryController::class, 'index'])->middleware('permission:categories.view');
        Route::post('categories', [AdminCategoryController::class, 'store'])->middleware('permission:categories.create');
        Route::get('categories/{category}', [AdminCategoryController::class, 'show'])->middleware('permission:categories.view');
        Route::put('categories/{category}', [AdminCategoryController::class, 'update'])->middleware('permission:categories.update');
        Route::delete('categories/{category}', [AdminCategoryController::class, 'destroy'])->middleware('permission:categories.delete');


        // Slides
        Route::get('slides', [AdminSlideController::class, 'index'])->middleware('permission:slides.view');
        Route::post('slides', [AdminSlideController::class, 'store'])->middleware('permission:slides.create');
        Route::get('slides/{slide}', [AdminSlideController::class, 'show'])->middleware('permission:slides.view');
        Route::put('slides/{slide}', [AdminSlideController::class, 'update'])->middleware('permission:slides.update');
        Route::delete('slides/{slide}', [AdminSlideController::class, 'destroy'])->middleware('permission:slides.delete');
    });
});
