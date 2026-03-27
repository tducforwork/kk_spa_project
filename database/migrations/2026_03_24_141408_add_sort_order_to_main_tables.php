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
        $tables = ['restaurants', 'rooms', 'special_offers', 'mice_events', 'facilities', 'posts'];
        foreach ($tables as $table) {
            Schema::table($table, function (Blueprint $table) {
                $table->integer('sort_order')->default(0);
            });
        }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        $tables = ['restaurants', 'rooms', 'special_offers', 'mice_events', 'facilities', 'posts'];
        foreach ($tables as $table) {
            Schema::table($table, function (Blueprint $table) {
                $table->dropColumn('sort_order');
            });
        }
    }
};
