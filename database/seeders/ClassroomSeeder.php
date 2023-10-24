<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class ClassroomSeeder extends Seeder
{
    /**
     * Run the classroom's seeder.
     */
    public function run(): void
    {
        \App\Models\Classroom::factory(10)->create();
    }
}
