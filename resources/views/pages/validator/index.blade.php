@extends('layouts.master', ['title' => $title])
@section('content')
<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">{{ $title }}  </span>
</h4>
<!-- DataTable with Buttons -->
<div class="card">
    <div class="card-header pb-0">
      <a class="btn btn-primary " href="{{route('validator.create')}}"><i class="ti ti-plus me-1"></i>  <span>Tambah Validator</span></a>
    </div>
    <div class="card-datatable table-responsive pt-0">
        <table class="table" id="dataTable">
            <thead>
                <tr>
                    <th>No</th>
                    <th>NRP</th>
                    <th>Nama Validator</th>
                    <th>Email</th>
                    <th>Jabatan</th>
                    <th>Departemen</th>
                    <th>Distrik</th>
                    <th>Status</th>
                    <th>Action</th>
                </tr>
            </thead>
        </table>
    </div>
</div>
@endsection

@section('page-script')
<script src="{{asset('assets/js/tables-datatables-basic.js')}}"></script>
<script>


  $(document).ready(function(){
    var table = $('#dataTable').DataTable({
      ajax: {
          url: "{{route('validator.index')}}",
          type: "GET",
          data: function(d) {
              // d._user = $('#user').val(),
              // d._start_date = $('#start_date').val(),
              // d._end_date = $('#end_date').val()

          }
      },
      processing: true,
      serverSide: true,
      columnDefs: [{
              "defaultContent": "-",
              "targets": "_all"
          },

      ],
      order: [
          [0, 'ASC']
      ],
      columns: [
          {
              data: 'DT_RowIndex',
              name: 'DT_RowIndex'
          },

          {
              data: 'nrp',
              name: 'nrp'
          },

          {
              data: 'name',
              name: 'name'
          },
          {
              data: 'email',
              name: 'email'
          },
          {
              data: 'jabatan.name',
              name: 'jabatan.name'
          },
          {
              data: 'departemen.name',
              name: 'departemen.name'
          },
          {
              data: 'distrik.name',
              name: 'distrik.name'
          },
          {
              data: 'status',
              name: 'status'
          },
          {
              data: 'action',
              name: 'action'
          },
      ],
  });


  })
</script>
@endsection
