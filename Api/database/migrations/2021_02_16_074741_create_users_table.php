<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUsersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id();
            $table->boolean('user_type')->default(0)->comment('0=Customer, 1=Admin, 2=Seller, 3=Both');
            $table->string('seller_id')->nullable()->unique();
            $table->string('customer_id')->nullable()->unique();
            $table->string('name')->nullable();
            $table->boolean('photo_type')->default(0)->comment('0=URl generate, 1=Full url');
            $table->string('photo', 100)->default('image/user/user.png');
            $table->string('username')->nullable()->unique();
            $table->string('email')->nullable();
            $table->boolean('email_verify')->default(0)->comment('0=Unverified, 1=Verify');
            $table->string('mobile')->nullable();
            $table->boolean('mobile_verify')->default(0)->comment('0=Unverified, 1=Verify');
            $table->integer('permission_id')->nullable();
            $table->string('password')->nullable();
            $table->date('birthday')->nullable();
            $table->string('gender', 10)->nullable();
            $table->boolean('status')->default(1)->comment('0=Block');
            $table->boolean('seller_verify')->default(0)->comment('0=Unverified, 1=Verify');
            $table->string('ip_address')->nullable();
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
        Schema::dropIfExists('users');
    }
}
