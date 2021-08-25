<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use phpDocumentor\Reflection\Types\Null_;

class FlashDealController extends Controller
{
    use FileUpload;
    use Slug;

    public function index()
    {
        return DB::table('flash_deals')->get();
    }

    public function show($id)
    {
        $flash = (array)DB::table('flash_deals')->where('slug', $id)->first();
        if (!$flash) return response()->json("Not Found", 404);
        $flash['product'] = DB::table('flash_deal_products')->join('products', 'products.id', '=', 'flash_deal_products.product_id')
            ->where('flash_deal_products.flash_deal_id', $flash['id'])->select('products.name as name', 'products.thumbnail_img as image', 'flash_deal_products.*')->get();
        return $flash;
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|max:100',
        ]);
        $banner = '';
        if ($request->banner != '') {
            $banner = $this->saveImagesWH($request, 'banner', 'upload/marketing/deal/', 500, 500);
        }
        $slug = $this->slugText($request, 'title');
        $insert = DB::table('flash_deals')->insertGetId([
            'title' => $request->title,
            'banner' => $banner,
            'expired' => $request->expired ? 1 : 2,
            'expired_date' => $request->expired_date ? $request->expired_date : Null,
            'slug' => $slug,
        ]);

        foreach ($request->product as $product) {
            DB::table('flash_deal_products')->insert([
                'flash_deal_id' => $insert,
                'product_id' => $product['id'],
                'discount' => $product['discount'] ? 1 : 2,
                'discount_value' => $product['discount_value'],
                'discount_type' => $product['discount_type'],
            ]);
        }
        return (array)DB::table('flash_deals')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'title' => 'required|max:100',
        ]);
        $banner = '';
        $flash = (array)DB::table('flash_deals')->where('id', $id)->first();
        if ($request->banner != '' && strlen($request->banner) > 200) {
            if ($flash['banner'] != '') {
                File::delete(base_path('public/' . $flash['banner']));
            }
            $banner = $this->saveImagesWH($request, 'banner', 'upload/marketing/deal/', 500, 500);
        } else $banner = $flash['banner'];

        DB::table('flash_deals')->where('id', $id)->update([
            'title' => $request->title,
            'banner' => $banner,
            'expired' => $request->expired ? 1 : 2,
            'expired_date' => $request->expired_date ? $request->expired_date : Null,
        ]);
        DB::table('flash_deal_products')->where('flash_deal_id', $id)->delete();
        foreach ($request->product as $product) {
            DB::table('flash_deal_products')->insert([
                'flash_deal_id' => $id,
                'product_id' => $product['id'],
                'discount' => $product['discount'] ? 1 : 2,
                'discount_value' => $product['discount_value'],
                'discount_type' => $product['discount_type'],
            ]);
        }
        return (array)DB::table('flash_deals')->where('id', $id)->first();
    }

    public function searchProduct(Request $request)
    {
        $search = $request->input('product');
        if ($search != null) {
            return DB::table('products')->select('id', 'name', 'thumbnail_img', 'sku')
                ->where('name', 'like', '%' . $search . '%')
                ->orWhere('sku', 'like', '%' . $search . '%')->take(5)->get();
        } else {
            return [];
        }
    }

    public function dealActive(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('flash_deals')
            ->where('id', $request->id)
            ->update([
                'status' => (int)$request->active,
            ]);
    }

    public function destroy($id)
    {
        DB::table('flash_deal_products')->where('flash_deal_id', $id)->delete();
        DB::table('flash_deals')->where('id', $id)->delete();
    }

    public function dealProductList($id)
    {
        $flash = (array)DB::table('flash_deals')->where('slug', $id)->first();
        if (!$flash) return response()->json("Not Found", 404);
        $product_list = collect();
        $product = DB::table('flash_deal_products')->select('product_id')->get();
        foreach ($product as $products) {
            $product_details = $this->productInfo($products->product_id, $this->dealProduct($products->product_id));
            $product_list->push($product_details);
        }
        $flash['product'] = $product_list;
        return $flash;
    }
}
