<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
class OrderController extends Controller
{
    public function index()
    {
        $user=Auth::id();

        $orders = Order::with('items.product')->where('user_id', $user)->latest()->get();

        return response()->json(
            [
                'success' => true,
                'message' => 'Get orders successfully.',
                'code'=>200,
                'orders' => $orders,
            ]
        );
    }
    public function store(Request $request)
    {
        $user = Auth::id();

        $cart = Cart::with('product')
            ->where('user_id', $user)
            ->get();

        if ($cart->isEmpty()) {
            return response()->json([
                'success' => false,
                'message' => 'Your cart is empty.',
            ], 400);
        }

        // Check stock first
        foreach ($cart as $item) {

            if (!$item->product) {
                return response()->json([
                    'success' => false,
                    'message' => "Product ID {$item->product_id} not found.",
                ], 404);
            }

            if ($item->quantity > $item->product->stock) {
                return response()->json([
                    'success' => false,
                    'message' => "Not enough stock for {$item->product->name}.",
                    'available_stock' => $item->product->stock,
                    'requested_quantity' => $item->quantity,
                ], 400);
            }
        }

        $order = DB::transaction(function () use ($cart, $user) {

            $total = $cart->sum('subtotal');

            $order = Order::create([
                'user_id' => $user,
                'total' => $total,
                'status' => 'pending',
            ]);

            foreach ($cart as $item) {

                OrderItem::create([
                    'order_id' => $order->id,
                    'product_id' => $item->product_id,
                    'quantity' => $item->quantity,
                    'price' => $item->price,
                    'subtotal' => $item->subtotal,
                ]);

                // Reduce stock
                $item->product->decrement('stock', $item->quantity);
            }

            // Clear cart
            Cart::where('user_id', $user)->delete();

            return $order;
        });

        return response()->json([
            'success' => true,
            'message' => 'Order created successfully.',
            'data' => $order->load('items.product'),
        ], 201);
    }
    public function cancel($id)
    {
        $user = Auth::id();

        $order = Order::with('items')
            ->where('id', $id)
            ->where('user_id', $user)
            ->first();

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found.',
            ], 404);
        }

        // Only pending orders can be cancelled
        if ($order->status !== 'pending') {
            return response()->json([
                'success' => false,
                'message' => 'Only pending orders can be cancelled.',
            ], 400);
        }

        DB::transaction(function () use ($order) {

            foreach ($order->items as $item) {

                $product = $item->product;

                if ($product) {
                    $product->increment('stock', $item->quantity);
                }
            }

            $order->status = 'cancelled';
            $order->save();
        });

        return response()->json([
            'success' => true,
            'message' => 'Order cancelled and stock restored successfully.',
            'data' => $order->load('items.product'),
        ]);
    }
    public function show(Request $request, $id)
    {
        $order = Order::with('items.product')
            ->where('user_id', $request->user()->id)
            ->where('id', $id)
            ->first();

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found.',
            ], 404);
        }

        return response()->json([
            'success' => true,
            'data' => $order,
        ]);
    }
    public function updateStatus(Request $request, $id)
    {
        $request->validate([
            'status' => 'required|in:confirmed,shipping,delivered',
        ]);

        $order = Order::find($id);

        if (!$order) {
            return response()->json([
                'success' => false,
                'message' => 'Order not found.',
            ], 404);
        }

        $currentStatus = $order->status;
        $newStatus = $request->status;

        $flow = [
            'pending' => 'confirmed',
            'confirmed' => 'shipping',
            'shipping' => 'delivered',
        ];

        // Check if current status can be changed
        if (!isset($flow[$currentStatus])) {
            return response()->json([
                'success' => false,
                'message' => "Order status '{$currentStatus}' cannot be updated.",
            ], 400);
        }

        // Check correct next status
        if ($flow[$currentStatus] !== $newStatus) {
            return response()->json([
                'success' => false,
                'message' => "Cannot change status from {$currentStatus} to {$newStatus}.",
            ], 400);
        }

        $order->status = $newStatus;
        $order->save();

        return response()->json([
            'success' => true,
            'message' => 'Order status updated successfully.',
            'data' => $order,
        ]);
    }
    public function update(Request $request, Order $order)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Order $order)
    {
        //
    }
}
