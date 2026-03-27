<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class CkeditorController extends Controller
{
    public function upload(Request $request)
    {
        $funcNum = $request->input('CKEditorFuncNum');

        if ($request->hasFile('upload')) {
            $file = $request->file('upload');

            $allowedExtensions = ['jpg', 'jpeg', 'png', 'gif', 'webp', 'svg'];
            $extension = strtolower($file->getClientOriginalExtension());

            if (!in_array($extension, $allowedExtensions)) {
                $message = 'Only image files are allowed (jpg, jpeg, png, gif, webp, svg).';
                return response("<script>window.parent.CKEDITOR.tools.callFunction({$funcNum}, '', '{$message}');</script>");
            }

            $filename = uniqid('ckeditor_') . '.' . $extension;
            $file->move(public_path('assets/images/ckeditor'), $filename);

            $url = asset('assets/images/ckeditor/' . $filename);

            return response("<script>window.parent.CKEDITOR.tools.callFunction({$funcNum}, '{$url}', '');</script>");
        }

        $message = 'No file uploaded.';
        return response("<script>window.parent.CKEDITOR.tools.callFunction({$funcNum}, '', '{$message}');</script>");
    }
}

