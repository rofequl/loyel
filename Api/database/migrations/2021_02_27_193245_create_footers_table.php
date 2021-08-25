<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateFootersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('footers', function (Blueprint $table) {
            $table->id();
            $table->string('address', 100)->default('Chromium Co , 25 Silicon Road, London D04 89GR');
            $table->string('phone', 15)->default('+2734662455-198');
            $table->string('email', 20)->default('example@example.com');
            $table->string('working', 50)->default('Mon-Fri 8:00 to 19:00');
            $table->string('description', 2500)->default('Lorem ipsum dolor sit amet, consecrated advising elite, sed do emus tempor incididunt ut labore et dolore magna aliqua. Quis ipsum suspendisse ultrices gravida.')->nullable();
            $table->string('copyright', 1000)->default('© 2020 Bongo Bazar All Rights reserved');
            $table->boolean('social')->default('0');
            $table->string('facebook', 50)->nullable();
            $table->string('twitter', 50)->nullable();
            $table->string('youtube', 50)->nullable();
            $table->string('insta', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('footers');
    }
}
