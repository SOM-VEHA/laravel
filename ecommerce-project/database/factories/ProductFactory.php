<?php

namespace Database\Factories;
use App\Models\Category;
use App\Models\Brand;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Product>
 */
class ProductFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
     return [
                'category_id' => Category::inRandomOrder()->first()->id ?? 1,
                'brand_id' => Brand::inRandomOrder()->first()->id ?? 1,
                'name' => fake()->words(3, true),
                'description' => fake()->text(100),
                'price' => fake()->randomFloat(2, 10, 1000),
                'stock' => fake()->numberBetween(1, 100),
                'image' => fake()->imageUrl(200, 200, 'products'),
                'rating' => fake()->numberBetween(1, 5),
            ];
    }
}
