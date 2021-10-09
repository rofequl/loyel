<?php

namespace App\Http\Controllers;

use App\Model\Region;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class RoleController extends Controller
{
    public function index()
    {
        return DB::table('roles')->get();
    }

    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:roles',
        ]);

        $insert = DB::table('roles')->insertGetId([
            'name' => $request->name,
        ]);
        return (array)DB::table('roles')->where('id', $insert)->first();
    }

    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required|string|max:50|unique:roles,name,' . $id,
        ]);

        DB::table('roles')
            ->where('id', $id)
            ->update([
                'name' => $request->name,
            ]);
        return (array)DB::table('roles')->where('id', $id)->first();
    }

    public function destroy($id)
    {
        $permission = DB::table('role_has_permissions')->where('role_id', $id)->first();
        $user = DB::table('users')->where('role_id', $id)->first();
        if ($permission) return response()->json(['result' => 'Error', 'message' => 'Role already used in permission table'], 200);
        if ($user) return response()->json(['result' => 'Error', 'message' => 'Role already used in user table'], 200);
        DB::table('roles')->where('id', $id)->delete();
    }

    public function permissionIndex()
    {
        return DB::table('role_has_permissions')->get();
    }

    public function permissionUpdate(Request $request)
    {
        $this->validate($request, [
            'permission' => 'required',
            'role' => 'required',
            'type' => 'required',
        ]);
        if ($request->type === 'add') {
            $permission = DB::table('role_has_permissions')->where('role_id', $request->role)->where('permission_id', $request->permission)
                ->get()->first();
            if (!$permission) DB::table('role_has_permissions')->insert(['role_id' => $request->role, 'permission_id' => $request->permission]);
        } else {
            DB::table('role_has_permissions')->where('role_id', $request->role)->where('permission_id', $request->permission)
                ->delete();
        }


    }

}
