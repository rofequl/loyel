<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CityController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('cities')->join('regions', 'regions.id', '=', 'cities.region_id')
            ->select('regions.name as region', 'cities.*')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'region_id' => 'required',
        ]);
        if (DB::table('cities')->where('region_id', $request->region_id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create city'], 422);
        }
        $insert = DB::table('cities')->insertGetId([
            'name' => $request->name,
            'region_id' => $request->region_id,
        ]);
        return (array)DB::table('cities')->join('regions', 'regions.id', '=', 'cities.region_id')
            ->select('regions.name as region', 'cities.*')->where('cities.id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'region_id' => 'required',
        ]);
        if (DB::table('cities')->where('region_id', $request->region_id)->where('id', '!=', $id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create city'], 422);
        }
        DB::table('cities')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
                'region_id' => $request->region_id,
            ]);
        return (array)DB::table('cities')->join('regions', 'regions.id', '=', 'cities.region_id')
            ->select('regions.name as region', 'cities.*')->where('cities.id', $id)->first();
    }

    public function destroy($id)
    {
        $area = DB::table('areas')->where('city_id', $id)->first();
        if ($area) return response()->json(['result' => 'Error', 'message' => 'City already used create a area'], 200);
        DB::table('cities')->where('id', $id)->delete();
    }
}
