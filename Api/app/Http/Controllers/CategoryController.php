<?php

namespace App\Http\Controllers;

use App\Model\Category;
use App\Model\General;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Support\Facades\File;

class CategoryController extends Controller
{

    use FileUpload;
    use Slug;

    public function index(Request $request)
    {
        return DB::table('categories')->orderByRaw('ISNULL(serial), serial ASC')->get();
    }

    public function sellerCommission(Request $request)
    {
        $colect = collect();
        $category = DB::table('categories')->select('name', 'id')->get();
        foreach ($category as $categories) {
            $subcategory = DB::table('sub_categories')->where('category_id', $categories->id)->select('name', 'id')->get();
            if ($subcategory->count() > 0) {
                foreach ($subcategory as $subcategories) {
                    $sub_subcategory = DB::table('sub_sub_categories')->where('category_id', $categories->id)
                        ->where('subcategory_id', $subcategories->id)->select('name', 'id')->get();
                    if ($sub_subcategory->count() > 0) {
                        foreach ($sub_subcategory as $sub_subcategories) {
                            $colect->push([
                                'category_id' => $categories->id,
                                'subcategory_id' => $subcategories->id,
                                'sub_subcategory_id' => $sub_subcategories->id,
                                'category_name' => $categories->name,
                                'subcategory_name' => $subcategories->name,
                                'sub_subcategory_name' => $sub_subcategories->name,
                                'position' => 3,
                                'rate' => 0
                            ]);
                        }
                    } else {
                        $colect->push([
                            'category_id' => $categories->id,
                            'subcategory_id' => $subcategories->id,
                            'sub_subcategory_id' => NULL,
                            'category_name' => $categories->name,
                            'subcategory_name' => $subcategories->name,
                            'sub_subcategory_name' => NULL,
                            'position' => 2,
                            'rate' => 0
                        ]);
                    }
                }
            } else {
                $colect->push([
                    'category_id' => $categories->id,
                    'subcategory_id' => NULL,
                    'sub_subcategory_id' => NULL,
                    'category_name' => $categories->name,
                    'subcategory_name' => NULL,
                    'sub_subcategory_name' => NULL,
                    'position' => 1,
                    'rate' => 0
                ]);
            }
        }
        return $colect;
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:categories',
            'banner' => 'required',
            'icon' => 'required',
        ]);
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }

        $banner = $this->saveImagesWH($request, 'banner', 'upload/product/category/banner/', 300, 300);
        $icon = $this->saveImagesWH($request, 'icon', 'upload/product/category/icon/', 100, 100);
        $slug = $this->slugText($request, 'name');

        $insert = DB::table('categories')->insertGetId([
            'name' => $request->name,
            'name_bd' => $request->name_bd,
            'banner' => $banner,
            'icon' => $icon,
            'slug' => $slug,
        ]);
        return Category::findOrFail($insert);
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:categories,name,' . $id,
            'banner' => 'required',
            'icon' => 'required',
        ]);
        $general = General::all()->first();
        if ($general->bangla_language == 1) {
            $this->validate($request, [
                'name_bd' => 'required',
            ]);
        }
        $category = Category::findOrFail($id);
        $category->name = $request->name;
        $category->name_bd = $request->name_bd;
        if (strlen($request->banner) > 200) {
            File::delete(base_path('public/' . $category->banner));
            $category->banner = $this->saveImagesWH($request, 'banner', 'upload/product/category/banner/', 300, 300);
        }

        if (strlen($request->icon) > 200) {
            File::delete(base_path('public/' . $category->icon));
            $category->icon = $this->saveImagesWH($request, 'icon', 'upload/product/category/icon/', 100, 100);
        }
        $category->save();
        return $category;
    }

    public function destroy($id)
    {
        $product = DB::table('products')->where('category_id', $id)->first();
        $subcategory = DB::table('sub_categories')->where('category_id', $id)->first();
        if ($product) return response()->json(['result' => 'Error', 'message' => 'Category already used create a product'], 200);
        if ($subcategory) return response()->json(['result' => 'Error', 'message' => 'Category already used create a subcategory'], 200);
        $category = Category::findOrFail($id);
        File::delete(base_path('public/' . $category->banner));
        File::delete(base_path('public/' . $category->icon));
        $category->delete();
    }

    public function serial(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'serial' => 'required',
        ]);
        DB::table('categories')->where('id', $request->id)
            ->update([
                'serial' => $request->serial,
            ]);
    }
}
