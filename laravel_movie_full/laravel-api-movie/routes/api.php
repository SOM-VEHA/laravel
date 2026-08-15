<?php
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\mobile_api\SlideController;
use App\Http\Controllers\mobile_api\MovieController;
use App\Http\Controllers\mobile_api\CategoriesController;
use App\Http\Controllers\mobile_api\AuthController;
use App\Http\Controllers\mobile_api\FavoriteController;
//auth
Route::post('login', [AuthController::class, 'login']);
Route::post('register', [AuthController::class, 'register']);
// Public
Route::get('slides', [SlideController::class, 'index']);
Route::get('movies', [MovieController::class, 'index']);
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
    Route::middleware('admin')->prefix('admin')->group(function () {
        // Movies
        Route::apiResource('movies', AdminMovieController::class);
        // Categories
        Route::apiResource('categories', AdminCategoryController::class);
        // Slides
        Route::apiResource('slides', AdminSlideController::class);
    });
});
