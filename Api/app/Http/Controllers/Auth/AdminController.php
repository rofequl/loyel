<?php

namespace App\Http\Controllers\Auth;

use App\Model\User;
use App\Model\UserVerification;
use App\Traits\ApiResponse;
use App\Traits\FileUpload;
use App\Traits\Slug;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Hash;
use Tymon\JWTAuth\Facades\JWTAuth;

class AdminController extends Controller
{
    use ApiResponse;
    use FileUpload;
    use Slug;

    public function register(Request $request): JsonResponse
    {
        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required|string|unique:users',
            'password' => 'required|confirmed',
        ]);

        try {
            $user = new User();
            $user->name = $request->input('name');
            $user->email = $request->input('email');
            $user->password = app('hash')->make($request->input('password'));
            $user->save();

            return response()->json([
                'entity' => 'admins',
                'action' => 'create',
                'result' => 'success'
            ], 201);

        } catch (\Exception $e) {
            return response()->json([
                'entity' => 'admins',
                'action' => 'create',
                'result' => 'failed'
            ], 409);
        }
    }

    public function login(Request $request)
    {

        $this->validate($request, [
            'email' => 'required|string',
            'password' => 'required|string',
        ]);

        $credentials = $request->only(['email', 'password']);
        $credentials['user_type'] = 1;

        if (!$token = Auth::attempt($credentials)) {
            return response()->json(['message' => 'Email and password are not match'], 401);
        }

        return $this->respondWithToken($token);
    }

    public function profile(): JsonResponse
    {
        return response()->json(['user' => Auth::user(),
            'notification' => DB::table('notifications')->where('user_type', 'admin')->get()->take(5),
            'permission' => DB::table('role_has_permissions')->where('role_id', Auth::user()->role_id)->get()->pluck('permission_id')]);
    }

    public function profilePermission()
    {
        return DB::table('role_has_permissions')->where('role_id', Auth::user()->role_id)->get()->pluck('permission_id');
    }

    public function logout(): JsonResponse
    {
        auth()->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    public function refresh(): string
    {
        return 'done';
    }

    public function userBlock(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('users')
            ->where('id', $request->id)
            ->update([
                'status' => (int)$request->active,
            ]);
    }

    public function userVerify(Request $request)
    {
        $this->validate($request, [
            'id' => 'required',
            'active' => 'required',
        ]);
        DB::table('users')
            ->where('id', $request->id)
            ->update([
                'seller_verify' => (int)$request->active,
            ]);
    }

    public function userStore(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required',
            'password' => 'required',
            'mobile' => 'required',
            'reg_type' => 'required',
        ]);

        $email = $request->email;
        $phone = $request->mobile;
        $number = $this->phone_number($phone);
        if (!$number) {
            return $this->errorResponse('Invalid email and phone number');
        }

        $check = User::where('email', $email)->where('user_type', '!=', 1)->first();
        if ($check) {
            return $this->errorResponse('This email already used try another');
        }

        $check2 = User::where('mobile', $number)->where('user_type', '!=', 1)->first();
        if ($check2) {
            return $this->errorResponse('This mobile number already used try another');
        }

        $total_user = rand(10000, 99999) . User::all()->count();
        $customer = 'CUS' . $total_user;
        $seller = 'SEL' . $total_user;

        $username = $this->username($request->name);
        $user = new User();
        $user->user_type = $request->reg_type;
        $user->name = $request->name;
        $user->email = $email;
        $user->mobile = $number;
        $user->username = $username;
        $user->seller_id = $seller;
        $user->customer_id = $customer;
        $user->password = Hash::make($request->password);
        $user->save();

        if ($request->reg_type === 2) {
            DB::table('shops')->insert(['user_id' => $user->id, 'shop_name' => $user->name]);
            DB::table('financials')->insert(['user_id' => $user->id,]);
            DB::table('shop_addresses')->insert(['user_id' => $user->id,]);
        }

        return User::where('id', $user->id)->select('id', 'name', 'photo_type', 'photo', 'status', 'customer_id', 'seller_id')->first();
    }

    public function userUpdate(Request $request, $id)
    {

        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required',
            'password' => 'required',
            'mobile' => 'required',
        ]);

        $email = $request->email;
        $phone = $request->mobile;
        $number = $this->phone_number($phone);
        if (!$number) {
            return $this->errorResponse('Invalid email and phone number');
        }

        $check = User::where('email', $email)->where('id', '!=', $id)->where('user_type', '!=', 1)->first();
        if ($check) {
            return $this->errorResponse('This email already used try another');
        }

        $check2 = User::where('mobile', $number)->where('id', '!=', $id)->where('user_type', '!=', 1)->first();
        if ($check2) {
            return $this->errorResponse('This mobile number already used try another');
        }

        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $email;
        $user->mobile = $number;
        $user->password = Hash::make($request->password);
        $user->save();

        return User::where('id', $id)->select('id', 'name', 'photo_type', 'photo', 'status')->first();
    }

    public function userList()
    {
        return DB::table('users')->where('user_type', 1)
            ->join('roles', 'roles.id', '=', 'users.role_id')
            ->select('roles.name as role', 'users.id', 'users.name', 'users.photo_type', 'users.photo', 'users.status', 'users.email', 'users.role_id')->get();
    }

    public function userStoreAdmin(Request $request)
    {

        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required',
            'password' => 'required',
            'role_id' => 'required',
        ]);

        $email = $request->email;

        $check = User::where('email', $email)->first();
        if ($check) {
            return $this->errorResponse('This email already used try another');
        }

        $user = new User();
        $user->user_type = 1;
        $user->name = $request->name;
        $user->email = $email;
        $user->role_id = $request->role_id;
        $user->password = Hash::make($request->password);
        $user->save();

        return (array)DB::table('users')->join('roles', 'roles.id', '=', 'users.role_id')
            ->select('roles.name as role', 'users.id', 'users.name', 'users.photo_type', 'users.photo', 'users.status', 'users.email', 'users.role_id')
            ->where('users.id', $user->id)->first();
    }

    public function userUpdateAdmin(Request $request, $id)
    {

        $this->validate($request, [
            'name' => 'required|string',
            'email' => 'required',
            'password' => 'required',
            'role_id' => 'required',
        ]);

        $email = $request->email;

        $check = User::where('email', $email)->where('id', '!=', $id)->first();
        if ($check) {
            return $this->errorResponse('This email already used try another');
        }

        $user = User::findOrFail($id);
        $user->name = $request->name;
        $user->email = $email;
        $user->role_id = $request->role_id;
        $user->password = Hash::make($request->password);
        $user->save();

        return (array)DB::table('users')->join('roles', 'roles.id', '=', 'users.role_id')
            ->select('roles.name as role', 'users.id', 'users.name', 'users.photo_type', 'users.photo', 'users.status', 'users.email', 'users.role_id')
            ->where('users.id', $user->id)->first();
    }

    public function destroy($id)
    {
        DB::table('users')->where('id', $id)->delete();
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
        $user->mobile = $request->mobile;
        $user->save();
    }
}
