<?php

namespace App\Http\Controllers\mobile_api;
use App\Models\Slide;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class SlideController extends Controller
{
  public function index()
    {
        $slides = Slide::where('is_active', true)->get();
        return response()->json([
            "status" => "success",
            "message" => "success",
            "data" => $slides
        ]);
    }
}
