<?php

namespace App\Http\Controllers;

use App\Helpers\Helper;
use App\Models\District;
use App\Models\Department;
use App\Models\Position;
use App\Models\User;
use DataTables;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ValidatorController extends Controller
{

    public function index(Request $request)
    {
        $title = 'Data Validator';
        if ($request->ajax()) {
            $data = User::where('role', 2)->with(['departemen', 'jabatan', 'distrik'])->limit(1000)->get();

            return \DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {

                    $btn = '<a href="' . route('validator.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>' .
                        '<form id="form-delete" action="' . route('validator.destroy', $row->id) . '" method="post" class="d-inline">
                                ' . method_field('DELETE') . '
                                ' . csrf_field() . '
                                <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                                </form>';

                    return $btn;
                })
                ->rawColumns(['action'])
                ->make();
        }

        return view('pages.validator.index', compact('title'));
    }

    public function create()
    {
        $title = 'Tambah Data Validator';
        $validator = new User();
        $method = 'POST';
        $action = route('validator.store');
        $departemen = Department::get();
        $jabatan = Position::get();
        $distrik = District::get();

        return view('pages.validator.form', compact('title', 'validator', 'method', 'action', 'departemen', 'jabatan', 'distrik'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'nrp' => 'required|unique:users,nrp',
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed   ',
            'password_confirmation' => 'required',
            'position' => 'required|exists:positions,id',
            'department' => 'required|exists:departments,id',
            'district' => 'required|exists:districts,id',
            'status' => 'required',
            'signature' => 'required|mimes:jpg, jpeg'
        ]);
        try {
            DB::beginTransaction();

            $sign = $request->file('signature');
            $signature_picture = time() . '_' . $sign->getClientOriginalName();
            \Storage::disk('local')->put('/public/validator/signature/' . $signature_picture, \File::get($sign));
            $signature = 'validator/signature/' . $signature_picture;

            User::create([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'password' => bcrypt($request->password),
                'position' => $request->position,
                'department' => $request->department,
                'district' => $request->district,
                'status' => $request->status,
                'role' => 2,
                'signature' => $signature
            ]);
            DB::commit();

            return redirect()->route('validator.index')->with('success', 'Data berhasil ditambahkan');

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
        $title = 'Edit Data Validator';
        $validator = User::findOrFail($id);
        $method = 'PUT';
        $action = route('validator.update', $validator->id);
        $departemen = Department::get();
        $jabatan = Position::get();
        $distrik = District::get();

        return view('pages.validator.form', compact('title', 'validator', 'method', 'action', 'departemen', 'jabatan', 'distrik'));

    }


    public function update(Request $request, $id)
    {
        $request->validate([
            'nrp' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'position' => 'required|exists:positions,id',
            'department' => 'required|exists:departments,id',
            'district' => 'required|exists:districts,id',
            'status' => 'required'
        ]);

        try {
            DB::beginTransaction();

            $validator = User::findOrFail($id);

            // Memeriksa apakah password baru diisi
            if (!empty($request->password)) {
                $request->validate([
                    'password' => 'required|min:6|confirmed',
                    'password_confirmation' => 'required'
                ]);
                $password = bcrypt($request->password);
            } else {
                $password = $validator->password;
            }

            if ($request->nrp !== $validator->nrp) {
                $request->validate([
                    'nrp' => 'unique:users,nrp',
                ]);
            }

            if ($request->email !== $validator->email) {
                $request->validate([
                    'email' => 'unique:users,email',
                ]);
            }

            if (!$validator->signature) {
                $request->validate([
                    'signature' => 'required|mimes:jpg, jpeg'
                ]);
            }

            if ($request->file('signature')) {
                $sign = $request->file('signature');
                $signature_picture = time() . '_' . $sign->getClientOriginalName();
                \Storage::disk('local')->put('/public/validator/signature/' . $signature_picture, \File::get($sign));
                $signature = 'validator/signature/' . $signature_picture;
            } else {
                $signature = $validator->signature;
            }

            $validator->update([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'position' => $request->position,
                'department' => $request->department,
                'district' => $request->district,
                'status' => $request->status,
                'password' => $password,
                'signature' => $signature
            ]);

            DB::commit();

            return redirect()->route('validator.index')->with('success', 'Data berhasil diperbarui');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }


    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            User::findOrFail($id)->delete();

            DB::commit();
            return redirect()->route('validator.index')->with('success', 'Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }
}
