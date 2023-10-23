<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class StudentSeeder extends Seeder
{
    /**
     * Run the student's seeder.
     */
    public function run(): void
    {
        \App\Models\Student::factory(10)->create();
    }
}
