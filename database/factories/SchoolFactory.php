<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\School>
 */
class SchoolFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        fake()->addProvider(new \Faker\Provider\pt_BR\Person(fake()));

        return [
            'name' => 'Escola ' . fake()->name(),
            'inep' => fake()->numerify('########'),
            'uf' => fake()->stateAbbr(),
            'city' => fake()->city(),
        ];
    }
}
