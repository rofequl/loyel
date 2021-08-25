<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHelpQuestionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('help_questions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('subcategory_id');
            $table->string('question');
            $table->text('answer');
            $table->boolean('status')->default(0)->comment('0=Show Off, 1=Show On');
            $table->string('slug')->unique();

            $table->foreign('category_id')->references('id')->on('help_categories');
            $table->foreign('subcategory_id')->references('id')->on('help_subcategories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('help_questions');
    }
}
