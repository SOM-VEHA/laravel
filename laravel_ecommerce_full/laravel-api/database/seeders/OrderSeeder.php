<?php

namespace Database\Seeders;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class OrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        $products = Product::all();

        if ($users->isEmpty() || $products->isEmpty()) {
            return;
        }

        foreach ($users as $user) {

            $orderCount = fake()->numberBetween(1, 3);

            for ($i = 0; $i < $orderCount; $i++) {

                $order = Order::create([
                    'user_id' => $user->id,
                    'total' => 0,
                    'status' => fake()->randomElement([
                        'pending',
                        'confirmed',
                        'shipping',
                        'delivered',
                        'cancelled',
                    ]),
                ]);

                $total = 0;

                $itemCount = fake()->numberBetween(1, 4);

                for ($j = 0; $j < $itemCount; $j++) {

                    $product = $products->random();
                    $quantity = fake()->numberBetween(1, 5);
                    $price = $product->price;
                    $subtotal = $price * $quantity;

                    OrderItem::create([
                        'order_id' => $order->id,
                        'product_id' => $product->id,
                        'quantity' => $quantity,
                        'price' => $price,
                        'subtotal' => $subtotal,
                    ]);

                    $total += $subtotal;
                }

                $order->update([
                    'total' => $total,
                ]);
            }
        }
    }
}
