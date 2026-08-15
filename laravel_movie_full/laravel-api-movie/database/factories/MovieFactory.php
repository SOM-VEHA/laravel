<?php

namespace Database\Factories;
use App\Models\Movie;
use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Movie>
 */
class MovieFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'title' => fake()->sentence(3),
            'description' => fake()->paragraph(),
            'image' => fake()->imageUrl(400, 600),
            'banner' => fake()->imageUrl(1200, 500),
            'category_id' => Category::inRandomOrder()->first()->id ?? 1,
            'rating' => fake()->randomFloat(1, 1, 10),
            'price' => fake()->randomFloat(2, 1, 50),
            'is_new' => fake()->boolean(),
            'is_popular' => fake()->boolean(),
        ];
    }
}
