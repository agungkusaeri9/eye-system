<?php

namespace App\Http\Controllers;

use App\Imports\FamilyImport;
use App\Models\Employee;
use App\Models\Family;
use DB;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;

class FamilyController extends Controller
{
    public function getById()
    {
        if (request()->ajax()) {
            $id = request()->id;
            $data = \App\Models\Family::where('id', $id)->first();
            return response()->json($data);
        }
    }

    public function index(Request $request)
    {

        $title = 'Data Keluarga';
        if ($request->ajax()) {
            $employee_id = request('employee_id');
            $data = Family::with(['employee'])->where('employee_id', $employee_id)->orderBy('name', 'ASC')->get();
            return \DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('employee_name', function ($row) {
                    // dd($row->employee);
                    return $row->employee->name;
                })
                ->addColumn('employee_nrp', function ($row) {
                    return $row->employee->nrp;
                })
                ->addColumn('action', function ($row) {
                    $btn = '
                    <a href="' . route('family.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>' .
                        '<form id="form-delete" action="' . route('family.destroy', $row->id) . '" method="post" class="d-inline">
                                ' . method_field('DELETE') . '
                                ' . csrf_field() . '
                                <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                                </form>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make();
        }

        return view('pages.family.index', compact('title'));
    }

    public function create()
    {
        $title = 'Tambah Data Keluarga';
        $family = new Family();
        $method = 'POST';
        $action = route('family.store');
        $employee = Employee::findOrFail(request('employee_id'));

        return view('pages.family.form', compact('title', 'family', 'method', 'action', 'employee'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|',
            'relation' => 'required',
            'employee_id' => 'required',
        ]);
        try {
            DB::beginTransaction();

            $data = request()->only(['name', 'relation', 'employee_id']);
            Family::create($data);
            DB::commit();

            return redirect()->route('family.index', [
                'employee_id' => $request->employee_id
            ])->with('success', 'Data berhasil ditambahkan');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function show($id)
    {
        //
    }


    public function edit($id)
    {
        $title = 'Edit Data Keluarga';
        $family = Family::findOrFail($id);
        $employee = Employee::findOrFail($family->employee_id);
        $method = 'PUT';
        $action = route('family.update', $family->id);

        return view('pages.family.form', compact('title', 'family', 'method', 'action', 'employee'));

    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|',
            'relation' => 'required'
        ]);
        try {
            DB::beginTransaction();
            $item = Family::findOrFail($id);
            $data = request()->only(['name', 'relation']);
            $item->update($data);
            DB::commit();

            return redirect()->route('family.index', [
                'employee_id' => $request->employee_id
            ])->with('success', 'Data berhasil diupdate');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }


    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            $family = Family::findOrFail($id);
            $employee_id = $family->employee_id;
            $family->delete();
            // User::findOrFail($id)->delete();
            DB::commit();
            return redirect()->route('family.index', [
                'employee_id' => $employee_id
            ])->with('success', 'Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function importExcel(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv,xls'
        ]);

        Excel::import(new FamilyImport, $request->file('file'));

        return back()->with('success', 'Data Keluarga berhasil diimport!');
    }

}
