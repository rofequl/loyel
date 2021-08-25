<?php

namespace App\Traits;

use Illuminate\Support\Facades\DB;

trait Notification
{
    protected function notification($message, $user_type, $user_id)
    {
        DB::table('notifications')->insert([
            'user_id' => $user_type === 'admin' ? DB::table('users')->where('user_type', 1)->value('id') : $user_id,
            'message' => $message,
            'user_type' => $user_type,
        ]);
    }
}
