<?php

namespace App\Http\Controllers;

use App\Model\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class BusinessTypeController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('business_types')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:business_types',
        ]);

        $insert = DB::table('business_types')->insertGetId([
            'name' => $request->name,
        ]);
        return (array)DB::table('business_types')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:business_types,name,' . $id,
        ]);

        DB::table('business_types')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
            ]);
        return (array)DB::table('business_types')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('business_types')->where('id', $id)->delete();
    }
}
