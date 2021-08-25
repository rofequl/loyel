<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PageController extends Controller
{

    public function index()
    {
        $page = DB::table('pages')->get()->first();
        if (!$page) {
            DB::table('pages')->insert([
                'id' => 1,
            ]);
            $page = DB::table('pages')->get()->first();
        }
        return ['data' => $page];
    }

    public function store(Request $request)
    {
        $page = DB::table('pages')->get()->first();
        DB::table('pages')->where('id', $page->id)->update([
            'privacy' => $request->privacy,
            'terms_condition' => $request->terms_condition,
            'about_us' => $request->about_us,
        ]);
    }
}
