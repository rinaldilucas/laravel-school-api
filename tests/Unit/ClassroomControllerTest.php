<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

use App\Models\{Classroom, School, Student, User};

class ClassroomControllerTest extends TestCase
{
    use DatabaseTransactions;

    /**
     * Run the classroom controller create endpoint test.
     */
    public function testCreateClassroomSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $school = School::factory()->create();
        $students = Student::factory(2)->create();

        $classroomData = [
            'code' => 'test_classroom',
            'responsible_id' => $user->id,
            'school_id' => $school->id,
            'students' => $students->pluck('id')->toArray(),
        ];

        $response = $this->json('POST', '/api/turmas', $classroomData);
        $response->assertStatus(201);
        $response->assertJson([
            'message' => 'Classroom created successfully.',
        ]);

        $classroomId = $response->json('id');

        $this->assertDatabaseHas('classrooms', [
            'id' => $classroomId,
            'code' => $classroomData['code'],
            'responsible_id' => $user->id,
            'school_id' => $school->id,
        ]);

        foreach ($students as $student) {
            $this->assertDatabaseHas('classrooms_associations', [
                'classroom_id' => $classroomId,
                'student_id' => $student->id,
            ]);
        }
    }

    /**
     * Run the classroom controller create endpoint failure.
     */
    public function testCreateClassroomFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $invalidData = [
            'responsible_id' => $user->id,
            'school_id' => 999,
            'students' => [123],
        ];

        $response = $this->json('POST', '/api/turmas', $invalidData);
        $response->assertStatus(422);
        $response->assertJsonStructure(['error', 'messages']);
    }

    /**
     * Run the classroom controller update endpoint test.
     */
    public function testUpdateClassroomSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $school = School::factory()->create();
        $students = Student::factory(2)->create();

        $classroom = Classroom::factory()->create([
            'code' => 'initial_code',
            'responsible_id' => $user->id,
            'school_id' => $school->id,
        ]);

        $classroom->students()->attach($students->pluck('id')->toArray());

        $this->actingAs($user);

        $updatedData = [
            'code' => 'updated_code',
            'responsible_id' => $user->id,
            'school_id' => $school->id,
            'students' => $students->pluck('id')->toArray(),
        ];

        $response = $this->json('PUT', "/api/turmas/{$classroom->id}", $updatedData);

        $response->assertStatus(200);
        $response->assertJson([
            'message' => 'Classroom updated successfully.',
        ]);
        $this->assertDatabaseHas('classrooms', [
            'id' => $classroom->id,
            'code' => $updatedData['code'],
            'responsible_id' => $user->id,
            'school_id' => $school->id,
        ]);
        foreach ($students as $student) {
            $this->assertDatabaseHas('classrooms_associations', [
                'classroom_id' => $classroom->id,
                'student_id' => $student->id,
            ]);
        }
    }

    /**
     * Run the classroom controller update endpoint failure.
     */
    public function testUpdateClassroomFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $school = School::factory()->create();
        $students = Student::factory(2)->create();

        $classroom = Classroom::factory()->create([
            'code' => 'initial_code',
            'responsible_id' => $user->id,
            'school_id' => $school->id,
        ]);

        $classroom->students()->attach($students->pluck('id')->toArray());

        $this->actingAs($user);

        $updatedData = [
            'code' => '',
            'responsible_id' => 999,
            'school_id' => 999,
            'students' => [123],
        ];

        $response = $this->json('PUT', "/api/turmas/{$classroom->id}", $updatedData);

        $response->assertStatus(422);
        $response->assertJsonStructure(['error', 'messages']);
    }

    /**
     * Run the student controller remove endpoint test for success.
     */
    public function testRemoveClassroomSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $classroom = Classroom::factory()->create();

        $this->actingAs($user);

        $response = $this->json('DELETE', '/api/turmas/' . $classroom->id);

        $response->assertStatus(200);
        $response->assertJson([
            'message' => 'Classroom deleted successfully.',
        ]);
        $this->assertSoftDeleted('classrooms', [
            'id' => $classroom->id,
        ]);
    }

    /**
     * Run the student controller remove endpoint test for failure.
     */
    public function testRemoveClassroomFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $classroom = Classroom::factory()->create();

        $this->actingAs($user);

        $nonExistentClassroomId = $classroom->id + 1;

        $response = $this->json('DELETE', '/api/turmas/' . $nonExistentClassroomId);

        $response->assertStatus(404);
        $response->assertJson([
            'error' => 'Classroom not found.',
        ]);
        $this->assertDatabaseHas('classrooms', [
            'id' => $classroom->id,
        ]);
    }
}
