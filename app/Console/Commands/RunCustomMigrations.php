<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class RunCustomMigrations extends Command
{
    protected $signature = 'custom:run';
    protected $description = 'Run custom migrations and seeders in sequence';

    public function __construct()
    {
        parent::__construct();
    }

    public function handle()
    {
        $migrationsAndSeeders = [
            'database/migrations/2014_10_12_000000_create_users_table.php',
            'database/migrations/2014_10_12_100000_create_password_reset_tokens_table.php',
            'database/migrations/2019_08_19_000000_create_failed_jobs_table.php',
            'database/migrations/2019_12_14_000001_create_personal_access_tokens_table.php',
            'database/migrations/2023_10_19_172212_create_schools_table.php',
            'database/migrations/2023_10_19_172222_add_school_column_to_users_table.php',
            'database/migrations/2023_10_22_142337_make_school_id_nullable_in_users.php',
            'database/migrations/2023_10_22_150616_create_schools_associations_table.php',
            'database/seeds/SchoolSeeder.php',
            'database/seeds/DevSeeder.php',
            'database/seeds/UserSeeder.php',
            'database/migrations/2023_10_22_163556_insert_data_into_school_associations.php',
            'database/migrations/2023_10_22_164456_remove_school_relation_from_users.php',
            'database/migrations/2023_10_22_181710_create_students_table.php',
            'database/migrations/2023_10_22_201010_create_classrooms_table.php',
            'database/migrations/2023_10_22_211159_create_classrooms_associations_table.php',
            'database/seeds/StudentSeeder.php',
            'database/seeds/ClassroomSeeder.php',
        ];

        foreach ($migrationsAndSeeders as $migrationOrSeeder) {
            if (str_contains($migrationOrSeeder, 'seeds/')) {
                $this->call('db:seed', ['--class' => pathinfo($migrationOrSeeder, PATHINFO_FILENAME)]);
            } else {
                $this->call('migrate', ['--path' => $migrationOrSeeder]);
            }
        }

        $this->info('All custom migrations and seeders have been executed.');
    }
}
