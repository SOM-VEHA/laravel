<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Banner;
class BannerController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $banners = Banner::where('status', true)->get();
        return response()->json([
            'code' => 200,
            'success' => true,
            'message' => 'Banners retrieved successfully',
            'banners' => $banners,
        ]);
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required',
            'image' => 'required',
            'description' => 'nullable',
            'status' => 'boolean'
        ]);
        $banner = Banner::create($data);
        return response()->json([
            'message' => 'Banner created',
            'data' => $banner
        ]);
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $banner = Banner::findOrFail($id);
        return response()->json([
            'success' => true,
            'data' => $banner,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        $banner = Banner::findOrFail($id);

        $banner->update(
            $request->all()
        );


        return response()->json([
            'message' => 'Banner updated',
            'data' => $banner
        ]);
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(string $id)
    {
        $banner = Banner::findOrFail($id);
        $banner->delete();
        return response()->json([
            'message' => 'Banner deleted'
        ]);
    }
}
