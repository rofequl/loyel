<?php


namespace App\Http\Helper;

use Illuminate\Support\Str;

class CommonHelper
{
    public static function strRandom($length = 16, $str = null)
    {
        $pool = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        if ($str) {
            $pool = $str;
        }
        return substr(str_shuffle(str_repeat($pool, 5)), 0, $length);
    }

    public static function generateOTP($length = 4, $isNumeric = true)
    {
        if ($isNumeric) {
            return rand(
                ((int)str_pad(1, $length, 0, STR_PAD_RIGHT)),
                ((int)str_pad(9, $length, 9, STR_PAD_RIGHT))
            );
        }

        return Str::random($length);

    }
}

