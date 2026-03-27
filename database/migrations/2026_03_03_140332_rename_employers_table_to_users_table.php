<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // 1. Drop old users table
        Schema::dropIfExists('users');

        // 2. Rename employers table to users
        Schema::rename('employers', 'users');

        // 3. Update tables with both user_id and employer_id
        $tablesWithBoth = [
            'admin_notifications',
            'deposits',
            'device_tokens',
            'notification_logs',
            'support_tickets',
            'transactions',
            'user_logins',
        ];

        foreach ($tablesWithBoth as $table) {
            if (Schema::hasColumn($table, 'user_id')) {
                Schema::table($table, function (Blueprint $table) {
                    $table->dropColumn('user_id');
                });
            }
            if (Schema::hasColumn($table, 'employer_id')) {
                Schema::table($table, function (Blueprint $table) {
                    $table->renameColumn('employer_id', 'user_id');
                });
            }
        }

        // 4. Update tables with only employer_id
        $tablesWithEmployerOnly = [
            'jobs',
            'subscriptions',
        ];

        foreach ($tablesWithEmployerOnly as $table) {
            if (Schema::hasColumn($table, 'employer_id')) {
                Schema::table($table, function (Blueprint $table) {
                    $table->renameColumn('employer_id', 'user_id');
                });
            }
        }

        // 5. Cleanup tables with only old user_id
        $tablesWithOldUserOnly = [
            'educational_qualifications',
            'employment_histories',
            'favorite_items',
            'job_applies',
            'user_certifications',
            'user_it_skills',
            'user_languages',
            'user_online_profiles',
            'user_patents',
            'user_presentations',
            'user_projects',
            'user_publications',
            'user_skills'
        ];

        foreach ($tablesWithOldUserOnly as $table) {
            Schema::dropIfExists($table);
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        // Not implementing down for this massive structural change
    }
};
