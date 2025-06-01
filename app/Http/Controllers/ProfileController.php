<?php

namespace App\Http\Controllers;

use App\Models\Company;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class ProfileController extends Controller
{
    public function index()
    {
        $employee = auth()->user()->employee;
        $title = "Edit Profile";
        $companies = Company::get();
        return view('pages.profile.index', compact('employee', 'title', 'companies'));
    }

    public function update()
    {
        request()->validate([
            'email' => ['required', 'email', Rule::unique('users', 'email')->ignore(auth()->user()->id)],
            'no_handphone' => 'required',
            'date_born' => 'required',
            'address' => 'required',
            'password' => [Rule::when(request()->password, 'required|min:5'), 'nullable'],
        ]);

        $data = request()->only('email', 'no_handphone', 'date_born', 'address', 'company_id');
        $data_user = request()->only('email');

        if (request()->password) {
            $data['password'] = bcrypt(request()->password);
            $data_user['password'] = bcrypt(request()->password);
        }
        $data_user['no_hp'] = request()->no_handphone;

        auth()->user()->employee()->update($data);
        auth()->user()->update($data_user);

        return back()->with('success', 'Profile berhasil diubah');
    }
}
