<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        Schema::create('classrooms_associations', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('classroom_id')->unsigned();
            $table->foreign('classroom_id')->references('id')->on('classrooms');
            $table->unsignedBigInteger('student_id')->unsigned();
            $table->foreign('student_id')->references('id')->on('students');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::table('classrooms_associations', function (Blueprint $table) {
            $table->dropForeign(['classroom_id']);
            $table->dropForeign(['student_id']);
        });

        Schema::dropIfExists('classrooms_associations');
    }
};
