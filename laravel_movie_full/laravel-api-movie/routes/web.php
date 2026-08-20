<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\AdminSlideController;
use App\Http\Controllers\admin\UserController;
use App\Http\Controllers\admin\CategoriesController;
use App\Http\Controllers\admin\MovieController;
use App\Http\Controllers\admin\AuthController;
Route::get('/', function () {
    return view('index');
})->name('index');
Route::get('movieKhmer/1220/admin/login', [AuthController::class, 'loginView'])->name('admin.login');
Route::post('movieKhmer/1220/admin/login', [AuthController::class, 'login'])->name('admin.login.submit');
Route::resource('movieKhmer/1220/admin/slides', AdminSlideController::class);
Route::resource('movieKhmer/1220/admin/users', UserController::class);
Route::resource('movieKhmer/1220/admin/movies', MovieController::class);
Route::resource('movieKhmer/1220/admin/categories', CategoriesController::class);
