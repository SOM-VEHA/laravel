<?php

namespace App\Http\Controllers\Api;
use Illuminate\Support\Facades\Auth;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Cart;
use App\Models\CartItem;
use App\Models\Product;
class CartController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $cart = Cart::with('product')->where('user_id', Auth::id())->first();
        return response()->json(
            [
                'success' => true,
                'message' => 'Get cart successfully.',
                'code'=>200,
                'cart' => $cart,
            ]
        );
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'product_id' => 'required|exists:products,id',
            'quantity' => 'required|integer|min:1',
        ]);


        $user = Auth::id();

        $product = Product::findOrFail($request->product_id);

        $cart = Cart::where('user_id', $user)->where('product_id', $product->id)->first();

        if($cart){
            $cart->quantity += $request->quantity;
            $cart->subtotal = $cart->price * $cart->quantity;
            $cart->save();
        }else{
            $cart = Cart::create([
                'user_id' => $user,
                'product_id' => $product->id,
                'quantity' => $request->quantity,
                'price' => $product->price,
                'subtotal' => $product->price * $request->quantity,
            ]);
        }
        return response()->json([
            'success' => true,
            'message' => 'Product added to cart successfully.',
            'data' => $cart->load('product'),
        ], 201);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $user=Auth::id();

        $cart = Cart::where('id', $id)->where('user_id', $user)->first();

        if (!$cart) {
            return response()->json([
                'success' => false,
                'message' => 'Cart not found.',
            ], 404);
        }

        $cart->delete();

        return response()->json([
            'success' => true,
            'message' => 'Product removed from cart.',
        ]);
    }
}
