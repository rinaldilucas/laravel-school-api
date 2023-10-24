<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\API\{AuthController, ClassroomController, SchoolController, StudentController};

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

/**
 * Public routes
 */
Route::post('login', [AuthController::class, 'login']);

/**
 * Auth routes
 */
Route::middleware('auth:sanctum')->group(function () {
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    Route::prefix('escolas')->group(function () {
        Route::get('/', [SchoolController::class, 'getOne']);
        Route::get('{id}/alunos', [SchoolController::class, 'getAllStudentsBySchool']);
    });

    Route::prefix('alunos')->group(function () {
        Route::post('/', [StudentController::class, 'create']);
        Route::put('{id}', [StudentController::class, 'update']);
        Route::delete('{id}', [StudentController::class, 'remove']);
    });

    Route::prefix('turmas')->group(function () {
        Route::get('{id}/alunos', [ClassroomController::class, 'getAllStudentsByClassroom']);
        Route::post('/', [ClassroomController::class, 'create']);
        Route::put('{id}', [ClassroomController::class, 'update']);
        Route::delete('{id}', [ClassroomController::class, 'remove']);
    });
});
