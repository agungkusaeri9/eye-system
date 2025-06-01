<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use GuzzleHttp\Client;
use Carbon\Carbon;

class AuthController extends Controller
{
    public function index(Request $request)
    {
        return view('pages.auth.login.index');
    }
    public function auth(Request $request)
    {
        try {
            $credentials = $request->only('email', 'password');

            if (!Auth::guard('web')->attempt($credentials)) {
                return redirect()->route('login')->with('error', 'Email atau password anda salah!');
            }

            if (Auth::user()->status == 'Tidak Aktif') {
                Auth::logout();
                $request->session()->invalidate();
                $request->session()->regenerateToken();

                return redirect()->route('login')->with('error', 'User tidak aktif!');
            }

            return redirect()->intended('/dashboard');

        } catch (\Throwable $th) {
            return redirect()->route('login')->with('error', $th->getMessage());
        }
    }

    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return redirect()->route('login')->with('success', 'User berhasil logout!');
    }
}
