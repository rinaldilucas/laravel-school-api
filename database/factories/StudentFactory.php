<?php

namespace Database\Factories;

use App\Models\School;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Student>
 */
class StudentFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'name' => $this->faker->name,
            'birth_date' => $this->faker->date,
            'responsible_name' => $this->faker->name,
            'school_id' => School::factory(),
        ];
    }

    /**
     * Define a custom state for Portuguese data.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function portuguese()
    {
        return $this->state([
            'name' => $this->faker->name,
            'birth_date' => $this->faker->date,
            'responsible_name' => $this->faker->name,
        ]);
    }
}
