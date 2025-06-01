<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('signs', function (Blueprint $table) {
            $table->id();
            $table->string('sign_number')->unique()->nullable();
            $table->BigInteger('from_id')->unsigned();
            $table->foreign('from_id')->references('id')->on('users')->onDelete('cascade');
            $table->string('name')->nullable();
            $table->string('sign_file')->nullable();
            $table->string('verified_sign_file')->nullable();
            $table->string('to_id')->nullable();
            $table->string('type')->nullable();
            $table->string('status')->nullable();
            $table->string('sign')->nullable();
            $table->string('signature')->nullable();
            $table->string('catatan_diterima')->nullable();
            $table->string('alasan_ditolak')->nullable();
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
        Schema::dropIfExists('signs');
    }
};
