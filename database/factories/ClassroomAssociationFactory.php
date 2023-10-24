<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

use App\Models\{Classroom, Student};

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\ClassroomAssociation>
 */
class ClassroomAssociationFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'classroom_id' => Classroom::factory(),
            'student_id' => Student::factory()
        ];
    }
}
