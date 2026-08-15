<?php

namespace App\Http\Controllers\mobile_api;
use App\Models\categoriesModel;
use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;

class CategoriesController extends Controller
{
    public function index(){
        $categories=Category::with('movie')->get();
        return response()->json([
            "status" => "success",
            "data" => $categories
        ]);
    }
}
