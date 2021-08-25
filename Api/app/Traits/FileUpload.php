<?php

namespace App\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\File;
use Image;

trait FileUpload
{
    protected function nameGenerate($file)
    {
        $name = base64_encode(rand(10000, 99999) . time());
        $name = preg_replace('/[^A-Za-z0-9\-]/', '', $name);
        return strtolower($name) . '.' . explode('/', explode(':', substr($file, 0, strpos($file, ';')))[1])[1];
    }

    protected function saveImages(Request $request, $file, $folder)
    {
        $path = base_path('public/' . $folder);
        if (!File::exists($path)) {
            File::makeDirectory($path, $mode = 0777, true, true);
        }
        $name = $this->nameGenerate($request->$file);
        Image::make($request[$file])->save($path . '/' . $name);
        return $folder . $name;
    }

    protected function saveImagesWH(Request $request, $file, $folder, $width, $height = null)
    {
        $path = base_path('public/' . $folder);
        if (!File::exists($path)) {
            File::makeDirectory($path, $mode = 0777, true, true);
        }
        $name = $this->nameGenerate($request->$file);
        Image::make($request[$file])->resize($width, $height)->save($path . '/' . $name);
        return $folder . $name;
    }

    protected function saveImagesDWH($file, $folder, $width, $height)
    {
        $path = base_path('public/' . $folder);
        if (!File::exists($path)) {
            File::makeDirectory($path, $mode = 0777, true, true);
        }
        $name = $this->nameGenerate($file);
        Image::make($file)->resize($width, $height)->save($path . '/' . $name);
        return $folder . $name;
    }
}
