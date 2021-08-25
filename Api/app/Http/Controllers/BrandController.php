<?php

namespace App\Http\Controllers;

use App\Model\Brand;
use App\Model\General;
use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;

class BrandController extends Controller
{
    use FileUpload;
    use Slug;

    public function index()
    {
        return DB::table('brands')->orderByRaw('ISNULL(serial), serial ASC')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:brands',
            'logo' => 'required',
        ]);
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }

        $logo = $this->saveImagesWH($request, 'logo', 'upload/product/brand/', 500, 500);
        $slug = $this->slugText($request, 'name');

        $insert = DB::table('brands')->insertGetId([
            'name' => $request->name,
            'name_bd' => $request->name_bd,
            'logo' => $logo,
            'slug' => $slug,
        ]);
        return Brand::findOrFail($insert);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:brands,name,' . $id,
            'logo' => 'required',
        ]);
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }
        $category = Brand::findOrFail($id);
        $category->name = $request->name;
        $category->name_bd = $request->name_bd;
        if (strlen($request->logo) > 200) {
            File::delete(base_path('public/' . $category->logo));
            $category->logo = $this->saveImagesWH($request, 'logo', 'upload/product/brand/', 300, 300);
        }
        $category->save();
        return $category;
    }

    public function destroy($id)
    {
        $brand = Brand::findOrFail($id);
        File::delete(base_path('public/' . $brand->logo));
        $brand->delete();
    }

    public function serial(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'serial' => 'required',
        ]);
        DB::table('brands')->where('id', $request->id)
            ->update([
                'serial' => $request->serial,
            ]);
    }
}
