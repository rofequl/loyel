<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHelpSubcategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('help_subcategories', function (Blueprint $table) {
            $table->id();
            $table->string('name',50)->unique();
            $table->unsignedBigInteger('category_id');
            $table->string('slug')->unique();

            $table->foreign('category_id')->references('id')->on('help_categories');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('help_subcategories');
    }
}
