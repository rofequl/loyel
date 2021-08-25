<?php

namespace App\Http\Middleware;

use Closure;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;
use Tymon\JWTAuth\Facades\JWTAuth;

class JWTRefresh
{

    public function handle($request, Closure $next)
    {
        try {
            $user = JWTAuth::parseToken()->authenticate();
        } catch (\Exception $e) {
            if ($e instanceof TokenExpiredException) {
                try {
                    $newToken = JWTAuth::parseToken()->refresh();
                    return response()->json(['message' => 'Token expired', 'token' => $newToken], 200);
                } catch (\Exception $e) {
                    return response()->json(['message' => 'Token Invalid'], 401);
                }
            } else if ($e instanceof TokenInvalidException) {
                return response()->json(['message' => 'Token Invalid'], 401);
            } else {
                return response()->json(['message' => 'Token not found'], 401);
            }
        }
        return $next($request);
    }
}

