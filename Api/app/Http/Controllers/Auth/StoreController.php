<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Traits\FileUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class StoreController extends Controller
{
    use FileUpload;

    public function storeUpdate(Request $request)
    {
        $this->validate($request, [
            'shop_name' => 'required|string',
            'category_id' => 'required',
            'shop_logo' => 'required',
        ]);
        $store = DB::table('shops')->where('user_id', Auth::user()->id)->first();
        $shop_logo = $store->shop_logo;
        if (strlen($request->shop_logo) > 200) {
            if ($store->shop_logo) File::delete(base_path('public/' . $store->shop_logo));
            $shop_logo = $this->saveImagesWH($request, 'shop_logo', 'upload/user/store/', 450, 450);
        }

        $photos = [];
        foreach ($request->shop_banner as $image) {
            if (strlen($image) > 200) {
                $photo = $this->saveImagesDWH($image, 'upload/user/store/', 1500, 450);
                array_push($photos, $photo);
            } else {
                foreach (json_decode($store->shop_banner) as $pho) {
                    if (strpos($image, $pho)) {
                        array_push($photos, $pho);
                    }
                }
            }
        }

        DB::table('shops')
            ->where('user_id', Auth::user()->id)
            ->update([
                'shop_name' => $request->shop_name,
                'category_id' => $request->category_id,
                'shop_description' => $request->shop_description,
                'phone' => $request->phone,
                'shop_logo' => $shop_logo,
                'shop_banner' => json_encode($photos),
            ]);
        if (count($request->business_types) > 0) {
            DB::table('user_business_types')->where('user_id', Auth::user()->id)->delete();
            foreach ($request->business_types as $business_type) {
                $business_id = DB::table('business_types')->where('name', $business_type)->first()->id;
                DB::table('user_business_types')->insert([
                    'business_type_id' => $business_id,
                    'user_id' => Auth::user()->id,
                ]);
            }
        }
    }

    public function socialUpdate(Request $request)
    {
        $this->validate($request, [
            'facebook' => 'max:50',
            'twitter' => 'max:50',
            'youtube' => 'max:50',
            'insta' => 'max:50',
        ]);
        DB::table('shops')->where('user_id', Auth::user()->id)->update([
            'social' => $request->social,
            'facebook' => $request->facebook,
            'twitter' => $request->twitter,
            'youtube' => $request->youtube,
            'insta' => $request->insta,
        ]);
    }

    public function financialUpdate(Request $request)
    {
        $this->validate($request, [
            'id_type' => 'required',
            'id_code' => 'required|max:50',
            'bank_name' => 'max:50',
            'bank_branch_name' => 'max:50',
            'bank_account_name' => 'max:50',
            'bank_account_number' => 'max:50',
            'bank_routing_number' => 'max:50',
            'tin_number' => 'max:50',
        ]);
        DB::table('financials')->where('user_id', Auth::user()->id)->update([
            'id_type' => $request->id_type,
            'id_code' => $request->id_code,
            'bank_name' => $request->bank_name,
            'bank_branch_name' => $request->bank_branch_name,
            'bank_account_name' => $request->bank_account_name,
            'bank_account_number' => $request->bank_account_number,
            'bank_routing_number' => $request->bank_routing_number,
            'tin_number' => $request->tin_number,
        ]);
    }

    public function contactUpdate(Request $request)
    {
        $this->validate($request, [
            'region_id' => 'required',
            'city_id' => 'required',
            'area_id' => 'required',
            'address' => 'required|string|max:300',
        ]);
        DB::table('shop_addresses')->where('user_id', Auth::user()->id)->update([
            'region_id' => $request->region_id,
            'city_id' => $request->city_id,
            'area_id' => $request->area_id,
            'address' => $request->address,
        ]);
    }

    public function vacationUpdate(Request $request)
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        DB::table('shops')->where('user_id', Auth::user()->id)->update([
            'vacation' => $request->active,
        ]);
    }
}
