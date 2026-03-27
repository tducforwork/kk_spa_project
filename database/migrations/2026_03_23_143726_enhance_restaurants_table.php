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
        Schema::table('restaurant_images', function (Blueprint $table) {
            $table->tinyInteger('type')->default(1)->after('restaurant_id');
        });

        Schema::table('restaurant_translations', function (Blueprint $table) {
            $table->dropColumn(['menu_name', 'menu_intro']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('restaurant_images', function (Blueprint $table) {
            $table->dropColumn('type');
        });

        Schema::table('restaurant_translations', function (Blueprint $table) {
            $table->string('menu_name')->nullable();
            $table->text('menu_intro')->nullable();
        });
    }
};
