@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-header pb-0">
            <a class="btn btn-warning " href="{{ route('karyawan.index') }}"><i class="ti ti-arrow-left me-1"></i>
                <span>Kembali</span></a>
            <a class="btn btn-primary "
                href="{{ route('family.create', [
                    'employee_id' => request('employee_id'),
                ]) }}"><i
                    class="ti ti-plus me-1"></i> <span>Tambah
                    Keluarga</span></a>
        </div>
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>NRP</th>
                        <th>Nama Karyawan</th>
                        <th>Nama Anggota</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
    <script>
        $(document).ready(function() {
            var table = $('#dataTable').DataTable({
                ajax: {
                    url: "{{ route('family.index') }}",
                    type: "GET",
                    data: function(d) {
                        d.employee_id = "{{ request('employee_id') }}";
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
                columns: [{
                        data: 'employee_nrp',
                        name: 'employee_nrp'
                    },
                    {
                        data: 'employee_name',
                        name: 'employee_name'
                    },
                    {
                        data: 'name',
                        name: 'name'
                    },

                    {
                        data: 'relation',
                        name: 'relation'
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
