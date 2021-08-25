<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class ProductStock extends Model
{
    public $timestamps = false;

    public function Product()
    {
        return $this->belongsTo(Product::class);
    }
}
