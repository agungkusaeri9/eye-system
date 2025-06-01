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
        Schema::create('sign_documents', function (Blueprint $table) {
            $table->id();
            $table->BigInteger('sign_id')->unsigned();
            $table->foreign('sign_id')->references('id')->on('signs')->onDelete('cascade');
            $table->string('sign_document')->nullable();
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
        Schema::dropIfExists('sign_documents');
    }
};
