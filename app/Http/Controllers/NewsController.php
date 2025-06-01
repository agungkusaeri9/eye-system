<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Sign;
use App\Models\SignDocument;
use App\Models\User;
use App\Models\Department;
use App\Mail\SignMail;

use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\File;
use Illuminate\Support\Facades\Link;
use Illuminate\Support\Facades\Mail;

use DB;

class NewsController extends Controller
{
    public function __construct()
    {
        $this->ccEmails = explode(',', env('MAIL_CC_ADDRESS'));
    }
    public function index(Request $request)
    {
        $title = 'Data Berita Acara';
        $month = $request->filter_bulan;
        if($month){
            $from = date('Y-m-01', strtotime($month));
            $until = date('Y-m-01', strtotime('+1month', strtotime($month)));
        }

        if($request->ajax()){
            if(\Auth::user()->role == 1) {
                if($month) $data = Sign::with(['from'])->where('type', 'news')->where('created_at', '>=', $from)->where('created_at', '<', $until)->limit(1000)->get();
                else $data = Sign::with(['from'])->where('type', 'news')->limit(1000)->get();
            }
            elseif(\Auth::user()->role == 2) {
                if($month) $sign = Sign::with(['from'])->where('type', 'news')->where('created_at', '>=', $from)->where('created_at', '<', $until)->limit(1000)->get();
                else $sign = Sign::with(['from'])->where('type', 'news')->limit(1000)->get();
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
                if($month) $data = Sign::with(['from'])->where('type', 'news')->where('from_id', \Auth::user()->id)->where('created_at', '>=', $from)->where('created_at', '<', $until)->limit(1000)->get();
                else $data = Sign::with(['from'])->where('type', 'news')->where('from_id', \Auth::user()->id)->limit(1000)->get();
            }
            return \DataTables::of($data)
                  ->addIndexColumn()
                  ->addColumn('tanggal_upload', function($row) {
                    return date('d-m-Y', strtotime($row['created_at']));
                  })
                  ->addColumn('file', function($row) {
                    return '<a href="' . asset('storage/' . $row['sign_file']) . '" target="__blank" class="btn btn-success"><i class="fas fa-eye me-2"></i>Lihat File</a>';
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
                  ->addColumn('action', function ($row) {
                    if(\Auth::user()->role == 2){
                        $btn = '<a href="' . route('news.show', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-eye"></i></a>';
                    } else {
                        $btn = '<a href="' . route('news.show', $row->id) . '" class="btn btn-sm btn-outline-warning me-1"><i class="fa fa-eye"></i></a>'.
                        '<form id="form-delete" action="'.route('news.destroy', $row->id).'" method="post" class="d-inline">
                        '.method_field('DELETE').'
                        '.csrf_field().'
                        <button type="button" class="btn btn-sm btn-outline-warning btn-delete"><i class="fas fa-trash"></i></button>
                        </form>';
                    }
                    return $btn;
                  })
                  ->rawColumns(['tanggal_upload', 'to', 'file', 'action'])
                  ->make();
        }

        return view('pages.news.index', compact('title', 'month'));
    }

    public function create(Request $request)
    {
        $title = 'Tambah Data Berita Acara';
        $sign = new Sign();
        $method = 'POST';
        $action = route('news.store');
        $user_to = User::where('role', 2)->get();

        return view('pages.news.form', compact('title','sign', 'method','action', 'user_to'));
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
            'news_name' => 'required',
            'to' => 'required',
            'news_file' => 'required'
        ]);

        try{
            DB::beginTransaction();

            $to = join(',', $request->to);

            $file = $request->file('news_file');
            $saveFile = time().'_'.$file->getClientOriginalName();
            Storage::disk('local')->put('/public/news/file/'.$saveFile, File::get($file));
            $namaFile = 'news/file/'.$saveFile;

            $sign_number = Sign::generateSignNumber();
            $signCreate = Sign::create([
                'sign_number' => $sign_number,
                'from_id' => \Auth::user()->id,
                'name' => $request->news_name,
                'sign_file' => $namaFile,
                'to_id' => $to,
                'type' => 'news'
            ]);

            if($request->file('supporting_file')){
                $support = $request->file('supporting_file');

                foreach($support as $sup){
                    $saveFilePendukung = time().'_'.$sup->getClientOriginalName();
                    Storage::disk('local')->put('/public/news/support/'.$saveFilePendukung, File::get($file));
                    $namaFilePendukung = 'news/support/'.$saveFilePendukung;

                    SignDocument::create([
                        'sign_id' => $signCreate->id,
                        'sign_document' => $namaFilePendukung
                    ]);
                }
            }

            foreach ($request->to as $toValidator) {
                $toValid = User::findOrFail($toValidator);
                if($toValid) Mail::to($toValid->email)
                                ->cc($this->ccEmails)
                                ->send(new SignMail('Notifikasi Data Berita Acara', $sign_number, $toValid->name, 'new', 'Berita Acara', null));
            }

            DB::commit();

            return redirect()->route('news.index')->with('success','Data berhasil ditambahkan');
        } catch (\Throwable $th) {
            DB::rollBack();
            return back()->with('error', $th->getMessage());
        }
    }

    public function show($id)
    {
        $title = 'Lihat Data Berita Acara';
        $news = Sign::with(['from', 'support'])->findOrFail($id);

        $to = explode(',', $news->to_id);
        $user = [];
        foreach($to as $t){
            $dataUser = User::with(['departemen','jabatan', 'distrik'])->findOrFail($t);
            $user[] = $dataUser;
        }

        if(\Auth::user()->role == 2) {
            if(!in_array(\Auth::user()->id, $to)) return redirect()->route('news.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        } elseif(\Auth::user()->role == 3) {
            if($news->from_id != \Auth::user()->id) return redirect()->route('news.index')->with('error', 'Anda tidak dapat melihat data tersebut');
        }
        return view('pages.news.show', compact('title','news', 'user'));
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
}
