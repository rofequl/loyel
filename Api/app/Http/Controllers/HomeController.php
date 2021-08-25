<?php

namespace App\Http\Controllers;


use App\Model\Brand;
use App\Model\HomeSetup;
use App\Model\Product;
use App\Traits\FileUpload;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HomeController extends Controller
{
    use FileUpload;

    public function topBrand(Request $request): int
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = HomeSetup::all()->first();
        $general->top_brand = $data;
        $general->save();
        return $data;
    }

    public function featuredSeller(Request $request): int
    {
        $this->validate($request, [
            'active' => 'required',
        ]);
        $request->active === 1 ? $data = 1 : $data = 0;
        $general = HomeSetup::all()->first();
        $general->featured_seller = $data;
        $general->save();
        return $data;
    }

    public function featuredShopList()
    {
        if($this->general()->seller_verify === 0)
        return DB::table('shops')->join('users', 'users.id', '=', 'shops.user_id')
            ->where('users.seller_id')->select('users.seller_id as seller_id', 'shops.*')->get();
    }

    public function index()
    {
        $home = HomeSetup::all()->first();
        if (!$home) {
            $home = new HomeSetup();
            $home->home_slider = '';
            $home->save();
        }
        $flash_deal = collect();
        $deal = DB::table('flash_deals')->where('status', 1)->get();
        foreach ($deal as $dealing) {
            if ($dealing->expired == 1 && $dealing->expired_date >= date('Y-m-d')) {
                $flash_deal->push([
                    'title' => $dealing->title,
                    'banner' => $dealing->banner,
                    'slug' => $dealing->slug,
                ]);
            }
            if ($dealing->expired == 2) {
                $flash_deal->push([
                    'title' => $dealing->title,
                    'banner' => $dealing->banner,
                    'slug' => $dealing->slug,
                ]);
            }
        }
        $brand = DB::table('brands')->where('top', '!=', null)->orderByRaw('ISNULL(top), top ASC')->get();

        $home['deal'] = $flash_deal;
        $home['top_brands'] = $brand;
        return $home;
    }

    public function sliderStore(Request $request): array
    {
        $this->validate($request, [
            'imageList' => 'required',
        ]);
        $home = HomeSetup::all()->first();
        $photos = [];
        foreach ($request->imageList as $image) {
            if (strlen($image) > 200) {
                $photo = $this->saveImagesDWH($image, 'upload/home/slider/', 920, 350);
                array_push($photos, $photo);
            } else {
                foreach (json_decode($home->home_slider) as $pho) {
                    if (strpos($image, $pho)) {
                        array_push($photos, $pho);
                    }
                }
            }
        }
        $home->home_slider = json_encode($photos);
        $home->save();
        return $photos;
    }

    public function brandListing(Request $request)
    {
        DB::table('brands')->update(['top' => null]);
        for ($i = 1; $i <= count($request->brand_list); $i++) {
            DB::table('brands')->where('id', $request->brand_list[$i - 1])->update(['top' => $i]);
        }
        return response()->json(['result' => 'Success', 'message' => 'Brand has been listing'], 200);
    }

    public function search(Request $request)
    {
        $this->validate($request, [
            'keyword' => 'required',
        ]);
        $search = $request->keyword;
        $result = [];
        $keywords = array();
        $products = DB::table('products')->where('published', 1)->where('tags', 'like', '%' . $search . '%')
            ->inRandomOrder()->get()->take(20);
        foreach ($products as $product) {
            foreach (json_decode($product->tags) as $tag) {
                if (stripos($tag, $search) !== false) {
                    if (sizeof($keywords) > 5) {
                        break;
                    } else {
                        if (!in_array(strtolower($tag), $keywords)) {
                            array_push($keywords, strtolower($tag));
                        }
                    }
                }
            }
        }

        $product = DB::table('products')->where('published', 1)->where('name', 'like', '%' . $search . '%')
            ->select('id')->inRandomOrder()->get()->take(3);
        $product_list = collect();
        foreach ($product as $products) {
            $product_details = $this->productInfo($products->id);
            $product_list->push($product_details);
        }

        $categories = DB::table('categories')->where('name', 'like', '%' . $search . '%')
            ->orWhere('name_bd', 'like', '%' . $search . '%')
            ->select('name', 'name_bd', 'slug')->inRandomOrder()->get()->take(3);

        $shop = DB::table('shops')->where('shop_name', 'like', '%' . $search . '%')
            ->select('shop_name', 'id', 'shop_logo', 'shop_description')->inRandomOrder()->get()->take(3);

        if (sizeof($keywords) > 0 || sizeof($categories) > 0 || sizeof($product_list) > 0 || sizeof($shop) > 0) {
            $result['keywords'] = $keywords;
            $result['products'] = $product_list;
            $result['categories'] = $categories;
            $result['shop'] = $shop;
        }
        return $result;
    }
}
