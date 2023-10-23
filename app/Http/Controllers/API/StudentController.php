<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Student;

use Illuminate\Http\{Request, Response};
use Illuminate\Support\Facades\{Date, Validator};

class StudentController extends Controller
{
    /**
     * Create a new student.
     */
    public function create(Request $request)
    {
        $data = $request->all();
        if (isset($data['birth_date'])) {
            $data['birth_date'] = Date::parse(str_replace('"', '', $data['birth_date']))->format('Y-m-d');
        }

        $validator = Validator::make($data, [
            'name' => 'required',
            'birth_date' => 'required|date',
            'responsible_name' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation failed.',
                'messages' => $validator->messages(),
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        $student = Student::create([
            'name' => $data['name'],
            'birth_date' => $data['birth_date'],
            'responsible_name' => $data['responsible_name'],
            'school_id' => $data['school_id'],
            'created_at' => now(),
        ]);

        return response()->json([
            'message' => 'Student created successfully.',
            'id' => $student->id,
        ], Response::HTTP_CREATED);
    }

    /**
     * Update a existing student.
     */
    public function update(Request $request, $id)
    {
        $student = Student::whereNull('deleted_at')->find($id);

        if (!$student) {
            return response()->json([
                'error' => 'Student not found.',
            ], Response::HTTP_NOT_FOUND);
        }

        $rules = [
            'name' => 'sometimes',
            'birth_date' => 'sometimes|date',
            'responsible_name' => 'sometimes',
        ];

        $validator = Validator::make($request->all(), $rules);

        if ($validator->fails()) {
            return response()->json([
                'error' => 'Validation failed.',
                'messages' => $validator->messages(),
            ], Response::HTTP_UNPROCESSABLE_ENTITY);
        }

        if ($request->has('name')) {
            $student->name = $request->input('name');
        }
        if ($request->has('birth_date')) {
            $student->birth_date = $request->input('birth_date');
        }
        if ($request->has('responsible_name')) {
            $student->responsible_name = $request->input('responsible_name');
        }
        if ($request->has('school_id')) {
            $student->school_id = $request->input('school_id');
        }

        $student->save();

        return response()->json([
            'message' => 'Student updated successfully.',
        ], Response::HTTP_OK);
    }

    /**
     * Removes a existing student.
     */
    public function remove(Student $student, $id)
    {
        $student = Student::whereNull('deleted_at')->find($id);

        if (!$student) {
            return response()->json([
                'error' => 'Student not found.',
            ], Response::HTTP_NOT_FOUND);
        }

        $student->delete();

        return response()->json([
            'message' => 'Student removed successfully.',
        ], Response::HTTP_OK);
    }
}
