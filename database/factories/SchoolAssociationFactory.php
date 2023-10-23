<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

use App\Models\{School, User};

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\SchoolAssociation>
 */
class SchoolAssociationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'user_id' => User::factory(),
            'school_id' => School::factory(),
        ];
    }
}
