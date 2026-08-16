<?php

namespace Database\Seeders;

use App\Models\RolePermission;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class RolePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $total = 10;

        while (RolePermission::count() < $total) {

            $data = RolePermission::factory()->make();

            RolePermission::firstOrCreate([
                'role_id' => $data->role_id,
                'permission_id' => $data->permission_id,
            ]);
        }
    }
}
