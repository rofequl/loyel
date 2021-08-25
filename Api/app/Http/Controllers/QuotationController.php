<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class QuotationController extends Controller
{
    public function index()
    {
        return DB::table('quotations')->leftJoin('units', 'units.id', '=', 'quotations.unit_id')
            ->select('units.name as unit', 'quotations.*')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'product' => 'required|string|max:250',
            'email' => 'required|email|max:50',
        ]);

        DB::table('quotations')->insertGetId([
            'product' => $request->product,
            'email' => $request->email,
            'quantity' => $request->quantity,
            'unit_id' => $request->unit_id,
        ]);
    }

    public function destroy($id)
    {
        DB::table('quotations')->where('id', $id)->delete();
    }
}
