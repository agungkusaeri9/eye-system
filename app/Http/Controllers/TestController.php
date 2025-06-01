<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\TesterModel;
class TestController extends Controller
{
    public function __construct()
    {
        $this->test = new Testermodel();
    }
    public function index()
    {
        $test = $this->test;
        return view('test', compact(['test']));
    }
}
