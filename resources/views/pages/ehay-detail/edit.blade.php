@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Ehay /</span> Pengajuan
    </h4>
    <div class="row">
        <form method="POST" enctype="multipart/form-data" action="">
            @method('patch')
            @csrf
            <div class="col-12">
                <div class="card mb-34">
                    <h5 class="card-header">Edit Detail Pasien</h5>
                    <div class="card-body">
                        <div class="row">
                            <!-- Data Pasien dan Pengobatan -->
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class="row mb-3">
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='patient_name' class='mb-1'>Nama Pasien</label>
                                            <input type='text' name='patient_name[]' id='patient_name'
                                                class='form-control @error('patient_name') is-invalid @enderror'
                                                value='{{ $detail->patient_name ?? old('patient_name.0') }}' disabled>
                                            @error('patient_name')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-sm-12 mb-3">
                                        <div class='form-group'>
                                            <label for='patient_status' class='mb-1'>Nama Pasien</label>
                                            <input type='text' name='patient_status[]' id='patient_status'
                                                class='form-control @error('patient_status') is-invalid @enderror'
                                                value='{{ $detail->patient_status ?? old('patient_status.0') }}' disabled>
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
                                                <input type='text' name='keterangan[]' id='keterangan'
                                                    class='form-control' placeholder="Masukkan keterangan">
                                            </div>
                                        </div>
                                        <div class="col-md-12 col-sm-12 mb-3">
                                            <div class='form-group'>
                                                <label for='file' class='mb-1'>Lampiran (JPG,PNG)</label>
                                                <input type='file' name='file_detail[]' id='file'
                                                    class='form-control' accept="image/jpeg,image/png">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="float-right">
                                <button class="btn btn-primary mt-2" type="submit">
                                    <i class="fa fa-save me-2"></i>
                                    <span class="align-middle">Ajukan Sekarang</span>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection

@section('page-script')
@endsection
