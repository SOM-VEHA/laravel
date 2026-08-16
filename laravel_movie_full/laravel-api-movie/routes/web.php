<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\admin\AdminSlideController;
use App\Http\Controllers\admin\UserController;
Route::get('/', function () {
    return view('index');
})->name('index');
Route::get('movieKhmer/1220/admin/login', function () {
    return view('auth.pages-sign-in');
});
Route::resource('movieKhmer/1220/admin/slides', AdminSlideController::class);
Route::resource('movieKhmer/1220/admin/users', UserController::class);
