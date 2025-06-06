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

        Schema::create('ehays', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('code')->unique();
            $table->foreignId('employee_id')->nullable()->constrained('employees');
            $table->text('remarks')->nullable();
            $table->integer('status')->nullable();
            $table->bigInteger('nominal_total')->default(0);
            $table->bigInteger('nominal_approve')->default(0);
            $table->timestamps();
        });

        Schema::create('ehay_log_statuses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->nullable()->constrained('ehays')->cascadeOnDelete();
            $table->string('name');
            $table->integer('is_done')->default(0);
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        Schema::table('employees', function (Blueprint $table) {
            $table->foreignId('user_id')->nullable()->constrained('users')->cascadeOnDelete();
        });

        Schema::create('ehay_files', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->constrained()->cascadeOnDelete()->cascadeOnUpdate();
            $table->string('file');
            $table->timestamps();
        });

        Schema::create('ehay_details', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->constrained('ehays');
            $table->string('patient_name');
            $table->string('patient_status');
            $table->bigInteger('cost_treatment')->default(0);
            $table->bigInteger('cost_glasses')->default(0);
            $table->string('care_type1')->nullable();
            $table->bigInteger('cost_care1')->default(0);
            $table->string('care_type2')->nullable();
            $table->bigInteger('cost_care2')->default(0);
            $table->bigInteger('nominal_total')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('employees', function (Blueprint $table) {
            $table->dropForeign(['user_id']);
            $table->dropColumn('user_id');
        });

        Schema::dropIfExists('ehay_log_statuses');
        Schema::dropIfExists('ehay_files');
        Schema::dropIfExists('ehay_details');
        Schema::dropIfExists('ehays');
    }
};
