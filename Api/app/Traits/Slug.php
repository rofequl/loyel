<?php

namespace App\Traits;

use Illuminate\Http\Request;


trait Slug
{
    protected function slugText(Request $request, $name): string
    {
        $string = str_replace(' ', '-', $request->$name); // Replaces all spaces with hyphens.
        return strtolower(preg_replace('/[^A-Za-z0-9\-]/', '', $string) . '-' .
            preg_replace('/[^A-Za-z0-9\-]/', '', base64_encode(rand(100, 999)))); // Removes special chars.
    }

    protected function sku()
    {
        return strtoupper(preg_replace('/[^A-Za-z0-9\-]/', '', base64_encode(time() . '' . rand(1000, 9999))));
    }

    protected function username($request)
    {
        $string = str_replace(' ', '', $request); // Replaces all spaces with hyphens.
        return strtolower(preg_replace('/[^a-zA-Z0-9_ -]/s', '', $string) .
            preg_replace('/[^A-Za-z0-9\-]/', '', base64_encode(rand(10000, 99999)))); // Removes special chars.
    }
}
