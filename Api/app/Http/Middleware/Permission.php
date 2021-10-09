<?php

namespace App\Http\Middleware;

use App\Traits\ApiResponse;
use Closure;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class Permission
{
    use ApiResponse;

    public function handle($request, Closure $next, $permission, $others = null)
    {
        if ($others === 'others' &&  Auth::user()->user_type !== 1) return $next($request);
        $role = DB::table('role_has_permissions')->where('permission_id', $permission)->first();
        if ($role && Auth::user()->role_id === $role->role_id) {
            return $next($request);
        } else return $this->errorResponse('You have not permission to use this link', 'Permission', 401);
    }
}
