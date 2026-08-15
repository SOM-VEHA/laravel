<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CheckoutController extends Controller
{
    public function store(Request $request){
        $request->validate([
            'name' => 'required|string',
            'email' => 'required|email',
            'address' => 'required|string',
            'city' => 'required|string',
            'state' => 'required|string',
            'zip' => 'required|string',
            'country' => 'required|string',
            'phone' => 'required|string',
            'items' => 'required|array',
        ]);
        $items = $request->items;
        $order = Order::create([
            'name' => $request->name,
            'email' => $request->email,
            'address' => $request->address,
            'city' => $request->city,
            'state' => $request->state,
            'zip' => $request->zip,
            'country' => $request->country,
            'phone' => $request->phone,
            'total' =>
            $items->map(function ($item) {
                return $item->price * $item->quantity;
            })->sum(),
            'status' => 'pending',
        ]);
        $items->each(function ($item) {
            $item->order_id = $order->id;
            $item->save();
        });
        return
        response()->json(
            [
                'success' => true,
                'message' => 'Order created successfully.',
                'code'=>200,
                'order' => $order,
            ]
        );
    }
}
