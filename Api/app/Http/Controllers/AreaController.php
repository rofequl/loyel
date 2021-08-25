<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AreaController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('areas')->join('regions', 'regions.id', '=', 'areas.region_id')
            ->join('cities', 'cities.id', '=', 'areas.city_id')
            ->select('regions.name as region', 'cities.name as city', 'areas.*')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'region_id' => 'required',
            'city_id' => 'required',
        ]);
        if (DB::table('areas')->where('region_id', $request->region_id)->where('city_id', $request->city_id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create area'], 422);
        }
        $insert = DB::table('areas')->insertGetId([
            'name' => $request->name,
            'region_id' => $request->region_id,
            'city_id' => $request->city_id,
        ]);
        return (array)DB::table('areas')->join('regions', 'regions.id', '=', 'areas.region_id')
            ->join('cities', 'cities.id', '=', 'areas.city_id')
            ->select('regions.name as region', 'cities.name as city', 'areas.*')->where('areas.id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'region_id' => 'required',
            'city_id' => 'required',
        ]);
        if (DB::table('areas')->where('id', '!=', $id)->where('region_id', $request->region_id)->where('city_id', $request->city_id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create area'], 422);
        }
        DB::table('areas')->where('id', $id)
            ->update([
                'name' => $request->name,
                'region_id' => $request->region_id,
                'city_id' => $request->city_id,
            ]);
        return (array)DB::table('areas')->join('regions', 'regions.id', '=', 'areas.region_id')
            ->join('cities', 'cities.id', '=', 'areas.city_id')
            ->select('regions.name as region', 'cities.name as city', 'areas.*')->where('areas.id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('areas')->where('id', $id)->delete();
    }

    public function shippingCost(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'shipping_cost' => 'required',
        ]);
        DB::table('areas')->where('id', $request->id)
            ->update([
                'shipping_cost' => $request->shipping_cost,
            ]);
    }
}
