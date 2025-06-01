@extends('layouts.master', ['title' => $title])
@section('content')

<style>
    .dt-row{
        overflow-x: scroll;
        white-space: nowrap;
        margin: 10px 0;
    }
    .dt-row::-webkit-scrollbar{
        height: 5px;
    }
    .dt-row::-webkit-scrollbar-thumb{
        background-color: #D4D4D4;
        border-radius: 10px;
    }
    .dt-row::-webkit-scrollbar-track{
        background-color: #f5f5f5;
        border-radius: 10px;
    }
</style>

<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">{{ $title }} </span>
</h4>
<!-- DataTable with Buttons -->
<div class="card">
    @if(\Auth::user()->role == 3)
        <div class="card-header pb-0">
            <a class="btn btn-primary " href="{{route('sign.create')}}"><i class="ti ti-plus me-1"></i>  <span>Tambah E-Sign</span></a>
        </div>
    @endif
    <div class="card-datatable pt-0">
        <div class="container">
            <div class="w-100 mt-4">
                <label>Filter berdasarkan bulan :</label>
                <form class="d-flex align-items-center">
                    <input type="month" class="form-control" name="filter_bulan" value="{{ $month }}" />
                    <button type="submit" class="btn btn-primary ms-2"><i class="fas fa-filter"></i></button>
                </form>
            </div>
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>ID E-Sign</th>
                        <th>Tanggal Upload</th>
                        <th>Nama Pengirim</th>
                        <th>Judul</th>
                        <th>Ditujukan Ke</th>
                        {{-- <th>Status Berita Acara</th> --}}
                        <th>Status Verifikasi</th>
                        <th>Status Akhir</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
</div>
<input type="hidden" name="role" value="{{ Auth::user()->role }}">
@endsection

@section('page-script')
<script src="{{asset('assets/js/tables-datatables-basic.js')}}"></script>
<script>
  $(document).ready(function(){
    var table = $('#dataTable').DataTable({
      ajax: {
          url: "{{route('sign.index')}}?filter_bulan={{ $month }}",
          type: "GET",
      },
      processing: true,
      serverSide: true,
      columnDefs: [{
              "defaultContent": "-",
              "targets": "_all"
          },
      ],
      order: [
          [0, 'DESC']
      ],
      columns: [
        {
            data: 'DT_RowIndex',
            name: 'DT_RowIndex'
        },
        {
            data: 'sign_number',
            name: 'sign_number'
        },
        {
            data: 'tanggal_upload',
            name: 'tanggal_upload'
        },
        {
            data: 'from.name',
            name: 'from.name'
        },
        {
            data: 'name',
            name: 'name'
        },
        {
            data: 'to',
            name: 'to'
        },
        // {
        //     data: 'news',
        //     name: 'news'
        // },
        {
            data: 'verif',
            name: 'verif'
        },
        {
            data: 'last_status',
            name: 'last_status'
        },
        {
            data: 'action',
            name: 'action'
        }
      ],
  });


  })
</script>
@endsection
