<?php

namespace App\Http\Controllers;

use App\Model\General;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\Slug;

class SubSubcategoryController extends Controller
{
    use Slug;

    public function index(Request $request)
    {
        return DB::table('sub_sub_categories')->join('categories', 'categories.id', '=', 'sub_sub_categories.category_id')
            ->join('sub_categories', 'sub_categories.id', '=', 'sub_sub_categories.subcategory_id')
            ->select('categories.name as category', 'sub_categories.name as subcategory', 'sub_sub_categories.*')
            ->orderByRaw('ISNULL(sub_sub_categories.serial), sub_sub_categories.serial ASC')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'category_id' => 'required',
            'subcategory_id' => 'required',
        ]);
        if (DB::table('sub_sub_categories')->where('subcategory_id', $request->subcategory_id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create Sub Subcategory'], 422);
        }
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }
        $slug = $this->slugText($request, 'name');

        $insert = DB::table('sub_sub_categories')->insertGetId([
            'name' => $request->name,
            'name_bd' => $request->name_bd,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'slug' => $slug,
        ]);
        return (array)DB::table('sub_sub_categories')->join('categories', 'categories.id', '=', 'sub_sub_categories.category_id')
            ->join('sub_categories', 'sub_categories.id', '=', 'sub_sub_categories.subcategory_id')
            ->select('categories.name as category', 'sub_categories.name as subcategory', 'sub_sub_categories.*')
            ->where('sub_sub_categories.id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50',
            'category_id' => 'required',
            'subcategory_id' => 'required',
        ]);
        if (DB::table('sub_sub_categories')->where('subcategory_id', $request->subcategory_id)->where('id', '!=', $id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create Sub Subcategory'], 422);
        }
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }
        DB::table('sub_sub_categories')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
                'name_bd' => $request->name_bd,
                'category_id' => $request->category_id,
                'subcategory_id' => $request->subcategory_id,
            ]);
        return (array)DB::table('sub_sub_categories')->join('categories', 'categories.id', '=', 'sub_sub_categories.category_id')
            ->join('sub_categories', 'sub_categories.id', '=', 'sub_sub_categories.subcategory_id')
            ->select('categories.name as category', 'sub_categories.name as subcategory', 'sub_sub_categories.*')
            ->where('sub_sub_categories.id', $id)->first();
    }

    public function destroy($id)
    {
        $product = DB::table('products')->where('sub_subcategory_id', $id)->first();
        if ($product) return response()->json(['result' => 'Error', 'message' => 'Sub-Subcategory already used create a product'], 200);
        DB::table('sub_sub_categories')->where('id', $id)->delete();
    }

    public function serial(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'serial' => 'required',
        ]);
        DB::table('sub_sub_categories')->where('id', $request->id)
            ->update([
                'serial' => $request->serial,
            ]);
    }
}
