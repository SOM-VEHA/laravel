<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class PermissionMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  Closure(Request): (Response)  $next
     */
//    public function handle(
//        Request $request,
//        Closure $next,
//        string $permission
//    ) {
//        $user = $request->user();
//
//        if (!$user) {
//            return response()->json([
//                'success' => false,
//                'message' => 'Unauthenticated',
//            ], 401);
//        }
//
//        if ($user->role?->name === 'super_admin') {
//            return $next($request);
//        }
//
//        $hasPermission = $user->role
//            ?->permissions()
//            ->where('name', $permission)
//            ->exists();
//
//        if (!$hasPermission) {
//            return response()->json([
//                'success' => false,
//                'message' => 'Permission denied',
//            ], 403);
//        }
//
//        return $next($request);
//    }

    public function handle(
        Request $request,
        Closure $next,
        string $permission
    ) {
        $user = $request->user();

        if (!$user) {
            return response()->json([
                'success' => false,
                'message' => 'Unauthenticated',
            ], 401);
        }

        // Super Admin → all permissions
        if ($user->role?->name === 'super_admin') {
            return $next($request);
        }

        $hasPermission = $user->role
            ?->permissions()
            ->where('name', $permission)
            ->exists();

        if (!$hasPermission) {
            return response()->json([
                'success' => false,
                'message' => 'Permission denied',
            ], 403);
        }

        return $next($request);
    }
}
