<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller
{

    public function index()
    {

        if (auth()->user()->role == 3) {
            // customer/employee
            return redirect()->route('ehay.customer-list');
        } elseif (auth()->user()->role == 4 || auth()->user()->role == 5) {
            return redirect()->route('ehay.index');
        } elseif (auth()->user()->role == 6) {
            return redirect()->route('ehay.status');
        }

        $title = 'Dashboard';
        return view('pages.dashboard.index', compact('title'));
    }


    public function create()
    {
        //
    }

    public function store(Request $request)
    {
        //
    }

    public function show($id)
    {
        //
    }

    public function edit($id)
    {
        //
    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }
}
