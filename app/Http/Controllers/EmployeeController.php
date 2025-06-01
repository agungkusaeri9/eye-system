<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Imports\EmployeeImport;
use App\Models\Company;
use App\Models\Department;
use App\Models\Employee;
use App\Models\User;
use DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Maatwebsite\Excel\Facades\Excel;

class EmployeeController extends Controller
{

    public function index(Request $request)
    {
        $title = 'Data Karyawan';

        if ($request->ajax()) {
            $data = Employee::with(['department', 'company'])->limit(1000)->get();

            return \DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '
                    <a href="' . route('karyawan.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>' .
                        '<form id="form-delete" action="' . route('karyawan.destroy', $row->id) . '" method="post" class="d-inline">
                                ' . method_field('DELETE') . '
                                ' . csrf_field() . '
                                <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                                </form>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make();
        }

        return view('pages.employee.index', compact('title'));
    }


    public function create()
    {
        $title = 'Tambah Data Karyawan';
        $employee = new Employee();
        $method = 'POST';
        $action = route('karyawan.store');
        $department = Department::get();
        $company = Company::get();

        return view('pages.employee.form', compact('title', 'employee', 'method', 'action', 'department', 'company'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nrp' => 'required|',
            'name' => 'required',
            'email' => 'required|email|unique:employees,email',
            'no_handphone' => 'required',
            'date_born' => 'required',
            'address' => 'required',
            'department_id' => 'required|exists:departments,id',
            'company_id' => 'required|exists:companies,id',
            'password' => 'required',
        ]);
        try {
            DB::beginTransaction();

            $user = User::create([
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'role' => 3,
                'status' => 'Aktif'
            ]);

            Employee::create([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'no_handphone' => $request->no_handphone,
                'date_born' => $request->date_born,
                'address' => $request->address,
                'department_id' => $request->department_id,
                'company_id' => $request->company_id,
                'password' => bcrypt($request->password),
                'user_id' => $user->id
            ]);
            DB::commit();

            return redirect()->route('karyawan.index')->with('success', 'Data berhasil ditambahkan');

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
        $title = 'Edit Data Karyawan';
        $employee = Employee::findOrFail($id);
        $method = 'PUT';
        $action = route('karyawan.update', $employee->id);
        $nomor = Helper::generateEmployeeNumber();
        $department = Department::get();
        $company = Company::get();

        return view('pages.employee.form', compact('title', 'employee', 'method', 'action', 'nomor', 'department', 'company'));

    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'nrp' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'no_handphone' => 'required',
            'date_born' => 'required',
            'address' => 'required',
            'department_id' => 'required|exists:departments,id',
            'company_id' => 'required|exists:companies,id',

        ]);

        try {
            DB::beginTransaction();

            $employee = Employee::findOrFail($id);

            // Memeriksa apakah password baru diisi
            if (!empty($request->password)) {
                $password = bcrypt($request->password);
            } else {
                $password = $employee->password;
            }

            $employee->update([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'no_handphone' => $request->no_handphone,
                'date_born' => $request->date_born,
                'address' => $request->address,
                'department_id' => $request->department_id,
                'company_id' => $request->company_id,
                'password' => $password,
            ]);

            // check user account
            if ($employee->user_id == null) {
                // create account user with role customer
                $user = User::create([
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => $password,
                    'role' => 3,
                    'status' => 'Aktif',
                    'department' => $request->department_id,
                    'company' => $request->company_id,
                ]);
                $employee->update([
                    'user_id' => $user->id
                ]);
            } else {
                $employee->user()->update([
                    'name' => $request->name,
                    'email' => $request->email,
                    'password' => $password,
                    'department' => $request->department_id
                ]);
            }

            DB::commit();

            return redirect()->route('karyawan.index')->with('success', 'Data berhasil diperbarui');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }


    public function destroy($id)
    {
        try {
            DB::beginTransaction();
            $employee = Employee::findOrFail($id);
            $employee->user()->delete();
            // User::findOrFail($id)->delete();
            DB::commit();
            return redirect()->route('karyawan.index')->with('success', 'Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function getById()
    {
        if (request()->ajax()) {
            $id = request('id');
            $employee = Employee::with(['department'])->find($id);

            if ($employee) {
                return response()->json($employee);
            }
            return response()->json(null);
        }
    }

    public function importExcel(Request $request)
    {
        $request->validate([
            'file' => 'required|mimes:xlsx,csv,xls'
        ]);

        Excel::import(new EmployeeImport, $request->file('file'));

        return back()->with('success', 'Data karyawan berhasil diimport!');
    }
}
