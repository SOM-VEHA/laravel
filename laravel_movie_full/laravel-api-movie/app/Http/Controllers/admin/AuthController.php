<?php

namespace App\Http\Controllers\admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public  function loginView(){
        return view('admin.auth.pages-sign-in');
    }
    public  function login(Request $request){

    }
}
