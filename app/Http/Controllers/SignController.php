<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\Sign;
use App\Models\SignDocument;
use App\Models\User;
use App\Models\Department;
use App\Models\SignHistory;
use App\Models\SignLog;

use App\Mail\SignMail;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Link;
use Illuminate\Support\Facades\Mail;

use PDF, DB;

class SignController extends Controller
{
    public function __construct()
    {
        $this->ccEmails = explode(',', env('MAIL_CC_ADDRESS'));
    }
    public function index(Request $request)
    {
        $month = $request->filter_bulan;
        if($month){
            $from = date('Y-m-01', strtotime($month));
            $until = date('Y-m-01', strtotime('+1month', strtotime($month)));
        }

        $title = 'Data E-Sign';
        if($request->ajax()){
            if(\Auth::user()->role == 1) {
                if($month) $data = Sign::with(['from'])->where('type', 'e-sign')->limit(1000)->where('created_at', '>=', $from)->where('created_at', '<', $until)->get();

                else $data = Sign::with(['from'])->where('type', 'e-sign')->limit(1000)->get();
            }
            elseif(\Auth::user()->role == 2) {
                if($month) $sign = Sign::with(['from'])->where('type', 'e-sign')->limit(1000)->where('created_at', '>=', $from)->where('created_at', '<', $until)->get();
                else $sign = Sign::with(['from'])->where('type', 'e-sign')->limit(1000)->get();
                $data = [];
                foreach($sign as $indexSg => $sg) {
                    $arrayData = explode(',', $sg['to_id']);
                    if(count($arrayData) > 0) {
                        foreach($arrayData as $dataToId) {
                            if($dataToId == \Auth::user()->id) $data[] = $sign[$indexSg];
                        }
                    }
                }
            }
            elseif(\Auth::user()->role == 3) {
                if($month) $data = Sign::with(['from'])
                                        ->where('type', 'e-sign')
                                        ->where('from_id', \Auth::user()->id)
                                        ->where('created_at', '>=', $from)
                                        ->where('created_at', '<', $until)
                                        ->limit(1000)
                                        ->get();
                else $data = Sign::with(['from'])->where('type', 'e-sign')->where('from_id', \Auth::user()->id)->limit(1000)->get();
            }
            return \DataTables::of($data)
                  ->addIndexColumn()
                  ->addColumn('tanggal_upload', function($row) {
                    return date('d-m-Y H:i', strtotime($row['created_at']));
                  })
                  ->addColumn('to', function($row) {
                    $departData = [];
                    $arrayData = explode(',', $row['to_id']);

                    if(count($arrayData) > 0) {
                        foreach($arrayData as $dataToId) {
                            $findUser = User::with(['departemen'])->findOrFail($dataToId);
                            if($findUser) {
                                $departData[] = $findUser->name.' - '.$findUser->departemen->name;
                            }
                        }
                    }
                    return implode('<br />', $departData);
                  })
                  ->addColumn('news', function($row) {
                    if($row['sign'] == 'Pending') return '<span class="btn btn-outline-warning py-2 px-3 rounded-pill"><em>Pending</em></span>';
                    elseif($row['sign'] == 'Ditolak') return '<span class="btn btn-outline-danger py-2 px-3 rounded-pill"><em>Ditolak</em></span>';
                    elseif($row['sign'] == 'Diterima') return '<span class="btn btn-outline-success py-2 px-3 rounded-pill"><em>Diterima</em></span>';
                  })
                  ->addColumn('verif', function($row) {
                    if($row['signature'] == 'Pending') return '<span class="btn btn-outline-warning py-2 px-3 rounded-pill"><em>Pending</em></span>';
                    elseif($row['signature'] == 'Ditolak') return '<span class="btn btn-outline-danger py-2 px-3 rounded-pill"><em>Ditolak</em></span>';
                    elseif($row['signature'] == 'Diterima') return '<span class="btn btn-outline-success py-2 px-3 rounded-pill"><em>Diterima</em></span>';
                  })
                  ->addColumn('last_status', function($row) {
                    if($row['status'] == 'Pending') return '<span class="btn btn-outline-warning py-2 px-3 rounded-pill"><em>In Process</em></span>';
                    elseif($row['status'] == 'Closed') return '<span class="btn btn-outline-danger py-2 px-3 rounded-pill"><em>Closed</em></span>';
                  })
                  ->addColumn('action', function ($row) {

                    $show = '<a href="' . route('sign.show', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-eye"></i></a>';
                    $edit = '<a href="' . route('sign.edit', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-edit"></i></a>';
                    $delete =   '<form id="form-delete" action="'.route('sign.destroy', $row->id).'" method="post" class="d-inline">
                                '.method_field('DELETE').'
                                '.csrf_field().'
                                <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                                </form>';

                    if(\Auth::user()->role == 3){
                        if(($row['sign'] == 'Ditolak') || ($row['signature'] == 'Ditolak')){
                            $btn = $show.$edit.$delete;
                        } elseif($row['status'] == 'Closed' ){
                            $btn = $show;
                        }else {
                            $btn = $show.$delete;
                        }
                    } elseif(\Auth::user()->role == 2){
                        $btn = $show;
                    } else {
                        $btn = $show.$delete;
                    }

                      return $btn;
                  })
                  ->rawColumns(['tanggal_upload', 'news', 'verif', 'to', 'last_status', 'action'])
                  ->make();
        }

        return view('pages.sign.index', compact('title', 'month'));
    }

    public function create(Request $request)
    {
        $title = 'Tambah Data E-Sign';
        $sign = new Sign();
        $method = 'POST';
        $action = route('sign.store');
        $user_to = User::where('role', 2)->get();

        return view('pages.sign.form', compact('title','sign', 'method','action', 'user_to'));
    }

    public function findUser(Request $request)
    {
        if($request->ajax()){
            if($request->id){
                $data = User::with(['departemen','jabatan', 'distrik'])->find($request->id);
                return response()->json($data);
            } else {
                $search = $request->input('search');
                $data = User::with(['departemen','jabatan', 'distrik'])
                                ->where('role', 2)
                                ->where('status', 'Aktif')
                                ->where('name', 'like', "%".$search."%")
                                ->get();
                return response()->json($data);
            }
        }
    }

    public function store(Request $request)
    {
        $request->validate([
            'e_sign_name' => 'required',
            'validator_data' => 'required',
            'news_file' => 'required',
            'verification_file' => 'required',
        ]);

        try{
            DB::beginTransaction();

            $to_data = [];
            $valid_data = json_decode($request->validator_data);

            foreach($valid_data as $vd){
                $to_data[] = $vd->id;
            }

            $to = join(',', $to_data);

            $file = $request->file('news_file');
            $saveFile = time().'_'.$file->getClientOriginalName();
            Storage::disk('local')->put('/public/sign/file/'.$saveFile, File::get($file));
            $namaFile = 'sign/file/'.$saveFile;

            $fileVerification = $request->file('verification_file');
            $saveFileVerification = time().'_'.$fileVerification->getClientOriginalName();
            Storage::disk('local')->put('/public/sign/verification/'.$saveFileVerification, File::get($fileVerification));
            $namaFileVerifikasi = 'sign/verification/'.$saveFileVerification;

            $sign_number = Sign::generateSignNumber();

            $signCreate = Sign::create([
                'sign_number' => $sign_number,
                'from_id' => \Auth::user()->id,
                'name' => $request->e_sign_name,
                'sign_file' => $namaFile,
                'verified_sign_file' => $namaFileVerifikasi,
                'to_id' => $to,
                'type' => 'e-sign',
                'status' => 'Pending',
                'sign' => 'Diterima',
                'signature' => 'Pending',
            ]);

            if($request->file('supporting_file')){
                $support = $request->file('supporting_file');

                foreach($support as $sup){
                    $saveFilePendukung = time().'_'.$sup->getClientOriginalName();
                    Storage::disk('local')->put('/public/sign/support/'.$saveFilePendukung, File::get($file));
                    $namaFilePendukung = 'sign/support/'.$saveFilePendukung;

                    SignDocument::create([
                        'sign_id' => $signCreate->id,
                        'sign_document' => $namaFilePendukung
                    ]);
                }
            }

            foreach ($valid_data as $toValidator) {
                $toValid = User::findOrFail($toValidator->id);

                $makeData = SignHistory::firstOrCreate([
                    'validator_id' => $toValidator->id,
                    'sign_id' => $signCreate->id,
                    'news_status' => 'Diterima',
                    'note_customer' => $toValidator->catatan
                ]);

                if($toValid) Mail::to($toValid->email)
                                ->cc($this->ccEmails)
                                ->send(new SignMail('Notifikasi Data E-Sign', $sign_number, $toValid->name, 'new', 'E-Sign', $toValidator->catatan));
            }

            $this->createSignLog($signCreate->id, 'Dokumen E-Sign telah dikirim', 'E-Sign dikirim oleh user dengan nama '.\Auth::user()->name);

            DB::commit();

            return redirect()->route('sign.index')->with('success','Data berhasil ditambahkan');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function show($id)
    {
        $title = 'Lihat Data E-Sign';
        $sign = Sign::with(['from', 'support'])->findOrFail($id);
        $to = explode(',', $sign->to_id);
        $user = [];
        foreach($to as $t){
            $dataUser = User::with(['departemen','jabatan', 'distrik'])->findOrFail($t);
            $user[] = $dataUser;
        }

        $log = SignLog::orderByDesc('id')->where('sign_id', $id)->get();

        if(\Auth::user()->role == 2) {
            if(!in_array(\Auth::user()->id, $to)) return redirect()->route('sign.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        } elseif(\Auth::user()->role == 3) {
            if($sign->from_id != \Auth::user()->id) return redirect()->route('sign.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        }

        $checkAllHistory = \App\Models\SignHistory::where('sign_id', $sign->id)->get();
        $historyData = [];
        $index = 0;
        foreach ($checkAllHistory as $ind => $all) {
            if($all->validator_id == \Auth::user()->id) $index = $ind-1;
        }

        if($index < 0){
            $checkHistory = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();
        } else {
            if($checkAllHistory[$index]->sign_status !== 'Diterima'){
                $checkHistory = null;
            } else {
                $checkHistory = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();
            }
        }

        $getHistoryData = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();


        return view('pages.sign.show', compact('title','sign', 'user', 'log', 'checkHistory', 'getHistoryData'));
    }

    public function edit($id)
    {
        $title = 'Edit Data E-Sign';
        $sign = Sign::with(['support'])->findOrFail($id);
        $span = $sign->sign == 'Ditolak' ? 'Berita Acara Ditolak' : ($sign->signature == 'Ditolak' ? 'File Verifikasi Ditolak' : '');
        $user = [];
        foreach (explode(',', $sign->to_id) as $key => $sg) {
            $userData = User::with(['departemen','jabatan', 'distrik'])->findOrFail($sg);
            $getHistory = SignHistory::where('validator_id', $userData->id)->where('sign_id', $id)->first();
            $user[] = [
                'id' => "".$userData->id,
                'name' => $userData->name,
                'position' => $userData->jabatan->name,
                'department' => $userData->departemen->name,
                'district' => $userData->distrik->name,
                'catatan' => $getHistory->note_customer
            ];
        }

        $user_data = json_encode($user);
        $userGet = explode(',', $sign->to_id);
        $method = 'POST';
        $action = route('sign.update', $sign->id);
        $user_to = User::where('role', 2)->get();

        return view('pages.sign.edit', compact('title','sign', 'span', 'user', 'method','action', 'user_to', 'userGet', 'user_data'));
    }

    public function update(Request $request, $id)
    {
        $sign = Sign::findOrFail($id);
        $fromUser = User::findOrFail($sign->from_id);

        if($sign->sign == 'Ditolak'){
            $request->validate([
                'e_sign_name' => 'required',
                'news_file' => 'required',
                'validator_data' => 'required',
            ]);
        }

        if($sign->signature == 'Ditolak'){
            $request->validate([
                'e_sign_name' => 'required',
                'verification_file' => 'required',
                'validator_data' => 'required',
            ]);
        }

        try{
            DB::beginTransaction();

            SignHistory::where('sign_id', $id)
                                    ->delete();

            $to_data = [];
            $valid_data = json_decode($request->validator_data);

            foreach($valid_data as $vd){
                $to_data[] = $vd->id;
            }

            $to = join(',', $to_data);

            if($request->file('news_file')){
                $file = $request->file('news_file');
                $saveFile = time().'_'.$file->getClientOriginalName();
                Storage::disk('local')->put('/public/sign/file/'.$saveFile, File::get($file));
                $namaFile = 'sign/file/'.$saveFile;
            } else {
                $namaFile = $sign->sign_file;
            }

            if($request->file('verification_file')){
                $fileVerification = $request->file('verification_file');
                $saveFileVerification = time().'_'.$fileVerification->getClientOriginalName();
                Storage::disk('local')->put('/public/sign/verification/'.$saveFileVerification, File::get($fileVerification));
                $namaFileVerifikasi = 'sign/verification/'.$saveFileVerification;
            } else {
                $namaFileVerifikasi = $sign->verified_sign_file;
            }


            if($sign->sign == 'Ditolak'){
                $signCreate = $sign->update([
                    'name' => $request->e_sign_name,
                    'sign_file' => $namaFile,
                    'verified_sign_file' => $namaFileVerifikasi,
                    'to_id' => $to,
                    'status' => 'Pending',
                    'sign' => 'Pending',
                ]);
            }

            if($sign->signature == 'Ditolak'){
                $signCreate = $sign->update([
                    'name' => $request->e_sign_name,
                    'sign_file' => $namaFile,
                    'verified_sign_file' => $namaFileVerifikasi,
                    'to_id' => $to,
                    'status' => 'Pending',
                    'signature' => 'Pending',
                ]);
            }

            if($request->file('supporting_file')){
                $support = $request->file('supporting_file');

                foreach($support as $sup){
                    $saveFilePendukung = time().'_'.$sup->getClientOriginalName();
                    Storage::disk('local')->put('/public/sign/support/'.$saveFilePendukung, File::get($file));
                    $namaFilePendukung = 'sign/support/'.$saveFilePendukung;

                    SignDocument::create([
                        'sign_id' => $id,
                        'sign_document' => $namaFilePendukung
                    ]);
                }
            }

            foreach ($valid_data as $toValidator) {
                $toValid = User::findOrFail($toValidator->id);

                $makeData = SignHistory::firstOrCreate([
                    'validator_id' => $toValidator->id,
                    'sign_id' => $id,
                    'news_status' => 'Diterima',
                    'note_customer' => $toValidator->catatan
                ]);

                if($toValid) Mail::to($toValid->email)
                                ->cc($this->ccEmails)
                                ->send(new SignMail('Notifikasi Data Dikembalikan', $sign->sign_number, $fromUser->name, 'return', 'E-Sign',$toValidator->catatan));
            }

            $this->createSignLog($id, 'Dokumen E-Sign telah diupdate', 'E-Sign diupdate oleh user dengan nama '.\Auth::user()->name);

            DB::commit();

            return redirect()->route('sign.index')->with('success','Data berhasil diperbarui');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function destroy($id)
    {
        try {
            DB::beginTransaction();

            Sign::findOrFail($id)->delete();

            DB::commit();
            return redirect()->route('news.index')->with('success','Data berhasil dihapus');

        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function action(Request $request, $id, $type, $action)
    {
        try{
            DB::beginTransaction();

            if($type == 'sign'){
                $sign = Sign::findOrFail($id);
                $fromUser = User::findOrFail($sign->from_id);
                $getData = SignHistory::where('validator_id', \Auth::user()->id)
                                    ->where('sign_id', $id)
                                    ->first();
                if($action == 'terima') {
                    if($getData){
                        $makeData = SignHistory::find($getData->id)
                                                ->update([
                                                    'news_status' => 'Diterima',
                                                    'approved_news_date' => now(),
                                                ]);
                    } else {
                        $makeData = SignHistory::firstOrCreate([
                            'validator_id' => \Auth::user()->id,
                            'sign_id' => $id,
                            'news_status' => 'Diterima',
                            'approved_news_date' => now(),
                        ]);
                    }

                    $signCheck = SignHistory::where('sign_id', $id)->get();
                    $to_count = explode(',', $sign->to_id);
                    if(count($signCheck) == count($to_count)) {
                        $checkDataDiterima = [];
                        foreach($signCheck as $sc) {
                            $checkDataDiterima[] = $sc->news_status;
                        }

                        $filterCheck = array_filter($checkDataDiterima, function($value) {
                            return $value !== 'Diterima';
                        });

                        if(empty($filterCheck)){
                            $sign->update([
                                'sign' => 'Diterima',
                                'alasan_ditolak' => null
                            ]);
                        }
                    }

                    if($makeData && $fromUser) Mail::to($fromUser->email)
                                                    ->cc($this->ccEmails)
                                                    ->send(new SignMail('Notifikasi Data Diterima', $sign->sign_number, $fromUser->name, 'accept', 'E-Sign',  \Auth::user()->name));

                    $this->createSignLog($id, 'Berita acara diterima oleh validator dengan nama '.\Auth::user()->name, 'Dokumen berita acara dalam E-Sign telah diterima');
                } else {
                    if($getData){
                        $makeData = SignHistory::find($getData->id)
                                                ->update([
                                                    'news_status' => 'Ditolak',
                                                    'rejected_reason' => $request->alasan_ditolak,
                                                ]);
                    } else {
                        $makeData = SignHistory::firstOrCreate([
                            'validator_id' => \Auth::user()->id,
                            'sign_id' => $id,
                            'news_status' => 'Ditolak',
                            'rejected_reason' => $request->alasan_ditolak,
                        ]);
                    }

                    $sign->update([
                        'sign' => 'Ditolak',
                        'alasan_ditolak' => $request->alasan_ditolak
                    ]);

                    if($makeData && $fromUser) Mail::to($fromUser->email)
                                                ->cc($this->ccEmails)
                                                ->send(new SignMail('Notifikasi Data Ditolak', $sign->sign_number,\Auth::user()->name, 'reject', 'E-Sign', null));
                    $this->createSignLog($id, 'Berita acara ditolak oleh validator dengan nama '.\Auth::user()->name, $request->alasan_ditolak ? $request->alasan_ditolak : 'Dokumen E-sign telah ditolak');
                }
            } else {
                $sign = Sign::findOrFail($id);
                $fromUser = User::findOrFail($sign->from_id);
                $getData = SignHistory::where('validator_id', \Auth::user()->id)
                                    ->where('sign_id', $id)
                                    ->first();

                if($action == 'tolak') {
                    $makeData = SignHistory::find($getData->id)
                                                ->update([
                                                    'sign_status' => 'Ditolak',
                                                    'rejected_reason' => $request->alasan_ditolak,
                                                ]);
                    $sign->update([
                        'signature' => 'Ditolak',
                        'alasan_ditolak' => $request->alasan_ditolak
                    ]);
                    if($makeData && $fromUser) Mail::to($fromUser->email)
                                                    ->cc($this->ccEmails)
                                                    ->send(new SignMail('Notifikasi Data Ditolak', $sign->sign_number,\Auth::user()->name, 'reject', 'E-Sign', null));
                    $this->createSignLog($id, 'E-Sign ditolak oleh validator dengan nama '.\Auth::user()->name, $request->alasan_ditolak);
                }
            }

            DB::commit();

            return response()->json([
                'message' => 'Data berhasil disimpan'
            ], 200);
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function getSupportDocument($id)
    {
        $data = SignDocument::where('sign_id', $id)->get();
        return response()->json($data);
    }

    public function deleteSuportDocument($id)
    {
        $delete = SignDocument::findOrFail($id)->delete();
        return response()->json(['message' => 'Data berhasil dihapus']);
    }

    public function showDocument($id)
    {
        $sign = Sign::findOrFail($id);
        return view('pages.sign.document-show', compact('sign'));
    }

    public function saveDocument(Request $request, $id)
    {
        $sign = Sign::findOrFail($id);
        $fromUser = User::findOrFail($sign->from_id);
        $getData = SignHistory::where('validator_id', \Auth::user()->id)
                                    ->where('sign_id', $id)
                                    ->first();

        try{
            DB::beginTransaction();

            $signCheck = SignHistory::where('sign_id', $id)->get();
            $to_count = explode(',', $sign->to_id);
            $dataSend = [];

            if(count($signCheck) == count($to_count)) {
                $fileVerification = $request->file('pdf');
                $saveFileVerification = time().'_'.$fileVerification->getClientOriginalName();
                Storage::disk('local')->put('/public/sign/verification/'.$saveFileVerification, File::get($fileVerification));
                $namaFileVerifikasi = 'sign/verification/'.$saveFileVerification;

                $makeData = SignHistory::find($getData->id)
                                    ->update([
                                        'sign_status' => 'Diterima',
                                        'approved_sign_date' => now(),
                                        'accepted_note' => $request->catatan_diterima
                                    ]);
                $checkDataDiterima = [];
                foreach($signCheck as $sc) {
                    $checkDataDiterima[] = $sc->sign_status;
                }

                $filterCheck = array_filter($checkDataDiterima, function($value) {
                    return $value !== 'Diterima';
                });

                if(count($filterCheck) > 1){
                    $dataSend = [
                        'verified_sign_file' => $namaFileVerifikasi,
                    ];
                } else {
                    $dataSend = [
                        'verified_sign_file' => $namaFileVerifikasi,
                        'status' => 'Closed',
                        'signature' => 'Diterima',
                    ];
                    Mail::to($fromUser->email)->cc($this->ccEmails)->send(new SignMail('Notifikasi Data Diterima', $sign->sign_number, $fromUser->name, 'closed', 'E-Sign',  \Auth::user()->name));
                }
            }
            $signCreate = Sign::find($id)->update($dataSend);

            if($makeData && $fromUser) Mail::to($fromUser->email)->cc($this->ccEmails)->send(new SignMail('Notifikasi Data Diterima', $sign->sign_number, $fromUser->name, 'accept', 'E-Sign',  \Auth::user()->name));

            $this->createSignLog($id, 'E-Sign diterima oleh validator dengan nama '.\Auth::user()->name, $request->catatan_diterima ? $request->catatan_diterima : 'Dokumen E-sign telah diterima');

            if(isset($dataSend['status']) && $dataSend['status'] == 'Closed') $this->createSignLog($id, 'E-Sign telah ditutup', 'Dokumen E-sign telah ditutup');

            DB::commit();

            return response()->json(['message' => 'Data berhasil diperbarui']);
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function createSignLog($signId, $title, $mess)
    {
        return SignLog::firstOrCreate([
            'sign_id' => $signId,
            'log_title' => $title,
            'log_description' => $mess,
        ]);
    }

    public function print($id)
    {
        $sign = Sign::with(['from', 'support'])->findOrFail($id);

        if(\Auth::user()->role == 2) return redirect(route('sign.index'))->with('error', 'Anda tidak dapat mengakses halaman ini');

        $to = explode(',', $sign->to_id);
        $user = [];
        foreach($to as $t){
            $dataUser = User::with(['departemen','jabatan', 'distrik'])->findOrFail($t);
            $user[] = $dataUser;
        }

        $log = SignLog::orderByDesc('id')->where('sign_id', $id)->get();

        if(\Auth::user()->role == 2) {
            if(!in_array(\Auth::user()->id, $to)) return redirect()->route('sign.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        } elseif(\Auth::user()->role == 3) {
            if($sign->from_id != \Auth::user()->id) return redirect()->route('sign.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        }

        $checkAllHistory = \App\Models\SignHistory::where('sign_id', $sign->id)->get();
        $historyData = [];
        $index = 0;
        foreach ($checkAllHistory as $ind => $all) {
            if($all->validator_id == \Auth::user()->id) $index = $ind-1;
        }

        if($index < 0){
            $checkHistory = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();
        } else {
            if($checkAllHistory[$index]->sign_status !== 'Diterima'){
                $checkHistory = null;
            } else {
                $checkHistory = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();
            }
        }

        $getHistoryData = \App\Models\SignHistory::where('sign_id', $sign->id)
                                            ->where('validator_id', \Auth::user()->id)
                                            ->first();

        $data = [
            'sign' => $sign,
            'user' => $user, $log, $checkHistory, $getHistoryData
        ];
        $pdf = PDF::loadView('pages.sign.print', $data);
        return $pdf->stream('e-sign.pdf');
    }
}
