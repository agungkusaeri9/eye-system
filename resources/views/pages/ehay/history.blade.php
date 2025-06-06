@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="card mb-5">
        <div class="card-body p-4">
            <form action="">
                <div class="row">
                    <div class="col-xl-6 col-md- col-sm-12">
                        <div class='form-group mb-3'>
                            <label for='from_date' class='mb-2'>Form</label>
                            <input type='date' name='from_date' id='from_date'
                                class='form-control @error('from_date') is-invalid @enderror'
                                value='{{ old('from_date') }}'>
                            @error('from_date')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="col-xl-6 col-md- col-sm-12">
                        <div class='form-group mb-3'>
                            <label for='to_date' class='mb-2'>To</label>
                            <input type='date' name='to_date' id='to_date'
                                class='form-control @error('to_date') is-invalid @enderror' value='{{ old('to_date') }}'>
                            @error('to_date')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-md- col-sm-12">
                        <div class='form-group mb-3'>
                            <label for='ehay_number' class="mb-2">Draw Base On</label>
                            <select name='ehay_number[]' id='ehay_number'
                                class='form-control @error('ehay_number') is-invalid @enderror' multiple>
                                <option value='' disabled>Pilih Ehay Number</option>
                                @foreach ($ehays as $ehay)
                                    <option @selected(in_array($ehay->id, old('ehay_number', []))) value='{{ $ehay->id }}'>{{ $ehay->code }}
                                    </option>
                                @endforeach
                            </select>
                            @error('ehay_number')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-xl-6 col-md- col-sm-12 mb-3">
                        <div class='form-group mb-3'>
                            <button class="btn btn-success">Process</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>Tanggal</th>
                        <th>Number</th>
                        <th>Employee</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    @endsection
    @section('page-script')
        <script src="{{ asset('assets/vendor/libs/select2/select2.js') }}"></script>
        <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
        <script>
            $(document).ready(function() {
                $('#ehay_number').select2({
                    placeholder: 'Pilih Ehay Number'
                });
                var table = $('#dataTable').DataTable({
                    ajax: {
                        url: "{{ route('ehay.history') }}",
                        type: "GET",
                        data: function(d) {
                            d.from_date = $('#from_date').val();
                            d.to_date = $('#to_date').val();
                            d.ehay_number = $('#ehay_number').val();
                        }
                    },
                    processing: true,
                    serverSide: true,
                    columnDefs: [{
                        "defaultContent": "-",
                        "targets": "_all"
                    }],
                    order: [
                        [0, 'ASC']
                    ],
                    columns: [{
                            data: 'created_at',
                            name: 'created_at'
                        },
                        {
                            data: 'code',
                            name: 'code'
                        },
                        {
                            data: 'employee',
                            name: 'employee'
                        },
                        {
                            data: 'action',
                            name: 'action'
                        }
                    ]
                });

                // Saat tombol "Process" diklik, reload DataTable
                $('form').on('submit', function(e) {
                    e.preventDefault();
                    table.ajax.reload();
                });
            });
        </script>
    @endsection
