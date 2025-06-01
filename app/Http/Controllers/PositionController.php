<?php

namespace App\Http\Controllers;

use App\Models\Position;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;

class PositionController extends Controller
{

    public function index(Request $request)
    {
        $title = 'Data Jabatan';

        if($request->ajax()){
            $data = Position::limit(1000)->get();

            return DataTables::of($data)
            ->addIndexColumn()
            ->addColumn('action', function ($row) {

                $btn = '<a href="' . route('jabatan.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>'.
                          '<form id="form-delete" action="'.route('jabatan.destroy', $row->id).'" method="post" class="d-inline">
                          '.method_field('DELETE').'
                          '.csrf_field().'
                          <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                          </form>';

                return $btn;
            })
            ->rawColumns(['action'])
            ->make();
        }
        return view('pages.position.index', compact('title'));
    }


    public function create()
    {
        $title = 'Tambah Data Jabatan';
        $position = new Position();
        $method = 'POST';
        $action = route('jabatan.store');

        return view('pages.position.form', compact('title','position','action','method'));
    }


    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required'
        ]);

        try {
            DB::beginTransaction();

            Position::create([
                'name' => $request->name
            ]);

            DB::commit();
            return redirect()->route('jabatan.index')->with('success','Data berhasil ditambahkan');
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
        $title = 'Edit Data Jabatan';
        $position = Position::findOrFail($id);
        $method = 'PUT';
        $action = route('jabatan.update', $position->id);

        return view('pages.position.form', compact('title','position','action','method'));
    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required'
        ]);

        try {
            DB::beginTransaction();

            $district = Position::findOrFail($id);

            $district->update([
                'name' => $request->name
            ]);

            DB::commit();
            return redirect()->route('jabatan.index')->with('success','Data berhasil diperbarui');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }

    }


    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            Position::findOrFail($id)->delete();

            DB::commit();
            return redirect()->route('jabatan.index')->with('success','Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }
}
