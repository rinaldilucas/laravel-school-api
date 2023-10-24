<?php

use Illuminate\Foundation\Testing\DatabaseTransactions;
use Tests\TestCase;

use App\Models\{School, SchoolAssociation, Student, User};

class SchoolControllerTest extends TestCase
{
    use DatabaseTransactions;

    /**
     * Run the school controller index endpoint test.
     */
    public function testGetSchools()
    {
        $user = User::factory()->create();
        $schools = SchoolAssociation::factory(3)->create(['user_id' => $user->id]);

        $this->actingAs($user);

        $response = $this->get('/api/escolas');
        $response->assertStatus(200);
        $response->assertJsonCount($schools->count());
    }

    /**
     * Run the school controller find students endpoint with results.
     */
    public function testGetStudentsForSchoolWithoutStudents()
    {
        $user = User::factory()->create([
            'email' => 'test@admin.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $school = School::factory()->create();

        $response = $this->get("/api/escolas/{$school->id}/alunos");
        $response->assertStatus(204);
    }

    /**
     * Run the school controller find students endpoint without results.
     */
    public function testGetStudentsForSchoolWithStudents()
    {
        $user = User::factory()->create([
            'email' => 'test@admin.com',
            'password' => bcrypt('password'),
        ]);

        $this->actingAs($user);

        $school = School::factory()->create();
        $students = Student::factory(3)->create(['school_id' => $school->id]);

        $response = $this->get("/api/escolas/{$school->id}/alunos");
        $response->assertStatus(200);
        $response->assertJsonCount($students->count());
    }
}
