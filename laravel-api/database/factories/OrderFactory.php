<?php

namespace Database\Factories;

use App\Models\Order;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Order>
 */
class OrderFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'user_id' => User::inRandomOrder()->first()?->id ?? 1,
            'total' => fake()->randomFloat(2, 10, 1000),
            'status' => fake()->randomElement([
                'pending',
                'confirmed',
                'shipping',
                'delivered',
                'cancelled',
            ]),
        ];
    }
}
