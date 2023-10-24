<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\Schema;

use App\Models\{SchoolAssociation, User};

class InsertDataIntoSchoolAssociations extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
        $users = User::all();

        foreach ($users as $user) {
            SchoolAssociation::create([
                'user_id' => $user->id,
                'school_id' => $user->school_id,
            ]);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down()
    {
        Schema::dropIfExists('school_associations');
    }
};
