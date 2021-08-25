<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class AttributeController extends Controller
{

    public function index(Request $request)
    {
        return DB::table('attributes')->get()->map(function ($data) {
            $data->value = json_decode($data->value);
            return $data;
        });
    }

    public function store(Request $request, $position, $id)
    {
        $this->validate($request, [
            'name' => 'required',
        ]);
        $conditions = ['name' => $request->name];
        $category_id = Null;
        $subcategory_id = Null;
        $sub_subcategory_id = Null;
        if ($position == 1) {
            $conditions = array_merge($conditions, ['category_id' => $id]);
            $category_id = $id;
        }
        if ($position == 2) {
            $conditions = array_merge($conditions, ['subcategory_id' => $id]);
            $subcategory_id = $id;
            $subcategory = DB::table('sub_categories')->where('id', $id)->first();
            $category_id = $subcategory->category_id;
        }
        if ($position == 3) {
            $conditions = array_merge($conditions, ['sub_subcategory_id' => $id]);
            $sub_subcategory_id = $id;
            $sub_subcategory = DB::table('sub_sub_categories')->where('id', $id)->first();
            $category_id = $sub_subcategory->category_id;
            $subcategory_id = $sub_subcategory->subcategory_id;
        }
        if (DB::table('attributes')->where($conditions)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create attribute'], 422);
        }
        $insert = DB::table('attributes')->insertGetId([
            'name' => $request->name,
            'value' => json_encode($request->value),
            'category_id' => $category_id,
            'subcategory_id' => $subcategory_id,
            'sub_subcategory_id' => $sub_subcategory_id,
            'cat_position' => $position,
        ]);

        $data = DB::table('attributes')->where('id', $insert)->first();
        $data->value = json_decode($data->value);
        return (array)$data;
    }

    public function storeValue(Request $request, $position, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'value' => 'required',
        ]);
        $conditions = ['name' => $request->name];
        if ($position == 1) {
            $conditions = array_merge($conditions, ['category_id' => $id]);
        }
        if ($position == 2) {
            $conditions = array_merge($conditions, ['subcategory_id' => $id]);
        }
        if ($position == 3) {
            $conditions = array_merge($conditions, ['sub_subcategory_id' => $id]);
        }
        $data = DB::table('attributes')->where($conditions)->first();

        $value = json_decode($data->value);
        if (in_array($request->value, $value)) {
            return response()->json(['result' => 'Error', 'message' => 'This value already used to create attribute'], 422);
        }
        array_push($value, $request->value);

        DB::table('attributes')->where('id', $data->id)->update([
            'value' => json_encode($value),
        ]);

        $data = DB::table('attributes')->where('id', $data->id)->first();
        $data->value = json_decode($data->value);
        return (array)$data;
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
        ]);
        $conditions = [];
        $attribute = DB::table('attributes')->where('id', $id)->first();
        $category_id = $attribute->category_id;
        $subcategory_id = $attribute->subcategory_id;
        $sub_subcategory_id = $attribute->sub_subcategory_id;
        if ($category_id) array_merge($conditions, ['category_id' => $category_id]);
        if ($subcategory_id) array_merge($conditions, ['subcategory_id' => $subcategory_id]);
        if ($sub_subcategory_id) array_merge($conditions, ['sub_subcategory_id' => $sub_subcategory_id]);

        if (DB::table('attributes')->where($conditions)->where('id', '!=', $id)->where('name', $request->name)->first()) {
            return response()->json(['result' => 'Error', 'message' => 'This name already used to create attribute'], 422);
        }
        DB::table('attributes')->where('id', $id)->update([
            'name' => $request->name,
            'value' => json_encode($request->value),
        ]);

        $data = DB::table('attributes')->where('id', $id)->first();
        $data->value = json_decode($data->value);
        return (array)$data;
    }

    public function destroy($id)
    {
        DB::table('attributes')->where('id', $id)->delete();
    }
}
