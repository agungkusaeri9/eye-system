@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Data Ehay /</span> Feature / {{ $title }}
    </h4>
    <form method="POST" enctype="multipart/form-data" action="{{ route('ehay.update', $item->uuid) }}">
        <div class="row mb-2">
            @method('patch')
            @csrf
            <!-- Input Mask -->
            <div class="col-md-12">
                <div class="card mb-34">
                    <h5 class="card-header">{{ $title }}</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_name' class='mb-1'>NRP</label>
                                    <input type='text' name='employee_name' id='employee_name'
                                        class='form-control @error('
                                    employee_name') is-invalid @enderror'
                                        value="{{ auth()->user()->employee->nrp }}" disabled>
                                    @error('employee_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_name' class='mb-1'>Nama</label>
                                    <input type='text' name='employee_name' id='employee_name'
                                        class='form-control @error('
                                    employee_name') is-invalid @enderror'
                                        disabled value="{{ auth()->user()->employee->name }}">
                                    @error('employee_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-4 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_department' class='mb-1'>Department</label>
                                    <input type='text' name='employee_department' id='employee_department'
                                        class='form-control @error(' employee_department') is-invalid @enderror'
                                        value="{{ auth()->user()->employee->department->name }}" disabled>
                                    @error('employee_department')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="float-right">
                                <button class="btn btn-primary mt-2" type="submit">
                                    <i class="fa fa-save me-2"></i>
                                    <span class="align-middle">Submit Revision</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    <div class="row">
        <div class="col-md-12">
            <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header pb-0 d-flex gap-2">
                                    <h4>Data Pasien</h4>
                                </div>
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable">
                                            <thead>
                                                <tr>
                                                    <th class="text-center align-middle">Nama</th>
                                                    <th class="text-center align-middle">Status</th>
                                                    <th class="text-center align-middle">Pengobatan</th>
                                                    <th class="text-center">Perawatan 1</th>
                                                    <th class="text-center">Perawatan 2</th>
                                                    <th class="text-center align-middle">Kacamata</th>
                                                    <th class="text-center align-middle">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($item->details as $detail)
                                                    <tr>
                                                        <td>{{ $detail->patient_name }}</td>
                                                        <td>{{ $detail->patient_status }}</td>
                                                        <td class="text-end">RP.
                                                            {{ number_format($detail->cost_treatment, 0, ',', '.') }}</td>
                                                        <td class="text-end">RP.
                                                            {{ number_format($detail->cost_care1) }}</td>
                                                        <td class="text-end">RP.
                                                            {{ number_format($detail->cost_care2) }}</td>
                                                        <td class="text-end">RP.
                                                            {{ number_format($detail->cost_glasses, 0, ',', '.') }}</td>
                                                    
                                                        <td>
                                                            <a href="{{ route('ehay-detail.edit', $detail->uuid) }}"
                                                                class="btn btn-info btn-sm">Edit</a>
                                                            <form action="{{ route('ehay-detail.destroy', $detail->uuid) }}"
                                                                method="POST" class="d-inline">
                                                                @method('DELETE')
                                                                @csrf
                                                                <button class="btn btn-sm btn-danger">Hapus</button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="modalDetail" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Lampiran</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <img src="" alt="" id="imgDetail" class="img-fluid d-none">
                    <iframe src="" id="iframeDetail" class="w-100 d-none" style="height: 80vh;"></iframe>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
    <script>
        $(function() {
            $('#dataTable').DataTable();
            $('body').on('click', '.file', function() {
                var url = $(this).data('url');
                var extension = url.split('.').pop();
                if (extension == 'pdf') {
                    $('#iframeDetail').removeClass('d-none');
                    $('#imgDetail').addClass('d-none');
                    $('#iframeDetail').attr('src', url);
                } else {
                    $('#imgDetail').removeClass('d-none');
                    $('#iframeDetail').addClass('d-none');
                    $('#imgDetail').attr('src', url);
                }
                $('#modalDetail').modal('show');
            });
        })
    </script>
@endsection
