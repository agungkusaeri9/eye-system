<?php

namespace App\Http\Controllers;

use App\Models\District;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class DistrictController extends Controller
{

    public function index(Request $request)
    {
        $title = 'Data District';

        if($request->ajax()){
            $data = District::limit(1000)->get();

            return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {

                $btn = '<a href="' . route('distrik.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>'.
                          '<form id="form-delete" action="'.route('distrik.destroy', $row->id).'" method="post" class="d-inline">
                          '.method_field('DELETE').'
                          '.csrf_field().'
                          <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                          </form>';

                return $btn;
            })
            ->rawColumns(['action'])
            ->make();
        }
        return view('pages.district.index', compact('title'));
    }


    public function create()
    {
        $title = 'Tambah Data Distrik';
        $district = new District();
        $method = 'POST';
        $action = route('distrik.store');

        return view('pages.district.form', compact('title','district','action','method'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);

        try {
            DB::beginTransaction();

            District::create([
                'name' => $request->name
            ]);

            DB::commit();
            return redirect()->route('distrik.index')->with('success','Data berhasil ditambahkan');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }


    public function show($id)
    {

    }


    public function edit($id)
    {
        $title = 'Edit Data Distrik';
        $district = District::findOrFail($id);
        $method = 'PUT';
        $action = route('distrik.update', $district->id);

        return view('pages.district.form', compact('title','district','action','method'));
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required'
        ]);

        try {
            DB::beginTransaction();

            $district = District::findOrFail($id);

            $district->update([
                'name' => $request->name
            ]);

            DB::commit();
            return redirect()->route('distrik.index')->with('success','Data berhasil diperbarui');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }

    }


    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            District::findOrFail($id)->delete();

            DB::commit();
            return redirect()->route('distrik.index')->with('success','Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }
}
