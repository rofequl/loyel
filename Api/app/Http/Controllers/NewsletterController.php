<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class NewsletterController extends Controller
{
    public function index()
    {
        return DB::table('subscribers')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email|max:255|unique:subscribers',
        ]);
        DB::table('subscribers')->insert([
            'email' => $request->email,
        ]);
    }

    public function destroy($id)
    {
        DB::table('subscribers')->where('id', $id)->delete();
    }
}
