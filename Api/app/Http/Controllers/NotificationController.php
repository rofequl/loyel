<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class NotificationController extends Controller
{

    public function index(Request $request)
    {
        if (Auth::user()->user_type === 1) {
            return DB::table('notifications')->where('user_type', 'admin')->get();
        } else return DB::table('notifications')->where('user_id', Auth::user()->id)->get();
    }

    public function store(Request $request)
    {

    }

    public function update(Request $request, $id)
    {

    }

    public function destroy($id)
    {

    }
}
