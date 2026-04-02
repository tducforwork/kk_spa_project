<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use Illuminate\Support\Facades\DB;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        if (!Schema::hasColumn('general_settings', 'admin_email')) {
            Schema::table('general_settings', function (Blueprint $table) {
                $table->string('admin_email')->nullable();
            });
        }

        $templates = [
            [
                'act' => 'NEWSLETTER_SUBSCRIBE_USER',
                'name' => 'Newsletter Subscribe User',
                'subject' => 'Welcome to our Newsletter',
                'email_body' => '<p>Hello,</p><p>Thank you for subscribing to our newsletter! You will now receive the latest updates and special offers from {{site_name}}.</p>',
                'shortcodes' => json_encode(['site_name' => 'Site Name']),
                'email_status' => 1,
            ],
            [
                'act' => 'NEWSLETTER_SUBSCRIBE_ADMIN',
                'name' => 'Newsletter Subscribe Admin',
                'subject' => 'New Newsletter Subscriber',
                'email_body' => '<p>Hello Admin,</p><p>A new user has subscribed to the newsletter. Email: {{email}}</p>',
                'shortcodes' => json_encode(['email' => 'Subscriber Email']),
                'email_status' => 1,
            ]
        ];

        foreach ($templates as $template) {
            $exists = DB::table('notification_templates')->where('act', $template['act'])->exists();
            if (!$exists) {
                DB::table('notification_templates')->insert($template);
            }
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        if (Schema::hasColumn('general_settings', 'admin_email')) {
            Schema::table('general_settings', function (Blueprint $table) {
                $table->dropColumn('admin_email');
            });
        }

        DB::table('notification_templates')->whereIn('act', ['NEWSLETTER_SUBSCRIBE_USER', 'NEWSLETTER_SUBSCRIBE_ADMIN'])->delete();
    }
};
