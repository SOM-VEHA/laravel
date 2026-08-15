<?php

namespace Database\Seeders;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Movie;
use App\Models\User;
use App\Models\Favorite;
class FavoriteSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $users = User::all();
        $movies = Movie::all();

        for ($i = 0; $i < 50; $i++) {
            Favorite::firstOrCreate([
                'user_id' => $users->random()->id,
                'movie_id' => $movies->random()->id,
            ]);
        }
    }
}
