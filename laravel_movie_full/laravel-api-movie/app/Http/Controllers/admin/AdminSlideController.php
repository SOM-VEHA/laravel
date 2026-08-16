<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Slide;
use Illuminate\Http\Request;

class AdminSlideController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $slides = Slide::paginate(10);
        return view('admin.slide.index',compact('slides'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.slide.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $data = $request->validate([
            'title' => 'required',
            'image' => 'required|image|mimes:jpeg,png,jpg,gif,svg|max:2048',
            'description' => 'required',
            'is_active' => 'required',
        ]);
        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('images/slides', 'public');
        }
        Slide::create($data);
        return redirect()->route('slides.index')->with('success', 'Slide created successfully.');
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        $slide = Slide::findOrFail($id);
        return view('admin.slide.view', compact('slide'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(string $id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, string $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(Request $request, string $id)
    {
        $slide = Slide::findOrFail($id);

        $slide->delete();

        // ចំនួន data ដែលនៅសល់
        $total = Slide::count();

        // ចំនួន page ដែលនៅសល់
        $lastPage = max(1, ceil($total / 10));

        // Current page
        $currentPage = (int) $request->page;

        // បើ current page លែងមាន data
        if ($currentPage > $lastPage) {
            $currentPage = $lastPage;
        }

        return redirect()
            ->route('slides.index', [
                'page' => $currentPage
            ])
            ->with('success', 'Slide deleted successfully.');
    }
}
