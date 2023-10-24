<?php

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

use App\Models\{Student, User};

class StudentControllerTest extends TestCase
{
    use DatabaseTransactions;

    /**
     * Run the student controller create endpoint test for success.
     */
    public function testCreateStudentSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $studentData = Student::factory()->make();

        $response = $this->json('POST', '/api/alunos', $studentData->toArray());

        $response->assertStatus(201);
        $response->assertJson([
            'message' => 'Student created successfully.',
        ]);

        $studentId = $response->json('id');

        $this->assertDatabaseHas('students', [
            'id' => $studentId,
            'name' => $studentData->name,
            'birth_date' => $studentData->birth_date,
            'responsible_name' => $studentData->responsible_name,
        ]);
    }

    /**
     * Run the student controller create endpoint test for failure.
     */
    public function testCreateStudentFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $invalidStudentData = [
            'birth_date' => '2000-01-01',
            'responsible_name' => 'Responsible Name',
        ];

        $response = $this->json('POST', '/api/alunos', $invalidStudentData);

        $response->assertStatus(422);
        $response->assertJson([
            'error' => 'Validation failed.',
        ]);
        $this->assertDatabaseMissing('students', [
            'name' => 'Joe',
        ]);
    }

    /**
     * Run the student controller update endpoint test for success.
     */
    public function testUpdateStudentSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $student = Student::factory()->create();

        $this->actingAs($user);

        $updatedData = [
            'name' => 'New Name',
            'birth_date' => '2000-02-02',
            'responsible_name' => 'New Responsible Name',
        ];

        $response = $this->json('PUT', '/api/alunos/' . $student->id, $updatedData);

        $response->assertStatus(200);
        $response->assertJson([
            'message' => 'Student updated successfully.',
        ]);
        $this->assertDatabaseHas('students', [
            'id' => $student->id,
            'name' => 'New Name',
            'birth_date' => '2000-02-02',
            'responsible_name' => 'New Responsible Name',
        ]);
    }

    /**
     * Run the student controller update endpoint test for failure.
     */
    public function testUpdateStudentFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $student = Student::factory()->create();

        $this->actingAs($user);

        $invalidData = [
            'birth_date' => '2023-15-32',
        ];

        $response = $this->json('PUT', '/api/alunos/' . $student->id, $invalidData);

        $response->assertStatus(422);
        $responseJson = $response->json();
        $this->assertArrayHasKey('error', $responseJson);
        $this->assertEquals('Validation failed.', $responseJson['error']);
        $this->assertArrayHasKey('messages', $responseJson);
        $this->assertArrayHasKey('birth_date', $responseJson['messages']);
        $this->assertContains('The birth date field must be a valid date.', $responseJson['messages']['birth_date']);
        $this->assertDatabaseHas('students', [
            'id' => $student->id,
            'name' => $student->name,
            'birth_date' => $student->birth_date,
            'responsible_name' => $student->responsible_name,
        ]);
    }

    /**
     * Run the student controller remove endpoint test for success.
     */
    public function testRemoveStudentSuccessfully()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $student = Student::factory()->create();

        $this->actingAs($user);

        $response = $this->json('DELETE', '/api/alunos/' . $student->id);

        $response->assertStatus(200);
        $response->assertJson([
            'message' => 'Student removed successfully.',
        ]);
        $this->assertSoftDeleted('students', [
            'id' => $student->id,
        ]);
    }

    /**
     * Run the student controller remove endpoint test for failure.
     */
    public function testRemoveStudentFailure()
    {
        $user = User::factory()->create([
            'email' => 'test@test.com',
            'password' => bcrypt('password'),
        ]);

        $student = Student::factory()->create();

        $this->actingAs($user);

        $nonExistentStudentId = $student->id + 1;

        $response = $this->json('DELETE', '/api/alunos/' . $nonExistentStudentId);

        $response->assertStatus(404);
        $response->assertJson([
            'error' => 'Student not found.',
        ]);
        $this->assertDatabaseHas('students', [
            'id' => $student->id,
        ]);
    }
}
