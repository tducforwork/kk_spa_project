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
        Schema::table('special_offers', function (Blueprint $table) {
            $table->dropColumn('image_intro');
        });

        Schema::table('special_offer_images', function (Blueprint $table) {
            $table->tinyInteger('type')->default(1)->after('special_offer_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('special_offers', function (Blueprint $table) {
            $table->string('image_intro')->nullable()->after('image');
        });

        Schema::table('special_offer_images', function (Blueprint $table) {
            $table->dropColumn('type');
        });
    }
};
