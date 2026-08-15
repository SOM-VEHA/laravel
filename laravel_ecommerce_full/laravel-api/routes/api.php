<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\AuthController;
use App\Http\Controllers\Api\CategoryController;
use App\Http\Controllers\Api\ProductController;
use App\Http\Controllers\Api\FavoriteController;
use App\Http\Controllers\Api\CartController;
use App\Http\Controllers\Api\OrderController;
use App\Http\Controllers\Api\BannerController;
//auth
Route::post('/register', [AuthController::class, 'register']);
Route::post('/login', [AuthController::class, 'login']);
//category
Route::get('/categories', [CategoryController::class, 'index']);
Route::get('/categories/{category}', [CategoryController::class, 'show']);
//product
Route::get('/products', [ProductController::class, 'index']);
Route::get('/products/{product}', [ProductController::class, 'show']);
//banner
Route::get('/banners', [BannerController::class, 'index']);
Route::middleware('auth:sanctum')->group(function () {
    //favorite
    Route::get('/favorites', [FavoriteController::class, 'index']);
    Route::post('/favorites', [FavoriteController::class, 'store']);
    Route::delete('/favorites/{id}', [FavoriteController::class, 'destroy']);
    // Cart
    Route::get('/carts', [CartController::class, 'index']);
    Route::post('/carts', [CartController::class, 'store']);
    Route::delete('/cart/{id}', [CartController::class, 'destroy']);
    //order
    Route::get('/orders', [OrderController::class, 'index']);
    Route::post('/orders', [OrderController::class, 'store']);
    Route::get('/orders/{id}', [OrderController::class, 'show']);
    Route::put('/orders/{id}/cancel', [OrderController::class, 'cancel']);
    Route::put('/orders/{id}/status', [OrderController::class, 'updateStatus']);
    // Admin
    Route::middleware('admin')->group(function () {
        Route::put('/orders/{id}/status', [OrderController::class, 'updateStatus']);
    });


    // Route::get('/checkout', [CheckoutController::class, 'index']);
//     Route::post('/checkout', [CheckoutController::class, 'store']);
//     Route::post('/checkout/success', [CheckoutController::class, 'success']);
//     Route::post('/checkout/cancel', [CheckoutController::class, 'cancel']);
//     Route::post('/checkout/error', [CheckoutController::class, 'error']);

//     Route::get('/orders/{id}/cancel', [OrderController::class, 'cancel']);
//     Route::get('/orders/{id}/refund', [OrderController::class, 'refund']);
//     Route::get('/orders/{id}/refund/success', [OrderController::class, 'refundSuccess']);
//     Route::get('/orders/{id}/refund/cancel', [OrderController::class, 'refundCancel']);
//     Route::get('/orders/{id}/refund/error', [OrderController::class, 'refundError']);
//     Route::get('/orders/{id}/refund/details', [OrderController::class, 'refundDetails']);
//     Route::get('/orders/{id}/refund/details/success', [OrderController::class, 'refundDetailsSuccess']);
//     Route::get('/orders/{id}/refund/details/cancel', [OrderController::class, 'refundDetailsCancel']);
//     Route::get('/orders/{id}/refund/details/error', [OrderController::class, 'refundDetailsError']);
//     Route::get('/orders/{id}/refund/details/refund', [OrderController::class, 'refundDetailsRefund']);
//     Route::get('/orders/{id}/refund/details/refund/success', [OrderController::class, 'refundDetailsRefundSuccess']);
//     Route::get('/orders/{id}/refund/details/refund/cancel', [OrderController::class, 'refundDetailsRefundCancel']);
});
