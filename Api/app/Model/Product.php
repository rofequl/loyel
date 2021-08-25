<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    public $timestamps = false;

    protected $casts = [
        'wishlist' => 'array'
    ];

    public function product_stock()
    {
        return $this->hasMany(ProductStock::class);
    }

    public function price_variation()
    {
        return $this->hasMany(PriceVariation::class);
    }

}
