<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Auth;

use App\Models\{School, SchoolAssociation};

class SchoolController extends Controller
{
    /**
     * Display a listing of all schools of the logged user.
     */
    public function getOne()
    {
        $schoolAssociation = SchoolAssociation::where('user_id', Auth::id())->get();
        $schools = $schoolAssociation->map(fn ($association) => $association->school);

        if ($schools->isEmpty()) {
            return response()->json(['message' => 'No schools found for the user'], Response::HTTP_NOT_FOUND);
        }

        return $schools;
    }

    /**
     * Display a listing of all students by school.
     */
    public function getAllStudentsBySchool($schoolId)
    {
        $school = School::findOrFail($schoolId);

        if ($school->students->isEmpty()) {
            return response()->json([], Response::HTTP_NO_CONTENT);
        }

        $students = $school->students;

        return response()->json($students, Response::HTTP_OK);
    }
}
