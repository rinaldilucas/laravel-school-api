<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Classroom;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

use Illuminate\Http\{Request, Response};

class ClassroomController extends Controller
{
    /**
     * Display a listing of all students by classroom.
     */
    public function getAllStudentsByClassroom($classroomId)
    {
        $classroom = Classroom::with('students')->find($classroomId);

        if (!$classroom) {
            return response()->json(['error' => 'Classroom not found.'], Response::HTTP_NOT_FOUND);
        }

        $students = $classroom->students;

        return response()->json($students, Response::HTTP_OK);
    }

    /**
     * Create a new classroom.
     */
    public function create(Request $request)
    {
        $data = $request->all();

        $keyMappings = [
            'codigo' => 'code',
            'responsavel' => 'responsible_id',
            'escola' => 'school_id',
            'alunos' => 'students',
        ];

        $data = array_combine(
            array_map(fn ($key) => $keyMappings[$key] ?? $key, array_keys($data)),
            $data
        );

        $validator = Validator::make($data, [
            'code' => [
                'required',
                Rule::unique('classrooms', 'code')
                    ->where(fn ($query) => $query->whereNull('deleted_at'))
                    ->ignore($data['id'] ?? null),
            ],
            'responsible_id' => 'required|exists:users,id',
            'school_id' => 'required|exists:schools,id',
            'students' => 'required|array',
            'students.*' => 'exists:students,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation failed.',
                'messages' => $validator->messages(),
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $classroom = Classroom::create([
            'code' => $data['code'],
            'responsible_id' => $data['responsible_id'],
            'school_id' => $data['school_id'],
            'created_at' => now(),
        ]);

        foreach ($data['students'] as $studentId) {
            $classroom->students()->attach($studentId, ['created_at' => now()]);
        }

        return response()->json([
            'message' => 'Classroom created successfully.',
            'id' => $classroom->id,
        ], Response::HTTP_CREATED);
    }

    /**
     * Update a existing classroom.
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();

        $keyMappings = [
            'codigo' => 'code',
            'responsavel' => 'responsible_id',
            'escola' => 'school_id',
            'alunos' => 'students',
        ];

        $data = array_combine(
            array_map(fn ($key) => $keyMappings[$key] ?? $key, array_keys($data)),
            $data
        );

        $validator = Validator::make($data, [
            'code' => 'unique:classrooms,code,' . $id,
            'responsible_id' => 'exists:users,id',
            'school_id' => 'exists:schools,id',
            'students' => 'array',
            'students.*' => 'exists:students,id',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation failed.',
                'messages' => $validator->messages(),
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $classroom = Classroom::find($id);

        if (!$classroom) {
            return response()->json([
                'error' => 'Classroom not found.',
            ], Response::HTTP_NOT_FOUND);
        }

        $updateData = [];

        if (isset($data['code']) && $data['code'] !== $classroom->code) {
            $updateData['code'] = $data['code'];
        }
        if (isset($data['responsible_id'])) {
            $updateData['responsible_id'] = $data['responsible_id'];
        }
        if (isset($data['school_id'])) {
            $updateData['school_id'] = $data['school_id'];
        }
        if (!empty($updateData)) {
            $updateData['updated_at'] = now();
            $classroom->update($updateData);
        }
        if (isset($data['students'])) {
            $classroom->students()->sync($data['students'], ['created_at' => now()]);
        }

        return response()->json([
            'message' => 'Classroom updated successfully.',
        ], Response::HTTP_OK);
    }

    /**
     * Removes a existing classroom.
     */
    public function remove(Request $classroom, $id)
    {
        $classroom = Classroom::whereNull('deleted_at')->find($id);

        if (!$classroom) {
            return response()->json([
                'error' => 'Classroom not found.',
            ], Response::HTTP_NOT_FOUND);
        }

        $classroom->delete();

        return response()->json([
            'message' => 'Classroom deleted successfully.',
        ], Response::HTTP_OK);
    }
}
