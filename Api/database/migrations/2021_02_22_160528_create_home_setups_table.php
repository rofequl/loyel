<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeSetupsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_setups', function (Blueprint $table) {
            $table->id();
            $table->text('home_slider')->nullable();
            $table->boolean('top_brand')->default(0)->comment('0=Hide, 1=Show');
            $table->boolean('featured_seller')->default(0)->comment('0=Hide, 1=Show');
            $table->json('featured_seller_list')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('home_setups');
    }
}
