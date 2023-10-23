<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class SchoolSeeder extends Seeder
{
    /**
     * Run the school's seeder.
     */
    public function run(): void
    {
        \App\Models\School::factory(10)->create();
    }
}
