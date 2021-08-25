<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateAddressesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('addresses', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('full_name');
            $table->string('phone_number');
            $table->integer('region_id');
            $table->integer('city_id');
            $table->integer('area_id');
            $table->mediumText('address');
            $table->boolean('address_type')->default(0)->comment('0=Home, 1=Office');
            $table->boolean('default_shipping')->default(0)->comment('1=Default shipping address');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('addresses');
    }
}
