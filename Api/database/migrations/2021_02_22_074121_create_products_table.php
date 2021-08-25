<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->unsignedBigInteger('subcategory_id')->nullable();
            $table->unsignedBigInteger('sub_subcategory_id')->nullable();
            $table->boolean('cat_position')->default(1);
            $table->string('name');
            $table->string('added_by', 10);
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('brand_id')->nullable();
            $table->unsignedBigInteger('unit_id')->nullable();
            $table->boolean('Refundable')->default(1)->comment('1=True, 2=False');
            $table->string('weight', 100)->nullable();
            $table->mediumText('tags')->nullable();
            $table->string('dimension')->nullable();
            $table->boolean('product_type')->default(1)->comment('1=New, 2=Used');
            $table->boolean('attribute')->default(1)->comment('1=Yes, 2=No');
            $table->mediumText('attribute_option')->nullable();
            $table->string('photos', 2000)->nullable();
            $table->string('thumbnail_img', 100)->nullable();
            $table->string('video_link', 100)->nullable();
            $table->longText('description')->nullable();
            $table->boolean('color_image')->default(1)->comment('1=Yes, 2=No');
            $table->mediumText('color')->nullable();
            $table->boolean('qty_manage')->default(1)->comment('1=Yes, 2=No');
            $table->integer('min_qty')->default(1);
            $table->integer('max_qty')->default(1);
            $table->boolean('price_type')->default(1)->comment('1=Simple Product, 2=Variable Product, 3=Volume tier Pricing');
            $table->boolean('stock_manage')->default(2)->comment('2=Yes, 1=No');
            $table->integer('quantity')->default(1);
            $table->float('price')->default(1);
            $table->boolean('discount')->default(1)->comment('1=Yes, 2=No');
            $table->float('discount_value')->default(1);
            $table->string('discount_type', 10)->default('Percent');
            $table->boolean('discount_method')->default(1)->comment('1=Simple, 2=Variation');
            $table->boolean('warranty_type')->default(0);
            $table->string('warranty_period', 100)->nullable();
            $table->boolean('shipping')->default(1)->comment('1=Cost, 2=Free');
            $table->float('shipping_cost')->default(1);
            $table->boolean('status')->default(1);
            $table->mediumText('slug');
            $table->string('sku')->nullable();
            $table->boolean('featured')->default(0);
            $table->boolean('published')->default(0);
            $table->integer('total_sell')->default(0);
            $table->json('wishlist')->nullable();

            $table->foreign('category_id')->references('id')->on('categories');
            $table->foreign('subcategory_id')->references('id')->on('sub_categories');
            $table->foreign('sub_subcategory_id')->references('id')->on('sub_sub_categories');
            $table->foreign('user_id')->references('id')->on('users');
            $table->foreign('brand_id')->references('id')->on('brands');
            $table->foreign('unit_id')->references('id')->on('units');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
