<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrderProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('order_products', function (Blueprint $table) {
            $table->id();
            $table->integer('order_id');
            $table->integer('product_id');
            $table->integer('qty');
            $table->float('unit_price');
            $table->float('discount_price');
            $table->boolean('discount')->default(1)->comment('1=Yes, 2=No');
            $table->float('discount_value')->default(0);
            $table->string('discount_type', 10)->default('Percent');
            $table->boolean('price_type')->default(1)->comment('1=Simple Product, 2=Variable Product, 3=Volume tier Pricing');
            $table->float('shipping')->default(0);
            $table->float('total');
            $table->mediumText('product_details')->nullable();
            $table->string('sku')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('order_products');
    }
}
