<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('ehays', function (Blueprint $table) {
            $table->string('patient_name')->nullable();
            $table->string('patient_status')->nullable();
            $table->dropConstrainedForeignId('family_id');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('ehays', function (Blueprint $table) {
            $table->dropColumn('patient_name');
            $table->dropColumn('patient_status');
        });
    }
};
