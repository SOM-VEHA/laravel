<?php

namespace Database\Factories;

use App\Models\Category;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends Factory<Category>
 */
class CategoryFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => fake()->randomElement([
                'Action',
                'Adventure',
                'Animation',
                'Comedy',
                'Crime',
                'Documentary',
                'Drama',
                'Family',
                'Fantasy',
                'Horror',
                'Mystery',
                'Romance',
                'Science Fiction',
                'Thriller',
                'War',
                'Western',
                'Korean Drama',
                'Chinese Drama',
                'Khmer Movie',
                'Thai Movie',
            ]),
            'image' => fake()->imageUrl(400, 400),
        ];
    }
}
