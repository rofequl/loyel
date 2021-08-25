<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id');
            $table->string('order_code')->unique();
            $table->integer('payment_type');
            $table->integer('address_id');
            $table->integer('no_of_product');
            $table->float('subtotal');
            $table->float('shipping')->default(0);
            $table->float('total');
            $table->boolean('payment_status')->default(0)->comment('0 = Unpaid 1 = Paid');
            $table->boolean('delivered_status')->default(0)->comment('0 = Pending 1 = Confirmed 2 = On delivery 3 = Delivery 4 = Cancel');
            $table->boolean('status')->default(0);
            $table->timestamp('created_at')->default(DB::raw('CURRENT_TIMESTAMP'));
            $table->timestamp('updated_at')->default(DB::raw('CURRENT_TIMESTAMP'));
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
}
