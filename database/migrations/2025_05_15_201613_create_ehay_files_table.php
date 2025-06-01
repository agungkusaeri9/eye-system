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
        Schema::create('ehay_files', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->constrained()->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('file');
            $table->timestamps();
        });

        Schema::table('ehays', function (Blueprint $table) {
            $table->string('patient_name')->nullable();
            $table->string('patient_status')->nullable();
            $table->dropConstrainedForeignId('family_id');
        });

        Schema::table('ehays', function (Blueprint $table) {
            $table->dropColumn('file');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('ehay_files');
        Schema::table('ehays', function (Blueprint $table) {
            $table->string('file')->nullable();
            $table->dropColumn('patient_name');
            $table->dropColumn('patient_status');
        });
    }
};
