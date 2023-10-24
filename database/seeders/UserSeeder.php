<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the user's seeder.
     */
    public function run(): void
    {
        \App\Models\User::factory(10)->withSchool()->create();
    }
}
