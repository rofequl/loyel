<?php

namespace App\Http\Controllers;

use App\Model\Product;
use App\Traits\ApiResponse;
use App\Traits\FileUpload;
use App\Traits\Notification;
use App\Traits\Slug;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Auth;

class ProductController extends Controller
{
    use ApiResponse;
    use FileUpload;
    use Slug;
    use Notification;

    public function index()
    {
        return DB::table('products')->where('added_by', 'admin')->select('id', 'name', 'thumbnail_img', 'slug', 'featured', 'published')
            ->orderBy('id', "DESC")->get();
    }

    public function sellingProduct()
    {
        return DB::table('products')->where('added_by', 'seller')->select('id', 'name', 'thumbnail_img', 'slug', 'featured', 'published')
            ->orderBy('id', "DESC")->get();
    }

    public function show($slug)
    {
        $result = $this->getProductDetails($slug);
        if (array_key_exists('result', $result)) {
            return response()->json($result, 404);
        }
        return response()->json($result);
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:250',
            'thumbnail_img' => 'required',
        ]);

        $photos = [];
        $attribute = [];
        $thumbnail = $this->saveImagesWH($request, 'thumbnail_img', 'upload/product/thumbnail/', 450, 500);
        if ($request->photos != '') {
            foreach ($request->photos as $photo) {
                $image = $this->saveImagesDWH($photo, 'upload/product/photos/', 450, 450);
                array_push($photos, $image);
            }
        }
        if ($request->attribute) {
            foreach ($request->attribute_option as $att) {
                if (count($att['value']) > 0) {
                    array_push($attribute, ['name' => $att['label'], 'value' => $att['value']]);
                }
            }
        }
        $colors = [];
        if ($request->color_image) {
            foreach ($request->color as $photo) {
                if ($photo['image'] !== '') {
                    $image = $this->saveImagesDWH($photo['image'], 'upload/product/photos/', 450, 450);
                    $image = [
                        'name' => $photo['name'],
                        'image' => $image,
                    ];
                    array_push($colors, $image);
                }
            }
        }
        $slug = $this->slugText($request, 'name');
        $insert = DB::table('products')->insertGetId([
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id ? $request->subcategory_id : Null,
            'sub_subcategory_id' => $request->sub_subcategory_id ? $request->sub_subcategory_id : Null,
            'cat_position' => $request->cat_position,
            'name' => $request->name,
            'added_by' => $request->added_by,
            'user_id' => Auth::user()->id,
            'brand_id' => $request->brand_id ? $request->brand_id : Null,
            'unit_id' => $request->unit_id ? $request->unit_id : Null,
            'Refundable' => $request->Refundable ? 1 : 2,
            'weight' => $request->weight,
            'tags' => json_encode($request->tags),
            'dimension' => $request->dimension,
            'product_type' => $request->product_type,
            'attribute' => $request->attribute ? 1 : 2,
            'attribute_option' => json_encode($attribute),
            'photos' => json_encode($photos),
            'thumbnail_img' => $thumbnail,
            'video_link' => $request->video_link,
            'description' => $request->description,
            'color_image' => $request->color_image ? 1 : 2,
            'color' => $request->color_image ? json_encode($colors) : json_encode($request->color),
            'qty_manage' => $request->qty_manage ? 1 : 2,
            'min_qty' => (int)$request->min_qty,
            'max_qty' => (int)$request->max_qty,
            'price_type' => $request->price_type,
            'stock_manage' => $request->stock_manage,
            'quantity' => (int)$request->quantity,
            'price' => $request->price,
            'discount' => $request->discount ? 1 : 2,
            'discount_value' => $request->discount_value,
            'discount_type' => $request->discount_type,
            'discount_method' => $request->discount_method,
            'warranty_type' => $request->warranty_type,
            'warranty_period' => $request->warranty_period,
            'shipping' => $request->shipping ? 2 : 1,
            'shipping_cost' => $request->shipping_cost,
            'slug' => $slug,
            'sku' => $this->sku(),
        ]);

        if ($request->discount && $request->discount_method === 2) {
            foreach ($request->tier_discount as $dis) {
                DB::table('discount_variations')->insert([
                    'product_id' => $insert,
                    'percent_off' => $dis['value'],
                    'min_qty' => $dis['unit'],
                ]);
            }
        }

        if ($request->price_type == 2) {
            foreach ($request->price_option as $price) {
                DB::table('product_stocks')->insert([
                    'product_id' => $insert,
                    'variant' => json_encode($price['variant']),
                    'price' => $price['variant_price'],
                    'qty' => $price['quantity'],
                    'sku' => $this->sku(),
                ]);
            }
        }

        if ($request->price_type == 3) {
            foreach ($request->tier_price as $price) {
                DB::table('price_variations')->insert([
                    'product_id' => $insert,
                    'price' => $price['value'],
                    'min_qty' => $price['min_unit'],
                    'max_qty' => $price['max_unit'],
                ]);
            }
        }
        $message = Auth::user()->name . ' upload a new product. Seller Id: ' . Auth::user()->seller_id;
        if ($request->added_by == 'seller') {
            $this->notification($message, 'admin', '0');
        }
        return (array)DB::table('products')->where('id', $insert)->select('id', 'name', 'thumbnail_img', 'slug', 'featured')->first();
    }

    public function update(Request $request, $id)
    {
        //membership plan
    }

    public function destroy($id)
    {
        DB::table('products')->where('id', $id)->delete();
        DB::table('product_stocks')->where('product_id', $id)->delete();
        DB::table('price_variations')->where('product_id', $id)->delete();
        DB::table('discount_variations')->where('product_id', $id)->delete();
    }

    public function featuredIndex()
    {
        $product_list = collect();
        $product = DB::table('products')->select('id', 'featured')->where('published', 1)->orderBy('featured', 'DESC')->orderBy('id', 'DESC')
            ->paginate(30);
        foreach ($product as $products) {
            $product_details = $this->productInfo($products->id);
            $product_list->push($product_details);
        }
        return $product_list;
    }

    public function featured(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('products')
            ->where('id', $request->id)
            ->update([
                'featured' => (int)$request->active,
            ]);

        $product = DB::table('products')->find($request->id);
        if ($product->added_by == "seller") {
            $general = DB::table('generals')->get()->first();
            if ((int)$request->active == 1) $message = $general->app_name . ' update your product as a featured product';
            else $message = $general->app_name . ' remove your product as a featured product';
            $this->notification($message, 'seller', $product->user_id);
        }
    }

    public function published(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('products')
            ->where('id', $request->id)
            ->update([
                'published' => (int)$request->active,
            ]);

        $product = DB::table('products')->find($request->id);
        if ($product->added_by == "seller") {
            $general = DB::table('generals')->get()->first();
            if ((int)$request->active == 1) $message = $general->app_name . ' published your product';
            else $message = $general->app_name . ' unpublished your product';
            $this->notification($message, 'seller', $product->user_id);
        }
    }

    public function productListing(Request $request)
    {
        $conditions = ['published' => 1];
        $category_id = $request->category;
        $subcategory_id = $request->subcategory;
        $subsubcategory_id = $request->subsubcategory;

        $keyword = $request->keyword;

        if ($category_id) $conditions = array_merge($conditions, ['category_id' => $category_id]);
        if ($subcategory_id) $conditions = array_merge($conditions, ['subcategory_id' => $subcategory_id]);
        if ($subsubcategory_id) $conditions = array_merge($conditions, ['sub_subcategory_id' => $subsubcategory_id]);

        $product = Product::where($conditions);

        if ($keyword) $product = $product->where('name', 'like', '%' . $keyword . '%');

        $product_list = collect();
        foreach ($product->get() as $products) {
            $product_details = $this->productInfo($products->id);
            $product_list->push($product_details);
        }

        return ['product_details' => $product_list];
    }

    public function getProductDetails($slug)
    {
        $result = [];
        $product = Product::where('slug', $slug)->first();
        if ($product) {
            $position = $product->cat_position;
            $category = $product->category_id ? DB::table('categories')->where('id', $product->category_id)->first() : '';
            $subcategory = $product->subcategory_id ? DB::table('sub_categories')->where('id', $product->subcategory_id)->first() : '';
            $subsubcategory = $product->sub_subcategory_id ? DB::table('sub_sub_categories')->where('id', $product->sub_subcategory_id)->first() : '';
            $brand = $product->brand_id ? DB::table('brands')->where('id', $product->brand_id)->first() : '';
            $unit = $product->unit_id ? DB::table('units')->where('id', $product->unit_id)->first() : '';
            $discount = [];
            // 0 = No discount 1 = Trade Discount 2 = Quantity Discount 3 = Deal Discount
            if ($this->dealProduct($product->id)) {
                $discount['type'] = 3;
                $discount['details'] = $this->dealProduct($product->id);
            } elseif ($product->discount === 1) {
                if ($product->discount_method === 1) {
                    $product_discount = [];
                    $product_discount['discount_value'] = $product->discount_value;
                    $product_discount['discount_type'] = $product->discount_type;
                    $discount['type'] = 1;
                    $discount['details'] = $product_discount;
                } else {
                    $discount['type'] = 2;
                    $discount['details'] = DB::table('discount_variations')->where('product_id', $product->id)->get();
                }
            } else $discount['type'] = 0;
            $price = [];
            if ($product->price_type == 1) {
                $price['method'] = $product->price_type;
                $price['value'] = $product->price;
            } elseif ($product->price_type == 2) {
                $price['method'] = $product->price_type;
                $price['stock'] = $product->product_stock;
            } else {
                $price['method'] = $product->price_type;
                $price['variation'] = $product->price_variation;
            }

            $color = [];
            if (!empty(json_decode($product->color))) $color['condition'] = 1;
            else $color['condition'] = 2;
            $color['type'] = $product->color_image;
            $color['option'] = json_decode($product->color);


            $attribute = [];
            $attribute['condition'] = $product->attribute;
            $option = [];
            $decodeAttribute = json_decode($product->attribute_option);
            foreach ($decodeAttribute as $attributes) {
                array_push($option, ['name' => $attributes->name, 'value' => $attributes->value, 'result' => '']);
            }
            $attribute['option'] = $option;

            $quantity = [];
            $quantity['stock'] = (int)$product->stock_manage;
            if ($product->stock_manage == 2) {
                if ($product->price_type == 2) {
                    $quantity['total'] = (int)$product->product_stock->sum('qty');
                } else {
                    $quantity['total'] = (int)$product->quantity;
                }
            } else $quantity['total'] = 99999999999;
            if ($product->qty_manage == 1) {
                $quantity['min_qty'] = (int)$product->min_qty;

                if ($product->price_type == 2) $quantity['max_qty'] = (int)$product->max_qty;
                else $quantity['max_qty'] = $product->max_qty > $product->quantity ? (int)$product->quantity : (int)$product->max_qty;


            } else {
                $quantity['min_qty'] = 1;
                $quantity['max_qty'] = (int)$quantity['total'];
            }

            $wishlist = [];
            $wishlist_all = $product->wishlist === null ? [] : $product->wishlist;
            $wishlist['total'] = count($wishlist_all);
            if (Auth::user()) $wishlist['active'] = in_array(Auth::user()->id, $wishlist_all);
            else $wishlist['active'] = false;

            $seller = [];
            $seller_info = DB::table('users')->where('id', $product->user_id)->first();
            $seller['added_by'] = $product->added_by;
            if ($product->added_by == 'seller') $seller['seller_id'] = $seller_info->seller_id;
            else $seller['seller_id'] = '';


            $result = ['category' => $category, 'subcategory' => $subcategory, 'subsubcategory' => $subsubcategory, 'unit' => $unit,
                'brand' => $brand, 'position' => $position, 'slug' => $product->slug, 'id' => $product->id, 'name' => $product->name,
                'main_image' => $product->thumbnail_img, 'caro_image' => json_decode($product->photos), 'condition' => $product->product_type,
                'weight' => $product->weight, 'dimension' => $product->dimension, 'discount' => $discount, 'price' => $price,
                'color' => $color, 'attribute' => $attribute, 'description' => $product->description, 'quantity' => $quantity, 'sku' => $product->sku,
                'wishlist' => $wishlist, 'seller' => $seller];
        } else {
            $result = ['result' => 'Error', 'message' => 'Product not found'];
        }
        return $result;
    }

    public function multipleProduct($slug)
    {
        $data = [];
        $slug_list = explode(',', $slug);
        foreach ($slug_list as $slugs) {
            $product = $this->getProductDetails($slugs);
            array_push($data, $product);
        }
        return $data;
    }

    public function sellerProduct()
    {
        return DB::table('products')->where('user_id', Auth::user()->id)->select('id', 'name', 'thumbnail_img', 'slug', 'featured', 'published')->orderBy('id', "DESC")->get();
    }

    public function wishlistIndex()
    {
        $product_list = collect();
        $product = DB::table('products')->whereJsonContains('wishlist', Auth::user()->id)->where('published', 1)->select('id')->get();
        foreach ($product as $products) {
            $product_details = $this->productInfo($products->id);
            $product_list->push($product_details);
        }
        return $product_list;
    }

    public function wishlistStore(Request $request)
    {
        $this->validate($request, [
            'action' => 'required|string',
            'slug' => 'required|string',
        ]);
        $product = Product::where('slug', $request->slug)->first();
        $wishlist = $product->wishlist === null ? [] : $product->wishlist;
        if (!in_array(Auth::user()->id, $wishlist) && $request->action == "add") {
            array_push($wishlist, Auth::user()->id);
            DB::table('products')->where('id', $product->id)->update(['wishlist' => json_encode($wishlist)]);
        } elseif (in_array(Auth::user()->id, $wishlist) && $request->action == "remove") {
            $key = array_search(Auth::user()->id, $wishlist);
            unset($wishlist[$key]);
            DB::table('products')->where('id', $product->id)->update(['wishlist' => json_encode($wishlist)]);
        } else {
            return "Error";
        }
        $product = Product::where('slug', $request->slug)->first();
        $my_wishlist = DB::table('products')->whereJsonContains('wishlist', Auth::user()->id)->get()->count();
        $wishlist_all = $product->wishlist === null ? [] : $product->wishlist;
        $product_wishlist = count($wishlist_all);

        return ['active' => in_array(Auth::user()->id, $wishlist_all), 'my_wishlist' => $my_wishlist, 'total' => $product_wishlist];

    }

    public function shopDetails($id)
    {
        $shop = [];
        $shop_details = DB::table('shops')->where('id', $id)->first();
        if ($shop_details) {
            $shop['shop_details'] = $shop_details;
            $product_list = collect();
            $product = DB::table('products')->where('user_id', $shop_details->user_id)->where('published', 1)->select('id')->get();
            foreach ($product as $products) {
                $product_details = $this->productInfo($products->id);
                $product_list->push($product_details);
            }
            $shop['all_product'] = $product_list;
            return $shop;
        } else return $this->errorResponse('error', '', 422);

    }
}
