<?php

namespace App\Http\Controllers;

use App\Model\HomeSetup;
use App\Traits\ApiResponse;
use App\Traits\Notification;
use Barryvdh\DomPDF\Facade as PDF;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Image;
use Milon\Barcode\DNS1D;

class OrderController extends Controller
{
    use ApiResponse;
    use Notification;

    public function index()
    {
        return DB::table('orders')->join('users', 'users.id', '=', 'orders.user_id')
            ->select('users.name as user_name', 'users.username as username', 'users.mobile as mobile', 'orders.*')->get();
    }

    public function userOrder()
    {
        $result = [];
        $order = DB::table('orders')->where('user_id', Auth::user()->id)->get();
        foreach ($order as $orders) {
            array_push($result, $this->getOrderDetails($orders->order_code));
        }
        return $result;
    }

    public function show($code)
    {
        $result = $this->getOrderDetails($code);
        if (array_key_exists('result', $result)) {
            return response()->json($result, 404);
        }
        return response()->json($result);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'order_list' => 'required',
            'payment_type' => 'required',
        ]);

        $subtotal = 0;
        $shipping = 0;
        $total = 0;
        $order_list = [];
        foreach ($request->order_list as $order) {
            $product = DB::table('products')->where('id', $order['id'])->first();
            $subtotal += $order['total_price'];
            $total += $order['total_price'];
            if ($order['variation'] === 0) {
                array_push($order_list, ['product_id' => $product->id, 'qty' => $order['qty'], 'unit_price' => $order['price'],
                    'total' => $order['total_price'], 'discount' => $order['discount'] ? 1 : 2, 'discount_price' => $order['total_discount'],
                    'sku' => $order['sku'], 'product_details' => '', 'price_type' => $order['price_type'],
                    'discount_type' => $order['discount_type'], 'discount_value' => $order['discount_amount'],]);
            } else {
                array_push($order_list, ['product_id' => $product->id, 'qty' => $order['qty'], 'unit_price' => $order['price'],
                    'total' => $order['total_price'], 'discount' => $order['discount'] ? 1 : 2, 'discount_price' => $order['total_discount'],
                    'sku' => $order['sku'], 'product_details' => json_encode($order['variation_value']), 'price_type' => $order['price_type'],
                    'discount_type' => $order['discount_type'], 'discount_value' => $order['discount_amount'],]);
            }
        }
        $address = DB::table('addresses')->where('user_id', Auth::user()->id)->where('default_shipping', 1)->first();

        $code_generate = '';
        if ($total > 1 && $total < 1000) $code_generate = 'LYL';
        else if ($total >= 1000 && $total < 10000) $code_generate = 'LYS';
        else if ($total >= 10000 && $total < 100000) $code_generate = 'LYH';
        else $code_generate = 'LYB';
        $last = DB::table('orders')->latest()->first();
        $last = $last ? $last->id + 1 : 1;
        $insert = DB::table('orders')->insertGetId([
            'user_id' => Auth::user()->id,
            'order_code' => $code_generate . str_pad($last, 8, "0", STR_PAD_LEFT),
            'payment_type' => (int)$request->payment_type,
            'address_id' => (int)$address->id,
            'no_of_product' => count($order_list),
            'subtotal' => $subtotal,
            'shipping' => $shipping,
            'total' => $total,
        ]);

        foreach ($order_list as $order) {
            DB::table('order_products')->insert([
                'order_id' => $insert,
                'product_id' => $order['product_id'],
                'qty' => $order['qty'],
                'unit_price' => $order['unit_price'],
                'discount_price' => $order['discount_price'],
                'discount' => $order['discount'],
                'discount_value' => $order['discount_value'],
                'discount_type' => $order['discount_type'],
                'price_type' => $order['price_type'],
                'product_details' => $order['product_details'],
                'shipping' => 0,
                'total' => $order['total'],
                'sku' => $order['sku'],
            ]);
        }

        $message = Auth::user()->name . ' order a product. Customer Id: ' . Auth::user()->customer_id;
        $this->notification($message, 'admin', '0');


        return $this->successResponse('Product Order successfully');
    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {
        DB::table('orders')->where('id', $id)->delete();
        DB::table('order_products')->where('order_id', $id)->delete();
    }

    public function getOrderDetails($code)
    {
        $result = [];
        $order = DB::table('orders')->where('order_code', $code)->first();
        if ($order) {
            $address = DB::table('addresses')->join('regions', 'regions.id', '=', 'addresses.region_id')
                ->join('cities', 'cities.id', '=', 'addresses.city_id')
                ->join('areas', 'areas.id', '=', 'addresses.area_id')
                ->select('regions.name as region', 'cities.name as city', 'areas.name as area', 'addresses.*')
                ->where('addresses.id', $order->address_id)->first();
            $user = DB::table('users')->where('id', $order->user_id)->select('email', 'customer_id')->first();

            $product = [];
            $order_product = DB::table('order_products')->where('order_id', $order->id)->get();
            foreach ($order_product as $order_products) {
                $single_product = DB::table('products')->where('id', $order_products->product_id)->first();
                array_push($product, ['image' => $single_product->thumbnail_img, 'name' => $single_product->name, 'quantity' => $order_products->qty,
                    'total' => $order_products->total, 'discount_price' => $order_products->discount_price, 'discount' => $order_products->discount,
                    'discount_value' => $order_products->discount_value, 'discount_type' => $order_products->discount_type, 'price_type' => $order_products->price_type,
                    'product_details' => json_decode($order_products->product_details), 'slug' => $single_product->slug, 'unit_price' => $order_products->unit_price,
                    'sku' => $order_products->sku,]);
            }


            $result = ['shipping_address' => $address, 'order_code' => $order->order_code, 'customer_email' => $user->email, 'customer_id' => $user->customer_id, 'payment_type' => $order->payment_type,
                'subtotal' => $order->subtotal, 'shipping' => $order->shipping, 'total' => $order->total, 'delivered_status' => $order->delivered_status,
                'created_at' => $order->created_at, 'order_product' => $product, 'payment_status' => $order->payment_status];
        } else {
            $result = ['result' => 'Error', 'message' => 'Order not found'];
        }

        return $result;
    }

    public function paymentUpdate(Request $request)
    {
        $this->validate($request, [
            'order_code' => 'required',
            'value' => 'required',
        ]);
        DB::table('orders')
            ->where('order_code', $request->order_code)
            ->update([
                'payment_status' => (int)$request->value,
            ]);
    }

    public function deliveryUpdate(Request $request)
    {
        $this->validate($request, [
            'order_code' => 'required',
            'value' => 'required',
        ]);
        DB::table('orders')
            ->where('order_code', $request->order_code)
            ->update([
                'delivered_status' => (int)$request->value,
            ]);
    }

    public function orderCancel(Request $request)
    {
        $this->validate($request, [
            'order_code' => 'required',
            'value' => 'required',
        ]);
        DB::table('orders')
            ->where('order_code', $request->order_code)->where('user_id', Auth::user()->id)
            ->update([
                'delivered_status' => (int)$request->value,
            ]);
    }

    public function printInvoice($code)
    {
        $order = DB::table('orders')->where('order_code', $code)->first();
        if ($order) {
            $address = DB::table('addresses')->join('regions', 'regions.id', '=', 'addresses.region_id')
                ->join('cities', 'cities.id', '=', 'addresses.city_id')
                ->join('areas', 'areas.id', '=', 'addresses.area_id')
                ->select('regions.name as region', 'cities.name as city', 'areas.name as area', 'addresses.*')
                ->where('addresses.id', $order->address_id)->first();
            $user = DB::table('users')->where('id', $order->user_id)->select('email', 'customer_id')->first();

            $product = [];
            $order_product = DB::table('order_products')->where('order_id', $order->id)->get();
            foreach ($order_product as $order_products) {
                $single_product = DB::table('products')->where('id', $order_products->product_id)->first();
                array_push($product, ['image' => $single_product->thumbnail_img, 'name' => $single_product->name, 'quantity' => $order_products->qty,
                    'total' => $order_products->total, 'discount_price' => $order_products->discount_price, 'discount' => $order_products->discount,
                    'discount_value' => $order_products->discount_value, 'discount_type' => $order_products->discount_type, 'price_type' => $order_products->price_type,
                    'product_details' => json_decode($order_products->product_details), 'slug' => $single_product->slug, 'unit_price' => $order_products->unit_price,
                    'sku' => $order_products->sku,]);
            }


            $result = ['shipping_address' => $address, 'order_code' => $order->order_code, 'customer_email' => $user->email, 'customer_id' => $user->customer_id, 'payment_type' => $order->payment_type,
                'subtotal' => $order->subtotal, 'shipping' => $order->shipping, 'total' => $order->total, 'delivered_status' => $order->delivered_status,
                'created_at' => $order->created_at, 'order_product' => $product, 'payment_status' => $order->payment_status];

            $footer = DB::table('footers')->get()->first();
            $general = DB::table('generals')->get()->first();
            $barcode = new DNS1D();
            $pdf = PDF::loadView('pdf.invoice', compact('general', 'footer', 'result', 'barcode'))->setPaper('a4');
            return $pdf->download($result['order_code'] . '.pdf');
            //return view('pdf.invoice', compact('general', 'footer', 'result', 'barcode'));
        } else {
            return ['result' => 'Error', 'message' => 'Order not found'];
        }

//        $pdf = PDF::loadView('pdf.invoice');
//        return $pdf->download('invoice.pdf');

    }
}
