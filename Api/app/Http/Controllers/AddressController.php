<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class AddressController extends Controller
{
    public function index(Request $request)
    {
        return DB::table('addresses')->join('regions', 'regions.id', '=', 'addresses.region_id')
            ->join('cities', 'cities.id', '=', 'addresses.city_id')
            ->join('areas', 'areas.id', '=', 'addresses.area_id')
            ->select('regions.name as region', 'cities.name as city', 'areas.name as area', 'addresses.*')->where('addresses.user_id', Auth::user()->id)->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'full_name' => 'required|string|max:50',
            'phone_number' => 'required',
            'region_id' => 'required',
            'city_id' => 'required',
            'area_id' => 'required',
            'address' => 'required|string|max:300',
        ]);
        $number = $this->phone_number($request->phone_number);
        if (!$number) {
            return response()->json(['errors' => 'Invalid phone number'], 422);
        }

        $insert = DB::table('addresses')->insertGetId([
            'user_id' => Auth::user()->id,
            'full_name' => $request->full_name,
            'phone_number' => $number,
            'region_id' => $request->region_id,
            'city_id' => $request->city_id,
            'area_id' => $request->area_id,
            'address' => $request->address,
            'address_type' => $request->address_type ? $request->address_type : 0,
            'default_shipping' => DB::table('addresses')->where('user_id', Auth::user()->id)->where('default_shipping', 1)->get()->count() > 0 ? 0 : 1,
        ]);
        return (array)DB::table('addresses')->join('regions', 'regions.id', '=', 'addresses.region_id')
            ->join('cities', 'cities.id', '=', 'addresses.city_id')
            ->join('areas', 'areas.id', '=', 'addresses.area_id')
            ->select('regions.name as region', 'cities.name as city', 'areas.name as area', 'addresses.*')->where('addresses.id', $insert)->first();
    }
}
