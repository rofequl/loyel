<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class PriceVariation extends Model
{
    public $timestamps = false;

    public function Product()
    {
        return $this->belongsTo(Product::class);
    }
}
