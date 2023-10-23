<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

use Illuminate\Support\{Facades\DB, Str};

class DevSeeder extends Seeder
{
    /**
     * Run the developer's seeder.
     */
    public function run(): void
    {
        DB::table('users')->insert([
            'name' => 'Admin',
            'email' => 'admin@admin.com',
            'password' => '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', // password
            'email_verified_at' => now(),
            'remember_token' => Str::random(10),
            'created_at' => now(),
            'updated_at' => now(),
            'school_id' => 1,
        ]);
    }
}
