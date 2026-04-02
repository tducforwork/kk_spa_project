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
        Schema::table('support_tickets', function (Blueprint $table) {
            $table->tinyInteger('ticket_type')->default(1)->comment('1: Contact, 2: Inquiry, 3: Booking');
            $table->string('booking_date')->nullable();
            $table->string('booking_time')->nullable();
            $table->integer('guests')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('support_tickets', function (Blueprint $table) {
            $table->dropColumn(['ticket_type', 'booking_date', 'booking_time', 'guests']);
        });
    }
};
