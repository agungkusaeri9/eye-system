<?php

namespace App\Http\Controllers;

use DataTables;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $title = 'Data Customer';

        if($request->ajax()){
            $data = User::where('role', 3)->limit(1000)->get();
            return \DataTables::of($data)
                  ->addIndexColumn()
                  ->addColumn('action', function ($row) {

                      $btn = '<a href="' . route('customer.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>'.
                                '<form id="form-delete" action="'.route('customer.destroy', $row->id).'" method="post" class="d-inline">
                                '.method_field('DELETE').'
                                '.csrf_field().'
                                <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                                </form>';

                      return $btn;
                  })
                  ->rawColumns(['action'])
                  ->make();
        }

        return view('pages.customer.index', compact('title'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $title = 'Tambah Data Customer';
        $customer = new User();
        $method = 'POST';
        $action = route('customer.store');

        return view('pages.customer.form', compact('title','customer','method','action'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([
            'nrp' => 'required|unique:users,nrp',
            'name' => 'required',
            'email' => 'required|email|unique:users,email',
            'no_hp' => 'required',
            'password' => 'required|min:6|confirmed',
            'password_confirmation' => 'required'
        ]);
        try {
            DB::beginTransaction();

            User::create([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'no_hp' => $request->no_hp,
                'password' => bcrypt($request->password),
                'status' => $request->status,
                'role' => 3
            ]);
            DB::commit();

            return redirect()->route('customer.index')->with('success','Data berhasil ditambahkan');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $title = 'Edit Data Customer';
        $customer = User::findOrFail($id);
        $method = 'PUT';
        $action = route('customer.update', $customer->id);

        return view('pages.customer.form', compact('title','customer','method','action'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'nrp' => 'required',
            'name' => 'required',
            'email' => 'required|email',
            'no_hp' => 'required',
        ]);

        try {
            DB::beginTransaction();

            $customer = User::findOrFail($id);

            // Memeriksa apakah password baru diisi
            if (!empty($request->password)) {
                $request->validate([
                    'password' => 'required|min:6|confirmed',
                    'password_confirmation' => 'required'
                ]);
                $password = bcrypt($request->password);
            } else {
                $password = $customer->password;
            }

            if($request->nrp !== $customer->nrp) {
                $request->validate([
                    'nrp' => 'unique:users,nrp',
                ]);
            }

            $customer->update([
                'nrp' => $request->nrp,
                'name' => $request->name,
                'email' => $request->email,
                'no_hp' => $request->no_hp,
                'password' => $password,
                'status' => $request->status,
            ]);

            DB::commit();

            return redirect()->route('customer.index')->with('success', 'Data berhasil diperbarui');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            User::findOrFail($id)->delete();

            DB::commit();
            return redirect()->route('customer.index')->with('success','Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }
}
