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
        Schema::table('mice_event_translations', function (Blueprint $table) {
            $table->text('additional_info')->after('short_description')->nullable();
            $table->text('suite_highlights')->after('additional_info')->nullable();
            $table->text('technology')->after('suite_highlights')->nullable();
            $table->text('bed_bath')->after('technology')->nullable();
            $table->text('others')->after('bed_bath')->nullable();
            $table->string('seo_title')->after('others')->nullable();
            $table->text('seo_description')->after('seo_title')->nullable();
            $table->string('seo_keywords')->after('seo_description')->nullable();
        });

        Schema::table('mice_events', function (Blueprint $table) {
            $table->dropColumn('image_intro');
        });

        Schema::table('mice_event_images', function (Blueprint $table) {
            $table->tinyInteger('type')->default(1)->after('image')->comment('1: main gallery, 2: intro gallery');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('mice_event_translations', function (Blueprint $table) {
            $table->dropColumn(['additional_info', 'suite_highlights', 'technology', 'bed_bath', 'others', 'seo_title', 'seo_description', 'seo_keywords']);
        });

        Schema::table('mice_events', function (Blueprint $table) {
            $table->string('image_intro')->nullable();
        });

        Schema::table('mice_event_images', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
};
