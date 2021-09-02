<?php

namespace App\Http\Controllers\Auth;

use App\Model\User;
use App\Model\UserVerification;
use App\Traits\ApiResponse;
use App\Traits\FileUpload;
use App\Traits\Notification;
use App\Traits\Slug;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Helper\CommonHelper;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Rules\MatchOldPassword;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class CustomerController extends Controller
{
    use FileUpload;
    use ApiResponse;
    use Slug;
    use Notification;

    public function userCheck(Request $request)
    {
        $this->validate($request, [
            'emailOrMobile' => 'required',
        ]);

        $regMedium = filter_var($request->emailOrMobile, FILTER_VALIDATE_EMAIL) ? 'email' : 'phone';

        $email = $regMedium == 'email' ? $request->emailOrMobile : null;
        $phone = $regMedium == 'email' ? null : $request->emailOrMobile;

        try {
            if ($email) {
                $check = User::where('email', $email)->where('user_type', '!=', 1)->first();
                if ($check) {
                    return ['type' => 'email', 'transfer' => 'login', 'user_type' => $check->user_type];
                }
                return ['type' => 'email', 'transfer' => 'register', 'user_type' => ''];
            }
            if ($phone) {
                $number = $this->phone_number($phone);
                if (!$number) {
                    return $this->errorResponse('Invalid email and phone number');
                }
                $check = User::where('mobile', $number)->where('user_type', '!=', 1)->first();
                if ($check) {
                    return ['type' => 'phone', 'transfer' => 'login', 'user_type' => $check->user_type];
                }
                return ['type' => 'phone', 'transfer' => 'register', 'user_type' => ''];
            }
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage());
        }
    }

    public function register(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required',
            'password' => 'required',
            'otp' => 'required',
            'mobile' => 'required',
            'reg_type' => 'required',
        ]);

        $email = $request->email;
        $phone = $request->mobile;
        $number = $this->phone_number($phone);
        if (!$number) {
            return $this->errorResponse('Invalid email and phone number');
        }
        $username = $this->username($request->name);
        try {

            if ($this->checkOtpSent($email) == 0) {
                return $this->errorResponse('Your OTP has been expired..');
            }
            $search = UserVerification::where('account_details', $email)->where('code', $request->otp)
                ->where('is_verified', 0)->first();
            if (!$search) {
                return $this->errorResponse('OTP did not match try again..');
            }
            $search->delete();

            $total_user = rand(10000, 99999) . User::all()->count();
            $customer = 'CUS' . $total_user;
            $seller = 'SEL' . $total_user;

            $user = new User();
            $user->user_type = $request->reg_type;
            $user->name = $request->name;
            $user->email = $email;
            $user->email_verify = 1;
            $user->mobile = $number;
            $user->username = $username;
            $user->seller_id = $seller;
            $user->customer_id = $customer;
            $user->password = Hash::make($request->password);
            $user->save();

            DB::table('financials')->insert(['user_id' => $user->id,]);

            if ($request->reg_type === 2 || $request->reg_type === 3) {
                DB::table('shops')->insert(['user_id' => $user->id, 'shop_name' => $user->name]);
                DB::table('shop_addresses')->insert(['user_id' => $user->id,]);
            }
            $message = $request->reg_type === 2 ? 'seller' : 'customer';
            $message = $user->name . ' create a new ' . $message . ' account';
            $this->notification($message, 'admin', '0');

            $token = JWTAuth::fromUser($user);
            return $this->respondWithToken($token);
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage());
        }
    }

    public function login(Request $request)
    {

        $this->validate($request, [
            'emailOrMobile' => 'required|string',
            'password' => 'required|string',
        ]);

        $regMedium = filter_var($request->emailOrMobile, FILTER_VALIDATE_EMAIL) ? 'email' : 'phone';

        $email = $regMedium == 'email' ? $request->emailOrMobile : null;
        $phone = $regMedium == 'email' ? null : $request->emailOrMobile;
        try {
            if ($email) {
                $request['email'] = $email;
                $credentials = $request->only(['email', 'password']);
                $user_type = User::where('email', $email)->where('user_type', '!=', 1)->first()->user_type;
            }

            if ($phone) {
                $number = $this->phone_number($phone);
                if (!$number) {
                    return $this->errorResponse('Invalid email and phone number');
                }
                $request['mobile'] = $number;
                $credentials = $request->only(['mobile', 'password']);
                $user_type = User::where('mobile', $number)->where('user_type', '!=', 1)->first()->user_type;
            }


            $credentials['user_type'] = $user_type;
            if (!$token = Auth::attempt($credentials)) {
                return $this->errorResponse('Email and password are not match', '', 401);
            }

            return $this->respondWithToken($token);

        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage());
        }

    }

    public function profileUpdate(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string',
        ]);

        $photo = Auth::user()->photo;
        $photo_type = Auth::user()->photo_type;
        if ($request->photo != '' && strlen($request->photo) > 200) {
            if ($photo !== 'image/user/user.png' && Auth::user()->photo_type === 0) {
                File::delete(base_path('public/' . $photo));
            }
            $photo = $this->saveImagesWH($request, 'photo', 'upload/user/profile/', 512, 512);
            $photo_type = 0;
        }

        $user = Auth::user();
        $user->name = $request->name;
        $user->gender = $request->gender;
        $user->birthday = $request->birthday;
        $user->photo = $photo;
        $user->photo_type = $photo_type;
        $user->save();
    }

    public function mailUpdate(Request $request)
    {
        if ($request->email) {
            $this->validate($request, [
                'email' => 'required',
                'otp' => 'required',
            ]);
            $search = UserVerification::where('account_details', $request->email)->where('code', $request->otp)
                ->where('is_verified', 0)->first();
            if (!$search) {
                return response()->json(['message' => 'Invalid verification code..'], 422);
            }

            if ($this->checkOtpSent($request->email) == 0) {
                return $this->errorResponse('Your OTP has been expired..');
            }

            $search->delete();

            $user = Auth::user();
            $user->email = $request->email;
            $user->save();
        }
    }

    public function numberUpdate(Request $request)
    {
        if ($request->mobile) {
            $this->validate($request, [
                'mobile' => 'required',
                'otp' => 'required',
            ]);
            $number = $this->phone_number($request->mobile);
            if (!$number) {
                return $this->errorResponse('Invalid phone number');
            }
            $search = UserVerification::where('account_details', $number)->where('code', $request->otp)
                ->where('is_verified', 0)->first();
            if (!$search) {
                return response()->json(['message' => 'Invalid verification code..'], 422);
            }

            if ($this->checkOtpSent($number) == 0) {
                return $this->errorResponse('Your OTP has been expired..');
            }
            $search->delete();
            $user = Auth::user();
            $user->mobile = $number;
            $user->mobile_verify = 1;
            $user->save();
        }
    }

    public function customerLogin(Request $request)
    {

        $this->validate($request, [
            'id' => 'required',
        ]);
        if (Auth::user()->id == $request->id) {
            $user = Auth::user();
            $user->user_type = 3;
            $user->save();
            return $this->successResponse('Successfully');
        }
        return $this->errorResponse('Invalid account');
    }

    public function sellerLogin(Request $request)
    {

        $this->validate($request, [
            'id' => 'required',
        ]);
        if (Auth::user()->id == $request->id) {
            $user = Auth::user();
            $user->user_type = 3;
            $user->save();

            DB::table('shops')->insert(['user_id' => $user->id, 'shop_name' => $user->name,]);
            DB::table('shop_addresses')->insert(['user_id' => $user->id,]);

            return $this->successResponse('Successfully');
        }
        return $this->errorResponse('Invalid account');
    }

    public function profile(): JsonResponse
    {
        $user = Auth::user();
        if ($user !== null) {
            if ($user->user_type === 2 || $user->user_type === 3) {
                $store = DB::table('shops')->where('user_id', $user->id)->first();
                $financial = DB::table('financials')->where('user_id', $user->id)->first();
                $contact = DB::table('shop_addresses')->where('user_id', $user->id)->first();
                if ($store->category_id) $store->category = DB::table('categories')->where('id', $store->category_id)->first()->name;
                else $store->category = '';

                $business_type = [];
                $business_type_id = DB::table('user_business_types')->where('user_id', Auth::user()->id)->get();
                foreach ($business_type_id as $business_types) {
                    array_push($business_type, DB::table('business_types')->where('id', $business_types->business_type_id)->first()->name);
                }
                $store->business_type = $business_type;

                if ($contact->region_id) $contact->region = DB::table('regions')->where('id', $contact->region_id)->first()->name;
                else $contact->region = '';
                if ($contact->city_id) $contact->city = DB::table('cities')->where('id', $contact->city_id)->first()->name;
                else $contact->city = '';
                if ($contact->area_id) $contact->area = DB::table('areas')->where('id', $contact->area_id)->first()->name;
                else $contact->area = '';

                $step = 0;
                $complete_step = [1, 2, 3];
                if ($store->category_id == null || $store->shop_name == null || $store->shop_logo == null) {
                    unset($complete_step[array_search(2, $complete_step)]);
                    $step += 1;
                }
                if ($financial->id_type == null || $financial->id_code == null || $financial->bank_name == null || $financial->bank_account_number == null) {
                    unset($complete_step[array_search(3, $complete_step)]);
                    $step += 1;
                }
                if ($contact->city_id == null || $contact->address == null) {
                    unset($complete_step[array_search(1, $complete_step)]);
                    $step += 1;
                }
                $store->details = ['step' => $step, 'complete_step' => $complete_step];
            } else {
                $store = [];
                $financial = DB::table('financials')->where('user_id', $user->id)->first();
                $contact = [];
            }
            $notification['total'] = DB::table('notifications')->where('user_id', Auth::user()->id)->where('status', 0)->get()->count();
            $notification['list'] = DB::table('notifications')->where('user_id', Auth::user()->id)->get()->take(5);
            $wishlist = DB::table('products')->whereJsonContains('wishlist', Auth::user()->id)->get()->count();
            $user->seller_verify === 1 || $this->general()->seller_verify === 0 ? $user->seller_access = 'Yes' : $user->seller_access = 'No';
            return response()->json(['user' => $user, 'store' => $store, 'financial' => $financial, 'contact' => $contact, 'wishlist' => $wishlist,
                'notification' => $notification]);
        } else return $this->errorResponse('', '', 401);
    }

    public function logout(): JsonResponse
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function passwordChange(Request $request)
    {
        $this->validate($request, [
            'old_password' => ['required', new MatchOldPassword],
            'password' => ['required'],
            'confirm' => ['same:password'],
        ]);

        $obj_user = User::find(auth()->user()->id);
        $obj_user->password = Hash::make($request->password);
        $obj_user->save();
    }

    public function sendOTP(Request $request)
    {
        $this->validate($request, [
            'emailOrMobile' => 'required',
            'name' => 'required',
        ]);

        $regMedium = filter_var($request->emailOrMobile, FILTER_VALIDATE_EMAIL) ? 'email' : 'phone';

        $email = $regMedium == 'email' ? $request->emailOrMobile : null;
        $phone = $regMedium == 'email' ? null : $request->emailOrMobile;
        try {
            $verification_code = CommonHelper::generateOTP(6);
            if ($email && env('MAIL_USERNAME') != null) {
                $check = User::where('email', $email)->first();
                if ($check) {
                    return $this->errorResponse('This email already used try another');
                }
                $subject = "Verify your email address.";
                $name = $request->name;
                $general = DB::table('generals')->get()->first();
                Mail::send('email.verify', ['name' => $name, 'verification_code' => $verification_code, 'general' => $general],
                    function ($mail) use ($email, $subject, $general) {
                        $mail->from(env('MAIL_USERNAME'), $general->app_name);
                        $mail->to($email)->subject($subject);
                    });
                $this->saveVerify($email, $verification_code);
                return $this->successResponse('An OTP sent to your mail. Please use this OTP');
            }

            if ($phone) {
                $number = $this->phone_number($phone);
                if (!$number) {
                    return $this->errorResponse('Invalid email and phone number');
                }
                if (Auth::user()) $check = User::where('mobile', $number)->where('id', '!=', Auth::user()->id)->first();
                else $check = User::where('mobile', $number)->first();

                if ($check) {
                    return $this->errorResponse('This number already used try another');
                }
                $this->sendMessage($number, $verification_code);

                $this->saveVerify($number, $verification_code);

                return $this->successResponse('An OTP sent to your number. Please use this OTP');
            }

            return $this->errorResponse('OTP sending failed');
        } catch (\Exception $e) {
            return $this->errorResponse($e->getMessage());
        }
    }

    public function checkOtpSent($account_details)
    {
        $response = 0;
        $nowDate = date('Y-m-d');
        $data = UserVerification::whereDate('updated_at', '=', $nowDate)
            ->where('account_details', $account_details)->where('is_verified', 0)->first();
        if (!empty($data)) {
            $nowDate = date('Y-m-d H:i:s');
            $date1 = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $data->updated_at)->timestamp;
            $date2 = \Carbon\Carbon::createFromFormat('Y-m-d H:i:s', $nowDate)->timestamp;
            $diff = $date2 - $date1;
            if ($diff < 125) {
                $response = 1;
            }
        }
        return $response;
    }

    public function sendMessage($number, $otp)
    {
        $message = 'Please enter the following code ' . $otp . ' to verify your account.';
        $post_url = 'https://api.mobireach.com.bd/SendTextMessage';
        $post_values = array(
            'Username' => env('MOBIREACH_USER'),
            'Password' => env('MOBIREACH_PASS'),
            'From' => env('MOBIREACH_FROM'),
            'To' => $number,
            'Message' => $message
        );

        $post_string = "";
        foreach ($post_values as $key => $value) {
            $post_string .= "$key=" . urlencode($value) . "&";
        }
        $post_string = rtrim($post_string, "& ");

        $request = curl_init($post_url);
        curl_setopt($request, CURLOPT_HEADER, 0);
        curl_setopt($request, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($request, CURLOPT_POSTFIELDS, $post_string);
        curl_setopt($request, CURLOPT_SSL_VERIFYPEER, FALSE);
        $post_response = curl_exec($request);
        curl_close($request);
    }

    public function saveVerify($data, $code)
    {
        $search = UserVerification::where('account_details', $data)->first();
        if ($search) {
            $search->code = $code;
            $search->is_verified = 0;
            $search->save();
        } else {
            $insert = new UserVerification();
            $insert->account_details = $data;
            $insert->code = $code;
            $insert->save();
        }
    }

    public function customerList()
    {
        return DB::table('users')->whereIn('user_type', [0, 3])->select('id', 'name', 'photo_type', 'photo', 'status', 'customer_id',
            'email', 'mobile')->get();
    }

    public function customerDetails($code)
    {
        $result = $this->getCustomerDetails($code);
        if (array_key_exists('result', $result)) {
            return response()->json($result, 404);
        }
        return response()->json($result);
    }

    public function getCustomerDetails($code): array
    {
        $result = [];
        $customer = DB::table('users')->where('customer_id', $code)->first();
        if ($customer) {
            $result = [
                'name' => $customer->name, 'user_type' => $customer->user_type, 'customer_id' => $customer->customer_id,
                'photo' => $customer->photo, 'photo_type' => $customer->photo_type, 'email' => $customer->email,
                'mobile' => $customer->mobile, 'username' => $customer->username, 'birthday' => $customer->birthday,
                'gender' => $customer->gender, 'status' => $customer->status, 'created_at' => $customer->created_at,
                'email_verify' => $customer->email_verify, 'mobile_verify' => $customer->mobile_verify, 'seller_verify' => $customer->seller_verify,
                'order_list' => DB::table('orders')->where('user_id', $customer->id)->get(),
                'wish_list' => DB::table('products')->whereJsonContains('wishlist', $customer->id)->where('published', 1)->select('id', 'name', 'sku')->get(),
                'total_order' => DB::table('orders')->where('user_id', $customer->id)->where('delivered_status', '!=', 0)->get()->count(),
                'purchase_amount' => DB::table('orders')->where('user_id', $customer->id)->where('payment_status', 1)->get()->sum('total'),
                'address_book' => DB::table('addresses')->join('regions', 'regions.id', '=', 'addresses.region_id')
                    ->join('cities', 'cities.id', '=', 'addresses.city_id')
                    ->join('areas', 'areas.id', '=', 'addresses.area_id')
                    ->select('regions.name as region', 'cities.name as city', 'areas.name as area', 'addresses.*')->where('addresses.user_id', $customer->id)->get(),
            ];
        } else {
            $result = ['result' => 'Error', 'message' => 'Order not found'];
        }

        return $result;
    }

    public function sellerList()
    {
        return DB::table('users')->whereIn('user_type', [2, 3])->select('id', 'name', 'photo_type', 'photo', 'status', 'seller_verify', 'seller_id')->get();
    }

    public function sellerDetails($code)
    {
        $result = $this->getSellerDetails($code);
        if (array_key_exists('result', $result)) {
            return response()->json($result, 404);
        }
        return response()->json($result);
    }

    public function getSellerDetails($code): array
    {
        $result = [];
        $seller = DB::table('users')->where('seller_id', $code)->first();
        if ($seller) {
            $store = DB::table('shops')->where('user_id', $seller->id)->first();
            $business_type = [];
            $business_type_id = DB::table('user_business_types')->where('user_id', $seller->id)->get();
            foreach ($business_type_id as $business_types) {
                array_push($business_type, DB::table('business_types')->where('id', $business_types->business_type_id)->first()->name);
            }
            $store->business_type = $business_type;
            if ($store->category_id) $store->category = DB::table('categories')->where('id', $store->category_id)->first()->name;
            else $store->category = '';

            $contact = DB::table('shop_addresses')->where('user_id', $seller->id)->first();
            if ($contact->region_id) $contact->region = DB::table('regions')->where('id', $contact->region_id)->first()->name;
            else $contact->region = '';
            if ($contact->city_id) $contact->city = DB::table('cities')->where('id', $contact->city_id)->first()->name;
            else $contact->city = '';
            if ($contact->area_id) $contact->area = DB::table('areas')->where('id', $contact->area_id)->first()->name;
            else $contact->area = '';
            $result = [
                'name' => $seller->name, 'user_type' => $seller->user_type, 'seller_id' => $seller->seller_id,
                'photo' => $seller->photo, 'photo_type' => $seller->photo_type, 'email' => $seller->email,
                'mobile' => $seller->mobile, 'username' => $seller->username, 'birthday' => $seller->birthday,
                'gender' => $seller->gender, 'status' => $seller->status, 'created_at' => $seller->created_at,
                'email_verify' => $seller->email_verify, 'mobile_verify' => $seller->mobile_verify, 'seller_verify' => $seller->seller_verify,
                'store' => $store,
                'financial' => DB::table('financials')->where('user_id', $seller->id)->first(),
                'contact' => $contact,
                'total_product' => DB::table('products')->where('user_id', $seller->id)->get()->count(),
                'product_list' => DB::table('products')->where('user_id', $seller->id)->select('id', 'name', 'thumbnail_img', 'slug', 'featured', 'published')->orderBy('id', "DESC")->get(),
            ];
        } else {
            $result = ['result' => 'Error', 'message' => 'Order not found'];
        }

        return $result;
    }

    public function destroy($id)
    {
        $user = DB::table('users')->where('customer_id', $id)->first();
        $order = DB::table('orders')->where('user_id', $user->id)->first();
        if ($order) return $this->successResponse('You can\'t delete this account.', 'Error');

        if ($user->user_type === 3) {
            DB::table('users')
                ->where('id', $user->id)
                ->update([
                    'user_type' => 2,
                ]);
            DB::table('addresses')->where('user_id', $user->id)->delete();
            return $this->successResponse('Remove from customer but the seller account not remove');
        } else if ($user->user_type === 0) {
            DB::table('users')->where('id', $user->id)->delete();
            DB::table('addresses')->where('user_id', $user->id)->delete();
            DB::table('financials')->where('user_id', $user->id)->delete();
            if ($user->photo !== 'image/user/user.png') File::delete(base_path('public/' . $user->photo));
            $product = DB::table('products')->whereJsonContains('wishlist', $user->id)->get();
            foreach ($product as $products) {
                $wishlist = $products->wishlist === null ? [] : $products->wishlist;
                $key = array_search($user->id, $wishlist);
                unset($wishlist[$key]);
                DB::table('products')->where('id', $products->id)->update(['wishlist' => json_encode($wishlist)]);
            }
        }
    }
}
