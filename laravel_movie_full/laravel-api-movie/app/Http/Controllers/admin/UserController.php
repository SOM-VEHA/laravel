<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use App\Models\Slide;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        $users = User::paginate(10);
        return view('admin.user.index',compact('users'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
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
        $user = User::findOrFail($id);

        $user->delete();

        // ចំនួន data ដែលនៅសល់
        $total = User::count();

        // ចំនួន page ដែលនៅសល់
        $lastPage = max(1, ceil($total / 10));

        // Current page
        $currentPage = (int) $request->page;

        // បើ current page លែងមាន data
        if ($currentPage > $lastPage) {
            $currentPage = $lastPage;
        }

        return redirect()
            ->route('users.index', [
                'page' => $currentPage
            ])
            ->with('success', 'Slide deleted successfully.');
    }
}
