<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class UnitController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('units')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:units',
        ]);
        $insert = DB::table('units')->insertGetId([
            'name' => $request->name,
        ]);
        return (array)DB::table('units')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:units,name,' . $id,
        ]);

        DB::table('units')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
            ]);
        return (array)DB::table('units')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('units')->where('id', $id)->delete();
    }
}
