<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\FileUpload;
use Illuminate\Support\Facades\File;

class StaffController extends Controller
{

    use FileUpload;

    public function index(Request $request)
    {
        return DB::table('staffs')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
        ]);

        $photo = 'image/user/user.png';
        if ($request->photo != '') {
            $photo = $this->saveImagesWH($request, 'photo', 'upload/staff/', 500, 500);
        }

        $insert = DB::table('staffs')->insertGetId([
            'name' => $request->name,
            'photo' => $photo,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'address' => $request->address,
            'designation' => $request->designation,
        ]);
        return (array)DB::table('staffs')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
        ]);

        $staffs = (array)DB::table('staffs')->where('id', $id)->first();
        $photo = $staffs['photo'];
        if ($request->photo != '' && strlen($request->photo) > 200) {
            if ($photo !== 'image/user/user.png') {
                File::delete(base_path('public/' . $photo));
            }
            $photo = $this->saveImagesWH($request, 'photo', 'upload/staff/', 500, 500);
        }

        DB::table('staffs')->where('id', $id)->update([
            'name' => $request->name,
            'photo' => $photo,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'address' => $request->address,
            'designation' => $request->designation,
        ]);
        return (array)DB::table('staffs')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        DB::table('staffs')->where('id', $id)->delete();
    }
}
