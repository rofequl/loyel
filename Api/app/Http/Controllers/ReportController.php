<?php

namespace App\Http\Controllers;

use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\DB;

class ReportController extends Controller
{
    use FileUpload;
    use Slug;

    public function stockReport(): Collection
    {
        $general = DB::table('generals')->get()->first();
        $product_list = collect();
        $product = DB::table('products')->select('id', 'name', 'price_type', 'stock_manage', 'quantity', 'added_by', 'user_id', 'sku')
            ->where('published', 1)->orderBy('id', 'DESC')->get();
        foreach ($product as $products) {
            if ($products->added_by === 'admin') {
                $store = $general->app_name;
            } else {
                $store = DB::table('shops')->where('user_id', $products->user_id)->pluck('shop_name')->first();
            }
            if ($products->price_type === 2) {
                $stock_product = DB::table('product_stocks')->where('product_id', $products->id)->get();
                foreach ($stock_product as $stock_products) {
                    $quantity = $products->stock_manage === 2 ? $stock_products->qty : 'Unlimited';
                    $product_list->push([
                        'name' => $products->name, 'quantity' => $quantity, 'store' => $store, 'sku' => $stock_products->sku
                    ]);
                }
            } else {
                $quantity = $products->stock_manage === 2 ? $products->quantity : 'Unlimited';
                $product_list->push([
                    'name' => $products->name, 'quantity' => $quantity, 'store' => $store, 'sku' => $products->sku
                ]);
            }
        }
        return $product_list;
    }

    public function mostViewed(): Collection
    {
        $general = DB::table('generals')->get()->first();
        $product_list = collect();
        $product = DB::table('products')->select('id', 'name', 'added_by', 'user_id', 'sku', 'total_view')
            ->where('published', 1)->orderBy('total_view', 'DESC')->get();
        foreach ($product as $products) {
            if ($products->added_by === 'admin') {
                $store = $general->app_name;
            } else {
                $store = DB::table('shops')->where('user_id', $products->user_id)->pluck('shop_name')->first();
            }
            $product_list->push([
                'name' => $products->name, 'view' => $products->total_view, 'store' => $store, 'sku' => $products->sku
            ]);
        }
        return $product_list;
    }

    public function salesReport(): Collection
    {
        $order_list = collect();
        $order = DB::table('orders')->get();
        foreach ($order as $orders) {
            $order_product = DB::table('order_products')->where('order_id', $orders->id)->get();
            foreach ($order_product as $order_products) {
                $order_list->push([
                    'order_code' => $orders->order_code, 'quantity' => $order_products->qty, 'price' => $order_products->qty * $order_products->unit_price,
                    'discount' => $order_products->qty * ($order_products->unit_price - $order_products->discount_price), 'total_price' => $order_products->total,
                    'shipping' => $order_products->shipping, 'sku' => $order_products->sku, 'date' => date('F d, Y', strtotime($orders->created_at)),
                    'payment_status' => $orders->payment_status,
                ]);
            }
        }
        return $order_list;
    }


}
