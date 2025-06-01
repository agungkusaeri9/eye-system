@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-header pb-0">
            <a class="btn btn-success " href="{{ route('ehay.export-excel') }}">
                <span>Export</span></a>
        </div>
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Ehay Number</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="modalApprove" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Approve</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" id="formApprove" method="post">
                    <div class="modal-body">
                        @csrf

                        <div class='form-group mb-3'>
                            <label for='total' class='mb-2'>Nominal Total</label>
                            <input type='text' name='total' id='total' disabled
                                class='form-control @error('total') is-invalid @enderror'>
                        </div>
                        <div class='form-group mb-3'>
                            <label for='nominal' class='mb-2'>Nominal Disetujui</label>
                            <input type='text' name='nominal' id='nominal'
                                class='form-control @error('nominal') is-invalid @enderror nominal'>
                            @error('nominal')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Approve Claim</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
    <script>
        $(document).ready(function() {
            var table = $('#dataTable').DataTable({
                ajax: {
                    url: "{{ route('ehay.status') }}",
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
                columns: [{
                        data: 'DT_RowIndex',
                        name: 'DT_RowIndex',
                        orderable: true,
                        searchable: true
                    },

                    {
                        data: 'code',
                        name: 'code'
                    },
                    {
                        data: 'description',
                        name: 'description'
                    },
                    {
                        data: 'current_log_status',
                        name: 'current_log_status'
                    },
                    {
                        data: 'action',
                        name: 'action'
                    },
                ],
            });

            function formatRupiah(angka) {
                let reverse = angka.toString().split('').reverse().join('');
                let ribuan = reverse.match(/\d{1,3}/g);
                return ribuan.join('.').split('').reverse().join('');
            }

            $('body').on('click', '.btn-approve', function() {
                let id = $(this).data('id');
                let route = '{{ route('ehay.approve', ['id' => ':id']) }}';
                route = route.replace(':id', id);
                $('#formApprove').attr('action', route);
                $.ajax({
                    url: '{{ route('ehay.getByIdJson') }}',
                    type: 'GET',
                    dataType: 'JSON',
                    data: {
                        id
                    },
                    success: function(data) {
                        $('#total').val(formatRupiah(data.nominal_total));
                        $('#nominal').val(formatRupiah(data.nominal_total));
                    },
                    error: function(err) {
                        console.log("error", err);
                    }
                })
                $('#modalApprove').modal('show');
            });

            $('.nominal').on('input', function() {
                let value = this.value.replace(/\D/g, '');
                value = new Intl.NumberFormat('id-ID').format(value);
                this.value = value;
            })
        })
    </script>
@endsection
