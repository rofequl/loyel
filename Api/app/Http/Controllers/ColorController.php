<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ColorController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('colors')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:colors',
            'code' => 'required|string|max:50|unique:colors',
        ]);
        $insert = DB::table('colors')->insertGetId([
            'name' => $request->name,
            'code' => $request->code,
        ]);
        return (array)DB::table('colors')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:colors,name,' . $id,
            'code' => 'required|string|max:50|unique:colors,name,' . $id,
        ]);

        DB::table('colors')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
                'code' => $request->code,
            ]);
        return (array)DB::table('colors')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('colors')->where('id', $id)->delete();
    }
}
