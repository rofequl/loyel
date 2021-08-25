<?php

namespace App\Http\Controllers;

use App\Model\Product;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Laravel\Lumen\Routing\Controller as BaseController;

class Controller extends BaseController
{
    protected function respondWithToken($token)
    {
        return response()->json([
            'token' => $token,
            'token_type' => 'bearer',
            'expires_in' => Auth::factory()->getTTL()
        ], 200);
    }

    protected function productInfo($id, $flash = null)
    {
        $product_details = Product::with('product_stock', 'price_variation')->find($id);
        $price = 0;
        $discount = 0;
        $discount_value = 0;
        $discount_type = 'Percent';
        if ($flash) {
            $discount_value = $flash['discount_value'];
            $discount_type = $flash['discount_type'];
        } else {
            if ($product_details->discount == 1 && $product_details->discount_method == 1) {
                $discount_value = $product_details->discount_value;
                $discount_type = $product_details->discount_type;
            }
        }
        if ($product_details->price_type == 1) {
            $price = (float)$product_details->price;
            $discount = (float)$product_details->price;
            if ($discount_value > 0) {
                if ($discount_type == 'Percent') {
                    $discount = $price - ($price * (int)$discount_value) / 100;
                } else {
                    $discount = $price - (float)$discount_value;
                }
            }
        } elseif ($product_details->price_type == 2) {
            $min = (float)$product_details->product_stock->min('price');
            $max = (float)$product_details->product_stock->max('price');
            $price = $min . '-' . $max;
            $discount = $min . '-' . $max;
            if ($discount_value > 0) {
                if ($discount_type == 'Percent') {
                    $discount = ($min - ($min * (int)$discount_value) / 100) . '-' . ($min - ($min * (int)$discount_value) / 100);
                } else {
                    $discount = ($min - (float)$discount_value) . '-' . ($max - (float)$discount_value);
                }
            }
        } else {
            $min = (float)$product_details->price_variation->min('price');
            $max = (float)$product_details->price_variation->max('price');
            $price = $min . '-' . $max;
            $discount = $min . '-' . $max;
            if ($discount_value > 0) {
                if ($discount_type == 'Percent') {
                    $discount = ($min - ($min * (int)$discount_value) / 100) . '-' . ($min - ($min * (int)$discount_value) / 100);
                } else {
                    $discount = ($min - (float)$discount_value) . '-' . ($max - (float)$discount_value);
                }
            }
        }

        return [
            'name' => $product_details->name, 'discount' => $discount, 'discount_type' => $discount_type,
            'thumbnail_img' => $product_details->thumbnail_img, 'slug' => $product_details->slug, 'price' => $price, 'discount_value' => $discount_value,
        ];
    }

    public function phone_number($number)
    {
        if (preg_match("/^(?:\+88|01)?(?:\d{11}|\d{13})$/", $number)) {
            $length = strlen($number);
            if ($length === 11 && stripos($number, "+88") == false) return "+88" . $number;
            elseif ($length === 14 && stripos($number, "88") && preg_match('/^\+?\d+$/', $number)) return $number;
            else return false;
        } else return false;
    }

    public function general()
    {
        return DB::table('generals')->get()->first();
    }

    public function dealProduct($id)
    {
        $deals = [];
        $product = DB::table('flash_deal_products')->where('product_id', $id)->get();
        foreach ($product as $products) {
            if ($products->discount === 1) {
                $deal = DB::table('flash_deals')->where('id', $products->flash_deal_id)->where('status', 1)->first();
                if ($deal) {
                    if (($deal->expired == 1 && $deal->expired_date >= date('Y-m-d')) || $deal->expired == 2) {
                        $deals['deal_name'] = $deal->title;
                        $deals['expired'] = $deal->expired;
                        $deals['expired_date'] = $deal->expired_date;
                        $deals['slug'] = $deal->slug;
                        $deals['discount_value'] = $products->discount_value;
                        $deals['discount_type'] = $products->discount_type;
                        break;
                    }
                }
            }
        }
        return empty($deals) ? false : $deals;
    }
}
