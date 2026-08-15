<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Banner>
 */
class BannerFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' =>  fake()->sentence(3),
            'image' => fake()->imageUrl( 1200,  500, 'banner' ),
            'description' =>  fake()->paragraph(),
            'status' => true,
        ];
    }
}
