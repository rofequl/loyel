<?php

namespace App\Http\Controllers;

use App\Model\General;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\FileUpload;
use Illuminate\Support\Facades\File;

class GeneralController extends Controller
{
    use FileUpload;

    public function dashboard()
    {
        $data = [];

        $data['totalData'] = [
            'categories' => DB::table('categories')->get()->count(),
            'brands' => DB::table('brands')->get()->count(),
            'products' => DB::table('products')->get()->count(),
            'quotations' => DB::table('quotations')->get()->count(),
            'customers' => DB::table('users')->whereIn('user_type', [0, 3])->get()->count(),
            'pending_orders' => DB::table('orders')->where('delivered_status', 0)->get()->count(),
            'total_sales' => DB::table('orders')->where('delivered_status', '!=', 0)->get()->sum('no_of_product'),
            'revenue' => DB::table('orders')->where('delivered_status', '!=', 0)->get()->sum('total'),
        ];
        $data['top_sell'] = DB::table('products')->select('name', 'total_sell', 'slug')->orderBy('total_sell', 'DESC')->take(5)->get();
        $data['latest_order'] = DB::table('orders')->join('users', 'users.id', '=', 'orders.user_id')
            ->select('users.name as user_name', 'users.photo as avatar', 'users.created_at as registered', 'orders.*')->orderBy('orders.id', 'DESC')->take(6)->get();
        return $data;
    }

    public function generalIndex()
    {
        $data = [];
        $footer = DB::table('footers')->get()->first();
        $general = DB::table('generals')->get()->first();
        if (!$general) {
            DB::table('generals')->insert(
                ['id' => 1]
            );
            $general = DB::table('generals')->get()->first();
        }

        if (!$footer) {
            DB::table('footers')->insert(
                ['id' => 1]
            );
            $footer = DB::table('footers')->get()->first();
        }
        $data['general'] = $general;
        $data['footer'] = $footer;
        return $data;
    }

    public function generalStore(Request $request)
    {
        $this->validate($request, [
            'app_name' => 'required|string',
            'logo_white' => 'required',
            'logo_black' => 'required',
        ]);
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'app_name_bd' => 'required',
            ]);
        }
        if (strlen($request->logo_white) > 200) {
            if ($general->logo_white !== 'image/setup/logo_white.png') {
                File::delete(base_path('public/' . $general->logo_white));
            }
            $general->logo_white = $this->saveImages($request, 'logo_white', 'upload/general/');
        }

        if (strlen($request->logo_black) > 200) {
            if ($general->logo_black !== 'image/setup/logo_black.png') {
                File::delete(base_path('public/' . $general->logo_black));
            }
            $general->logo_black = $this->saveImages($request, 'logo_black', 'upload/general/');
        }
        $general->app_name = $request->app_name;
        $general->app_name_bd = $request->app_name_bd;
        $general->save();

        return DB::table('generals')->get();
    }

    public function contactStore(Request $request)
    {
        $this->validate($request, [
            'address' => 'required|string',
            'phone' => 'required',
            'email' => 'required',
            'working' => 'required|string',
        ]);
        $footer = DB::table('footers')->get()->first();
        DB::table('footers')->where('id', $footer->id)->update([
            'address' => $request->address,
            'phone' => $request->phone,
            'email' => $request->email,
            'working' => $request->working,
        ]);

        return redirect('general-settings');
    }

    public function footerStore(Request $request)
    {
        $this->validate($request, [
            'description' => 'max:2500',
            'copyright' => 'max:1000',
            'facebook' => 'max:50',
            'twitter' => 'max:50',
            'youtube' => 'max:50',
            'insta' => 'max:50',
        ]);
        $footer = DB::table('footers')->get()->first();
        DB::table('footers')->where('id', $footer->id)->update([
            'description' => $request->description,
            'copyright' => $request->copyright,
            'social' => $request->social,
            'facebook' => $request->facebook,
            'twitter' => $request->twitter,
            'youtube' => $request->youtube,
            'insta' => $request->insta,
        ]);

        return redirect('general-settings');
    }

    public function languageActive(Request $request)
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = General::all()->first();
        $general->bangla_language = $data;
        $general->save();
        return $data;
    }

    public function languageDefault(Request $request)
    {
        $this->validate($request, [
            'type' => 'required',
        ]);
        $request->type === 2 ? $data = 2 : $data = 1;
        $general = General::all()->first();
        $general->default_language = $data;
        $general->save();
        return $data;
    }

    public function maintenanceActive(Request $request)
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = General::all()->first();
        $general->maintenance_mode = $data;
        $general->save();
        return $data;
    }

    public function shipping(Request $request)
    {
        $this->validate($request, [
            'shipping_method' => 'required',
        ]);
        $general = General::all()->first();
        $general->shipping_method = (int)$request->shipping_method;
        $general->shipping_cost = (int)$request->shipping_cost;
        $general->save();
        return (int)$request->shipping_method;
    }

    public function sellerVerifyActive(Request $request)
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = General::all()->first();
        $general->seller_verify = $data;
        $general->save();
        return $data;
    }

    public function productVerifyActive(Request $request)
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = General::all()->first();
        $general->product_verify = $data;
        $general->save();
        return $data;
    }

}
