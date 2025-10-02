<?php

namespace App\Http\Controllers;

use App\Exports\EhayExport;
use App\Helpers\Helper;
use App\Models\Ehay;
use App\Models\EhayFile;
use App\Models\Employee;
use App\Models\Family;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use Illuminate\Validation\Rule;
use Maatwebsite\Excel\Facades\Excel;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Validator;
use App\Http\Controllers\Controller;
use App\Models\EhayDetail;
use Carbon\Carbon;

class EhayController extends Controller
{

    public function index(Request $request)
    {
        $title = 'Data Ehay';
        $summaryData = Ehay::getStatusSummary();
        if ($request->ajax()) {
            // admin
            $data = Ehay::latest()->byRole()->limit(1000)->get();
            return DataTables::of($data)
                ->addIndexColumn()
                ->rawColumns(['action', 'checkbox'])
                ->addColumn('employee', function ($model) {
                    return $model->employee->nrp . ' - ' . $model->employee->name;
                })
                ->addColumn('current_log_status', function ($model) {
                    return $model->currentLogStatus();
                })
                ->addColumn('action', function ($row) {

                    if (auth()->user()->role == 1) {
                        return "Not Access";
                    } else {
                        if (auth()->user()->email === "adminclaim2@gmail.com") return "Not Access";
                        $btn = '<a href="' . route('ehay.validation', $row->uuid) . '" class="btn btn-sm btn-danger me-1">Start Validation</a>';
                        return $btn;
                    }
                })
                ->addColumn('checkbox', function ($row) {
                    return '<input type="checkbox" class="row-checkbox" value="' . $row->uuid . '">';
                })
                ->make();
        }
        return view('pages.ehay.index', compact('title', 'summaryData'));
    }

    public function create()
    {
        $title = 'Tambah Data Ehay';
        $ehay = new Ehay();
        $method = 'POST';
        $action = route('ehay.store');
        $employees = Employee::orderBy('name')->get();
        return view('pages.ehay.form', compact('title', 'ehay', 'method', 'action', 'employees'));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'patient_name' => 'required|array',
            'patient_name.*' => 'required|string',
            'patient_status' => 'required|array',
            'patient_status.*' => 'required|string',
            'cost_treatment' => 'nullable|array',
            'cost_treatment.*' => 'nullable|numeric',
            'care_type1' => 'nullable|array',
            'care_type1.*' => 'nullable|string',
            'cost_care1' => 'nullable|array',
            'cost_care1.*' => 'nullable|numeric',
            'care_type2' => 'nullable|array',
            'care_type2.*' => 'nullable|string',
            'cost_care2' => 'nullable|array',
            'cost_care2.*' => 'nullable|numeric',
            'cost_glasses' => 'nullable|array',
            'cost_glasses.*' => 'nullable|numeric',
            'keterangan' => 'nullable|array',
            'keterangan.*' => 'nullable|string',
            'file_detail' => 'nullable|array',
            'file_detail.*' => 'nullable|array',
            'file_detail.*.*' => 'nullable|file|image|mimes:jpeg,png|max:1024'
        ], [
            'file_detail.*.*.max' => 'Ukuran file tidak boleh lebih dari 1MB.',
            'file_detail.*.*.mimes' => 'File harus berformat JPG atau PNG.',
            'file_detail.*.*.image' => 'File harus berupa gambar.'
        ]);

        if ($validator->fails()) {
            return redirect()->back()
                ->withErrors($validator)
                ->withInput();
        }

        // Additional file size validation (in case frontend validation is bypassed)
        if ($request->hasFile('file_detail')) {
            foreach ($request->file('file_detail') as $groupIndex => $files) {
                if (is_array($files)) {
                    // Check file count limit
                    if (count($files) > 5) {
                        return redirect()->back()
                            ->withErrors(['file_detail' => "Maksimal hanya boleh upload 5 file per data pasien."])
                            ->withInput();
                    }

                    foreach ($files as $file) {
                        if ($file && $file->getSize() > 1048576) { // 1MB in bytes
                            return redirect()->back()
                                ->withErrors(['file_detail' => "File {$file->getClientOriginalName()} terlalu besar. Maksimal ukuran file adalah 1MB."])
                                ->withInput();
                        }
                    }
                }
            }
        }

        // cek claim
        $ceckClaim = Ehay::where('employee_id', auth()->user()->employee->id)->whereNotIn('status', [0, 5])->count();
        if ($ceckClaim >= 1) {
            return redirect()->back()->with('error', 'Anda sudah memiliki claim yang belum disetujui');
        }

        try {
            DB::beginTransaction();

            // Create main claim record
            $claim = Ehay::create([
                'employee_id' => auth()->user()->employee->id,
                'remarks' => $request->remarks
            ]);

            // Process each patient's data
            foreach ($request->patient_name as $index => $patientName) {
                $totalNominal = 0;

                // Add treatment cost if exists
                if (isset($request->cost_treatment[$index])) {
                    $totalNominal += $request->cost_treatment[$index];
                }

                // Add care1 cost if exists
                if (isset($request->cost_care1[$index])) {
                    $totalNominal += $request->cost_care1[$index];
                }

                // Add care2 cost if exists
                if (isset($request->cost_care2[$index])) {
                    $totalNominal += $request->cost_care2[$index];
                }

                // Add glasses cost if exists
                if (isset($request->cost_glasses[$index])) {
                    $totalNominal += $request->cost_glasses[$index];
                }

                // Create detail record
                $detail = $claim->details()->create([
                    'patient_name' => $patientName,
                    'patient_status' => $request->patient_status[$index],
                    'cost_treatment' => $request->cost_treatment[$index] ?? 0,
                    'care_type1' => $request->care_type1[$index] ?? null,
                    'cost_care1' => $request->cost_care1[$index] ?? 0,
                    'care_type2' => $request->care_type2[$index] ?? null,
                    'cost_care2' => $request->cost_care2[$index] ?? 0,
                    'cost_glasses' => $request->cost_glasses[$index] ?? 0,
                    'keterangan' => $request->keterangan[$index] ?? null,
                    'nominal_total' => $totalNominal
                ]);

                // Handle multiple file uploads
                if ($request->hasFile("file_detail.{$index}")) {
                    foreach ($request->file("file_detail.{$index}") as $file) {
                        $filePath = $file->store('ehay-files', 'public');

                        // Create file record
                        $detail->files()->create([
                            'file' => $filePath
                        ]);
                    }
                }
            }

            $claim->update([
                'nominal_total' => $claim->details->sum('nominal_total')
            ]);

            DB::commit();
            return redirect()->route('ehay.customer-list')->with('success', 'Data berhasil disimpan');
        } catch (\Exception $e) {
            dd($e->getMessage());
            DB::rollback();
            return redirect()->back()
                ->with('error', 'Terjadi kesalahan: ' . $e->getMessage())
                ->withInput();
        }
    }

    public function status(Request $request)
    {
        $title = 'Data Ehay Status';

        if ($request->ajax()) {
            $data = Ehay::getByRole()->whereIn('status', [0, 1, 2, 3])->latest()->limit(1000)->get();

            return DataTables::of($data)
                ->addIndexColumn()
                ->rawColumns(['action', 'current_log_status'])
                ->addColumn('employee', function ($model) {
                    return $model->employee->nrp . ' - ' . $model->employee->name;
                })
                ->addColumn('current_log_status', function ($model) {
                    if ($model->currentLogStatus() == 'Waiting for Revision') {
                        return $model->currentLogStatus() . ' <br> (' . $model->currentLogStatusData()->notes . ')';
                    } else {
                        return $model->currentLogStatus();
                    }
                })
                ->addColumn('action', function ($row) {
                    if (in_array(auth()->user()->role, [4, 5])) {
                        if ($row->status == 4 && auth()->user()->role == 4) {
                            $btn = '<a href="' . route('ehay.show', $row->uuid) . '" class="btn btn-sm btn-warning me-1">Detail</a><a href="#" class="btn btn-sm btn-success me-1 btn-approve" data-id="' . $row->uuid . '" >Approve</a>';
                        } else if ($row->status == 2 && auth()->user()->email !== "adminclaim2@gmail.com") {
                            // revision
                            $btn = '<a href="' . route('ehay.edit', $row->uuid) . '" class="btn btn-sm btn-info me-1">Edit</a>';
                        } else {
                            $btn = '-';
                        }

                        return $btn;
                    } else {
                        return "-";
                    }
                })
                ->make();
        }
        return view('pages.ehay.status', compact('title'));
    }

    public function validation($uuid)
    {
        $item = Ehay::with(['employee.department'])->where('uuid', $uuid)->firstOrFail();
        // dd($item);
        if (in_array($item->status, [2, 4, 5]) || auth()->user()->email === "adminclaim2@gmail.com") {
            return redirect()->route('dashboard');
        }
        $title = 'Validasi Data Ehay';
        return view('pages.ehay.validation', compact('item', 'title'));
    }

    public function validation_process($uuid)
    {
        request()->validate([
            'notes' => [Rule::when(request('btn') == 0, 'required')],
        ]);
        // dd(request()->all());
        $item = Ehay::with(['employee.department'])->where('uuid', $uuid)->firstOrFail();
        try {
            $data = request()->only(['notes']);
            if (auth()->user()->role == 4) {
                // admin
                if (request('btn') == 0) {
                    // reject
                    // is closed dipilih
                    if (request('is_closed')) {
                        $item->update([
                            'status' => 0
                        ]);
                        $item->logStatus()->create([
                            'name' => 'Closed',
                            'status' => 0,
                            'notes' => request('notes'),
                        ]);
                    } else {
                        $item->update([
                            'status' => 2
                        ]);
                        $item->logStatus()->create([
                            'name' => 'Waiting for Revision',
                            'status' => 1,
                            'notes' => request('notes'),
                        ]);
                    }
                } else {
                    $item->update([
                        'status' => 3
                    ]);
                    $item->logStatus()->create([
                        'name' => 'Waiting for HCGS Officer Validation',
                        'status' => 1
                    ]);
                }
                return redirect()->route('ehay.status')->with('success', 'Data berhasil disimpan');
            } else if (auth()->user()->role == 5) {
                if (request('btn') == 0) {
                    // reject
                    $item->update([
                        'status' => 2
                    ]);
                    $item->logStatus()->create([
                        'name' => 'Waiting for Revision',
                        'status' => 1,
                        'notes' => request('notes'),
                    ]);
                } else {
                    $item->update([
                        'status' => 5
                    ]);
                    $item->logStatus()->create([
                        'name' => 'Dormant EHAY ready to draw',
                        'status' => 1
                    ]);
                }

                return redirect()->route('ehay.index')->with('success', 'Data berhasil disimpan');
            }
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('error', $th->getMessage());
        }
    }

    public function history(Request $request)
    {
        $title = 'History Ehay';
        $ehays = Ehay::where('status', 5)->latest()->limit(1000)->get();

        if ($request->ajax()) {
            $query = Ehay::latest()->where('status', 5);

            if ($request->from_date && $request->to_date) {

                if ($request->from_date && $request->to_date && $request->ehay_number) {
                    if ($request->ehay_number) {
                        $query->whereIn('id', (array) $request->ehay_number);
                    }
                } else {
                    if ($request->from_date) {
                        $query->whereDate('created_at', '>=', $request->from_date);
                    }

                    if ($request->to_date) {
                        $query->whereDate('created_at', '<=', $request->to_date);
                    }
                }
            } else {
                if ($request->ehay_number) {
                    $query->whereIn('id', (array) $request->ehay_number);
                }
            }
            $data = $query->limit(1000)->get();

            if (!$request->from_date && !$request->to_date && !$request->ehay_number) {
                $data = [];
            }


            return DataTables::of($data)
                ->addIndexColumn()
                ->addColumn('employee', function ($model) {
                    return $model->employee->nrp . ' - ' . $model->employee->name;
                })
                ->addColumn('action', function ($row) {
                    $btn = '<a href="' . route('ehay.show', $row->uuid) . '" class="btn btn-sm btn-warning me-1">Detail</a>';
                    return $btn;
                })
                ->editColumn('created_at', function ($model) {
                    return $model->created_at->translatedFormat('d/m/Y');
                })
                ->rawColumns(['action', 'checkbox', 'employee'])
                ->make(true);
        }

        return view('pages.ehay.history', compact('title', 'ehays'));
    }


    public function cust_history(Request $request)
    {
        $title = 'Data Ehay';

        if ($request->ajax()) {
            $data = Ehay::latest()->byRole()->limit(1000)->get();

            return DataTables::of($data)
                ->addIndexColumn()
                ->rawColumns(['action', 'checkbox', 'current_log_status'])
                ->addColumn('employee', function ($model) {
                    return $model->employee->nrp . ' - ' . $model->employee->name;
                })
                ->addColumn('current_log_status', function ($model) {
                    if ($model->status == 2) {
                        return $model->currentLogStatusCustomer() . '<br>' . '(' . $model->currentLogStatusData()->notes . ')';
                    } else {
                        return $model->currentLogStatusCustomer();
                    }
                })
                ->addColumn('action', function ($row) {

                    if ($row->status == 2) {
                        $btn = '<a href="' . route('ehay.show', $row->uuid) . '" class="btn btn-sm btn-warning me-1">Detail</a><a href="' . route('ehay.edit', $row->uuid) . '" class="btn btn-sm btn-info me-1">Edit</a>';
                    } else {
                        $btn = '<a href="' . route('ehay.show', $row->uuid) . '" class="btn btn-sm btn-warning me-1">Detail</a>';
                    }

                    return $btn;
                })
                ->make();
        }
        return view('pages.ehay.customer-list', compact('title'));
    }

    public function edit($uuid)
    {
        $title = 'Edit Data Ehay';
        $item = Ehay::where('uuid', $uuid)->firstOrFail();
        return view('pages.ehay.edit', compact('title', 'item'));
    }

    public function update($uuid)
    {
        // request()->validate([
        //     'notes' => ['nullable'],
        //     'file.*' => ['file', 'mimes:png,jpg,jpeg,pdf', 'max:5120'],
        //     'file' => ['nullable', 'array'],
        // ]);

        $item = Ehay::with(['details'])->where('uuid', $uuid)->firstOrFail();
        try {
            $data['status'] = 1;
            $data['nominal_total'] = $item->details->sum('nominal_total');
            $item->update($data);
            $item->logStatus()->create([
                'name' => 'Waiting for HCGS Admin Validation',
                'status' => 1
            ]);
            if (auth()->user()->role != 3) return redirect()->route('ehay.status')->with('success', 'Data berhasil direvisi.');
            return redirect()->route('ehay.customer-list')->with('success', 'Data berhasil direvisi.');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('error', $th->getMessage());
        }
    }

    public function approve($uuid)
    {
        request()->validate([
            'nominal' => ['required']
        ]);
        $item = Ehay::where('uuid', $uuid)->firstOrFail();
        try {
            $nominal = Str::replace('.', '', request('nominal'));

            if ($nominal > $item->nominal_total) {
                return back()->with('error', 'Nominal Approve tidak boleh melebihi nominal total');
            }

            $item->update([
                'status' => 5,
                'nominal_approve' => $nominal
            ]);
            $item->logStatus()->create([
                'name' => 'Dormant Ehay ready to draw',
                'status' => 1
            ]);
            return redirect()->route(route: 'ehay.status')->with('success', 'Data berhasil disetujui.');
        } catch (\Throwable $th) {
            //throw $th;
            return back()->with('error', $th->getMessage());
        }
    }

    public function getByIdJson()
    {
        if (request()->ajax()) {
            $uuid = request('id');
            $item = Ehay::with(['files'])->where('uuid', $uuid)->firstOrFail();
            return response()->json($item);
        }
    }

    public function exportExcel()
    {
        $status = request('status', '');
        $from_date = request('from_date', '');
        $to_date = request('to_date', '');
        $filter = [
            'from_date' => $from_date,
            'to_date' => $to_date,
            'status' => $status
        ];
        if ($status === 'ready') {
            $fileName = 'laporan-klaim-pengobatan-dan-perawatan-list-' . date('d-m-Y');
        } else {
            $fileName = 'laporan-klaim-pengobatan-dan-perawatan-status-' . date('d-m-Y');
        }
        return Excel::download(new EhayExport($filter), $fileName . '.xlsx');
    }

    public function exportPdf()
    {
        $status = request('status', '');
        $from_date = request('from_date', '');
        $to_date = request('to_date', '');


        $fileName = 'laporan-klaim-pengobatan-dan-perawatan-' . date('d-m-Y') . '.pdf';
        $data_ehay = Ehay::where('status', 5)->with(['details.files'])->latest();

        if (empty($from_date) && empty($to_date)) {
            return redirect()->back()->with('error', 'Pilih salah satu antara From Date dan To Date');
        }

        if ($data_ehay->count() == 0) {
            return redirect()->back()->with('error', 'Data tidak ditemukan');
        }
        $files = EhayFile::whereHas('ehay_detail', function ($query) use ($data_ehay) {
            $query->whereIn('ehay_id', $data_ehay->get()->pluck('id'));
        })->get();


        if ($from_date && $to_date) {
            $data_ehay->whereDate('created_at', '>=', $from_date)->whereDate('created_at', '<=', $to_date);
        } elseif ($from_date && !$to_date) {
            $data_ehay->whereDate('created_at', $from_date);
        }

        $data = $data_ehay->get();
        if ($from_date && $to_date) {
            $date = Carbon::parse($from_date)->translatedFormat('d-m-Y') . ' - ' . Carbon::parse($to_date)->translatedFormat('d-m-Y');
        } else {
            $date = Carbon::parse($from_date)->translatedFormat('d-m-Y');
        }

        $pdf = Pdf::loadView('pages.ehay.export-pdf', [
            'items' => $data,
            'files' => $files,
            'date' => $date
        ]);
        return $pdf->download($fileName);
    }


    public function list()
    {
        $title = 'Ehay List';
        return view('pages.ehay.list', compact('title'));
    }

    public function show($uuid)
    {
        $item = Ehay::with(['details.files'])->where('uuid', $uuid)->firstOrFail();
        $title = 'Detail Data';
        return view('pages.ehay.show', compact('title', 'item'));
    }
    public function validation_all_admin(Request $request)
    {
        $uuids = $request->ids;

        if (!$uuids || !is_array($uuids)) {
            return response()->json(['message' => 'Tidak ada data yang dipilih.'], 400);
        }
        foreach ($uuids as $uuid) {
            $item = Ehay::where('uuid', $uuid)->firstOrFail();

            if (auth()->user()->role == 4) {
                $item->update([
                    'status' => 3
                ]);
                $item->logStatus()->create([
                    'name' => 'Waiting for HCGS Officer Validation',
                    'status' => 3
                ]);
            } elseif (auth()->user()->role == 2) {
                $item->update([
                    'status' => 4
                ]);
                $item->logStatus()->create([
                    'name' => 'Waiting for Approval 1',
                    'status' => 4
                ]);
            }
        }

        return redirect()->back()->with('success', 'Data berhasil disetujui.');
    }
}
