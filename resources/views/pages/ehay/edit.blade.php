@extends('layouts.master')
@section('content')
<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data Ehay /</span> Feature / {{ $title }}
</h4>
<form method="POST" enctype="multipart/form-data" action="#">
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
                                <input type='text' name='employee_name' id='employee_name' class='form-control @error('
                                    employee_name') is-invalid @enderror' value="{{ auth()->user()->employee->nrp }}"
                                    disabled>
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
                                <input type='text' name='employee_name' id='employee_name' class='form-control @error('
                                    employee_name') is-invalid @enderror' disabled
                                    value="{{ auth()->user()->employee->name }}">
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
                        <div class="col-md-4 col-sm-12 mb-3">
                            <div class='form-group'>
                                <label for='status' class='mb-1'>Status ({{ $item->currentLogStatusData()->name
                                    }})</label>
                                <input type='text' name='status' id='status' class='form-control @error(' status')
                                    is-invalid @enderror' value="{{ $item->currentLogStatusData()->notes }}" disabled>
                                @error('status')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                                @enderror
                            </div>
                        </div>
                        {{-- <div class="float-right">
                            <button class="btn btn-primary mt-2" type="submit">
                                <i class="fa fa-save me-2"></i>
                                <span class="align-middle">Submit Revision</span>
                            </button>
                        </div> --}}
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
{{-- <div class="row">
    @foreach ($item->details as $detail)

    <div class="col-md-6">
        <div class="card">
            <div class="card-body">
                <div class="col-md-12 col-sm-12 mb-3">
                    <div class="d-flex justify-content-between align-items-center mb-2">
                        <h6 class="mb-0">Data Pasien dan Pengobatan</h6>
                        <button type="button" class="btn btn-primary btn-sm" id="add-patient-group">
                            <i class="fas fa-plus"></i> Tambah Data
                        </button>
                    </div>
                    <div id="patient-groups-container">
                        <div class="patient-group mb-4 border rounded p-3">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h6 class="mb-0">Data #1</h6>
                                <button type="button" class="btn btn-danger btn-sm remove-patient-group">
                                    <i class="fas fa-trash"></i> Hapus
                                </button>
                            </div>

                            <!-- Informasi Pasien -->
                            <div class="row mb-3">
                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='patient_name' class='mb-1'>Nama Pasien</label>
                                        <input type='text' name='patient_name[]' id='patient_name'
                                            class='form-control @error(' patient_name') is-invalid @enderror'
                                            value='{{ $detail->patien_name ??  old(' patient_name.0') }}'>
                                        @error('patient_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='patient_status' class="mb-1">Status Pasien</label>
                                        <select name='patient_status[]' id='patient_status' class='form-control @error('
                                            patient_status') is-invalid @enderror'>
                                            <option value='' selected disabled>Pilih Status Pasien
                                            </option>
                                            <option value="Ybs">Ybs</option>
                                            <option value="Istri/Suami">Istri/Suami</option>
                                            <option value="Anak 1">Anak 1</option>
                                            <option value="Anak 2">Anak 2</option>
                                            <option value="Anak 3">Anak 3</option>
                                            <option value="Anak 4">Anak 4</option>
                                            <option value="Anak 5">Anak 5</option>
                                        </select>
                                        @error('patient_status')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                        @enderror
                                    </div>
                                </div>
                            </div>

                            <!-- Informasi Pengobatan -->
                            <div class="mb-3">
                                <h6 class="mb-2">Pengobatan</h6>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='cost_treatment' class='mb-1'>Biaya Pengobatan</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type='number' name='cost_treatment[]' id='cost_treatment'
                                                    class='form-control' placeholder="Masukkan biaya pengobatan">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Informasi Perawatan -->
                            <div class="mb-3">
                                <h6 class="mb-2">Perawatan</h6>
                                <div class="row">
                                    <!-- Care 1 -->
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='care_type1' class="mb-1">Jenis Perawatan 1</label>
                                            <select name='care_type1[]' id='care_type1' class='form-control'>
                                                <option value='' selected disabled>Pilih Perawatan
                                                </option>
                                                <option value="Rawat Inap">Rawat Inap</option>
                                                <option value="Rawat Jalan">Rawat Jalan</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='cost_care1' class='mb-1'>Biaya Perawatan 1</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type='number' name='cost_care1[]' id='cost_care1'
                                                    class='form-control' placeholder="Masukkan biaya perawatan">
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Care 2 -->
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='care_type2' class="mb-1">Jenis Perawatan 2</label>
                                            <select name='care_type2[]' id='care_type2' class='form-control'>
                                                <option value='' selected disabled>Pilih Perawatan
                                                </option>
                                                <option value="Rawat Inap">Rawat Inap</option>
                                                <option value="Rawat Jalan">Rawat Jalan</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='cost_care2' class='mb-1'>Biaya Perawatan 2</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type='number' name='cost_care2[]' id='cost_care2'
                                                    class='form-control' placeholder="Masukkan biaya perawatan">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Informasi Kacamata -->
                            <div class="mb-3">
                                <h6 class="mb-2">Kacamata</h6>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='cost_glasses' class='mb-1'>Biaya Kacamata</label>
                                            <div class="input-group">
                                                <span class="input-group-text">Rp</span>
                                                <input type='number' name='cost_glasses[]' id='cost_glasses'
                                                    class='form-control' placeholder="Masukkan biaya kacamata">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Keterangan dan Lampiran -->
                            <div class="mb-3">
                                <h6 class="mb-2">Keterangan dan Lampiran</h6>
                                <div class="row">
                                    <div class="col-md-12 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='keterangan' class='mb-1'>Keterangan</label>
                                            <input type='text' name='keterangan[]' id='keterangan' class='form-control'
                                                placeholder="Masukkan keterangan">
                                        </div>
                                    </div>
                                    <div class="col-md-12 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='file' class='mb-1'>Lampiran (JPG,PNG) - Maksimal 5 file, 1MB per
                                                file</label>
                                            <input type='file' name='file_detail[0][]' id='file' class='form-control'
                                                accept="image/jpeg,image/png" multiple data-max-size="1048576"
                                                data-max-files="5">
                                        </div>
                                        <div id="file-preview-container-0" class="row mt-2">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    @endforeach
</div> --}}

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
                                                    {{-- <form
                                                        action="{{ route('ehay-detail.destroy', $detail->uuid) }}"
                                                        method="POST" class="d-inline">
                                                        @method('DELETE')
                                                        @csrf
                                                        <button class="btn btn-sm btn-danger">Hapus</button>
                                                    </form> --}}
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