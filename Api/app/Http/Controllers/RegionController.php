<?php

namespace App\Http\Controllers;

use App\Model\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RegionController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('regions')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:regions',
        ]);

        $insert = DB::table('regions')->insertGetId([
            'name' => $request->name,
        ]);
        return Region::findOrFail($insert);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:regions,name,' . $id,
        ]);

        DB::table('regions')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
            ]);
        return Region::findOrFail($id);
    }

    public function destroy($id)
    {
        $city = DB::table('cities')->where('region_id', $id)->first();
        if ($city) return response()->json(['result' => 'Error', 'message' => 'Region already used create a city'], 200);
        DB::table('regions')->where('id', $id)->delete();
    }
}
