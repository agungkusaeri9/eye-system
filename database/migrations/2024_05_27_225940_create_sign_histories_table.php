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
        Schema::create('sign_histories', function (Blueprint $table) {
            $table->id();
            $table->BigInteger('validator_id')->unsigned();
            $table->foreign('validator_id')->references('id')->on('users')->onDelete('cascade');
            $table->BigInteger('sign_id')->unsigned();
            $table->foreign('sign_id')->references('id')->on('signs')->onDelete('cascade');
            $table->string('news_status')->nullable();
            $table->string('sign_status')->nullable();
            $table->string('rejected_reason')->nullable();
            $table->string('accepted_note')->nullable();
            $table->string('note_customer')->nullable();
            $table->datetime('approved_news_date')->nullable();
            $table->datetime('approved_sign_date')->nullable();
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
        Schema::dropIfExists('sign_histories');
    }
};
