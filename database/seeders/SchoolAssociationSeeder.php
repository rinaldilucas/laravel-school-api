<?php

namespace Database\Seeders;

use App\Models\SchoolAssociation;
use Illuminate\Database\Seeder;

class SchoolAssociationSeeder extends Seeder
{
    /**
     * Run the school association's seeder.
     */
    public function run()
    {
        SchoolAssociation::factory()->count(10)->create();
    }
}
