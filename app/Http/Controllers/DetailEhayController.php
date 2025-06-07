<?php

namespace App\Http\Controllers;

use App\Models\EhayDetail;
use Illuminate\Http\Request;

class DetailEhayController extends Controller
{
    public function edit($id)
    {
        $detail = EhayDetail::where('id', $id)->first();
        $title = 'Edit Data Detail Ehay';
        return view('pages.ehay-detail.edit', compact('detail', 'title'));
    }
}
