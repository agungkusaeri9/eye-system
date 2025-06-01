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
        Schema::create('families', function (Blueprint $table) {
            $table->id();
            $table->foreignId('employee_id')->nullable()->constrained('employees')->cascadeOnDelete();
            $table->string('relation');
            $table->string('name');
            $table->timestamps();
        });

        Schema::create('ehays', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('code')->unique();
            $table->foreignId('employee_id')->nullable()->constrained('employees');
            $table->foreignId('family_id')->nullable()->constrained('families');
            $table->bigInteger('glasses_price')->nullable();
            $table->text('remarks')->nullable();
            $table->string('file');
            $table->integer('status')->nullable();
            $table->bigInteger('nominal_total')->default(0);
            $table->bigInteger('nominal_approve')->default(0);
            $table->timestamps();
        });

        Schema::create('ehay_cares', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->nullable()->constrained('ehays');
            $table->string('name')->nullable();
            $table->bigInteger('price');
            $table->timestamps();
        });

        Schema::create('ehay_treatments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->nullable()->constrained('ehays');
            $table->string('name');
            $table->bigInteger('price');
            $table->timestamps();
        });

        Schema::create('ehay_log_statuses', function (Blueprint $table) {
            $table->id();
            $table->foreignId('ehay_id')->nullable()->constrained('ehays')->cascadeOnDelete();
            $table->string('name');
            $table->integer('is_done')->default(0);
            $table->text('notes')->nullable();
            // $table->foreignId('user_by')->
            // $table->boolean('is_validation')->default(false);
            $table->timestamps();
        });

        Schema::table('employees', function (Blueprint $table) {
            $table->foreignId('user_id')->nullable()->constrained('users')->cascadeOnDelete();
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
        Schema::dropIfExists('ehay_treatments');
        Schema::dropIfExists('ehay_cares');
        Schema::dropIfExists('ehays');
        Schema::dropIfExists('families');
    }
};
