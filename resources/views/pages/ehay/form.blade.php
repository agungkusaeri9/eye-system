@extends('layouts.master')

@push('vendor-style')
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.min.css">
@endpush

@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Ehay /</span> Pengajuan
    </h4>
    <div class="row">
        <form method="POST" enctype="multipart/form-data" action="{{ $action }}">
            @method($method)
            @csrf
            <div class="col-12">
                <div class="card mb-34">
                    <h5 class="card-header">Pengajuan Klaim Pengobatan</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_name' class='mb-1'>NRP</label>
                                    <input type='text' name='employee_name' id='employee_name'
                                        class='form-control @error('employee_name') is-invalid @enderror'
                                        value="{{ auth()->user()->employee->nrp }}" disabled>
                                    @error('employee_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_name' class='mb-1'>Nama</label>
                                    <input type='text' name='employee_name' id='employee_name'
                                        class='form-control @error('employee_name') is-invalid @enderror' disabled
                                        value="{{ auth()->user()->employee->name }}">
                                    @error('employee_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='employee_department' class='mb-1'>Department</label>
                                    <input type='text' name='employee_department' id='employee_department'
                                        class='form-control @error('employee_department') is-invalid @enderror'
                                        value="{{ auth()->user()->employee->department->name }}" disabled>
                                    @error('employee_department')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <!-- Data Pasien dan Pengobatan -->
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
                                                        class='form-control @error('patient_name') is-invalid @enderror'
                                                        value='{{ old('patient_name.0') }}'>
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
                                                    <select name='patient_status[]' id='patient_status'
                                                        class='form-control @error('patient_status') is-invalid @enderror'>
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
                                                            <input type='number' name='cost_treatment[]'
                                                                id='cost_treatment' class='form-control'
                                                                placeholder="Masukkan biaya pengobatan">
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
                                                                class='form-control'
                                                                placeholder="Masukkan biaya perawatan">
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
                                                                class='form-control'
                                                                placeholder="Masukkan biaya perawatan">
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
                                                                class='form-control'
                                                                placeholder="Masukkan biaya kacamata">
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
                                                            class='form-control'
                                                            placeholder="Masukkan keterangan">
                                                    </div>
                                                </div>
                                <div class="col-md-12 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='file' class='mb-1'>Lampiran (JPG,PNG) - Maksimal 5 file, 1MB per file</label>
                                        <input type='file' name='file_detail[0][]' id='file'
                                            class='form-control' accept="image/jpeg,image/png" multiple 
                                            data-max-size="1048576" data-max-files="5">
                                    </div>
                                    <div id="file-preview-container-0" class="row mt-2">
                                    </div>
                                </div>
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.7.32/dist/sweetalert2.all.min.js"></script>
    <script>
        $(function() {
            $('#family_id').on('change', function() {
                let id = $(this).val();
                console.log(id);
                $.ajax({
                    url: '{{ route('families.getById') }}',
                    type: 'GET',
                    dataType: 'JSON',
                    data: {
                        'id': id
                    },
                    success: function(data) {
                        console.log(data);
                        if (data) {
                            $('#patient_name').val(data.name);
                        }
                    },
                    error: function(error) {
                        console.error(error)
                    }
                })
            })

            // File upload and preview
            function handleFileSelect(event, groupIndex) {
                const files = event.target.files;
                const previewContainer = $(`#file-preview-container-${groupIndex}`);
                const maxSize = 1048576; // 1MB in bytes
                const maxFiles = 5;
                previewContainer.empty();

                // Check file count limit
                if (files.length > maxFiles) {
                    Swal.fire({
                        title: 'Terlalu Banyak File',
                        text: `Maksimal hanya boleh upload ${maxFiles} file. Anda memilih ${files.length} file.`,
                        icon: 'error',
                        confirmButtonText: 'OK'
                    });
                    event.target.value = '';
                    return;
                }

                // Filter out files that are too large
                const validFiles = Array.from(files).filter(file => {
                    if (file.size > maxSize) {
                        Swal.fire({
                            title: 'File Terlalu Besar',
                            text: `File "${file.name}" terlalu besar. Maksimal ukuran file adalah 1MB.`,
                            icon: 'error',
                            confirmButtonText: 'OK'
                        });
                        return false;
                    }
                    return true;
                });

                // Update the file input with only valid files
                if (validFiles.length !== files.length) {
                    const dt = new DataTransfer();
                    validFiles.forEach(file => dt.items.add(file));
                    event.target.files = dt.files;
                }

                validFiles.forEach((file, index) => {
                    const reader = new FileReader();
                    const fileType = file.type.split('/')[0];
                    const fileName = file.name;

                    reader.onload = function(event) {
                        let preview = '';

                        if (fileType === 'image') {
                            preview = `
                                <div class="col-md-3 mb-2">
                                    <div class="card">
                                        <img src="${event.target.result}" class="card-img-top" style="height: 120px; object-fit: cover;">
                                        <div class="card-body p-2">
                                            <p class="card-text small text-truncate">${fileName}</p>
                                            <p class="card-text small text-muted">${(file.size / 1024 / 1024).toFixed(2)} MB</p>
                                            <button type="button" class="btn btn-sm btn-danger remove-file" data-group="${groupIndex}" data-index="${index}">Hapus</button>
                                        </div>
                                    </div>
                                </div>
                            `;
                        } else {
                            preview = `
                                <div class="col-md-3 mb-2">
                                    <div class="card">
                                        <div class="card-body text-center p-2">
                                            <i class="fas fa-file text-secondary fa-3x mb-2"></i>
                                            <p class="card-text small text-truncate">${fileName}</p>
                                            <p class="card-text small text-muted">${(file.size / 1024 / 1024).toFixed(2)} MB</p>
                                            <button type="button" class="btn btn-sm btn-danger remove-file" data-group="${groupIndex}" data-index="${index}">Hapus</button>
                                        </div>
                                    </div>
                                </div>
                            `;
                        }

                        previewContainer.append(preview);
                    };

                    reader.readAsDataURL(file);
                });
            }

            // Handle all file inputs including dynamically added ones
            $(document).on('change', '.file-input', function(e) {
                const groupIndex = $(this).data('group');
                handleFileSelect(e, groupIndex);
            });

            // Initial file input setup
            $('#file').addClass('file-input').attr('data-group', '0');

            // Remove file from preview
            $(document).on('click', '.remove-file', function() {
                const index = $(this).data('index');
                const groupIndex = $(this).data('group');
                const fileInput = $(`input[data-group="${groupIndex}"]`)[0];

                if (fileInput.files && fileInput.files.length) {
                    const dt = new DataTransfer();

                    Array.from(fileInput.files)
                        .filter((_, i) => i !== index)
                        .forEach(file => dt.items.add(file));

                    fileInput.files = dt.files;
                    handleFileSelect({ target: fileInput }, groupIndex);
                }

                $(this).closest('.col-md-3').remove();
            });

            // Add Patient Group
            let groupIndex = 1;
            $('#add-patient-group').click(function() {
                let html = `
                    <div class="patient-group mb-4 border rounded p-3">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="mb-0">Data #${groupIndex + 1}</h6>
                            <button type="button" class="btn btn-danger btn-sm remove-patient-group">
                                <i class="fas fa-trash"></i> Hapus
                            </button>
                        </div>

                        <!-- Informasi Pasien -->
                        <div class="row mb-3">
                            <div class="col-md-6 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='patient_name_${groupIndex}'>Nama Pasien</label>
                                    <input type='text' name='patient_name[]' id='patient_name_${groupIndex}'
                                        class='form-control' placeholder="Masukkan nama pasien">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='patient_status_${groupIndex}'>Status Pasien</label>
                                    <select name='patient_status[]' id='patient_status_${groupIndex}' class='form-control'>
                                        <option value='' selected disabled>Pilih Status Pasien</option>
                                        <option value="Ybs">Ybs</option>
                                        <option value="Istri/Suami">Istri/Suami</option>
                                        <option value="Anak 1">Anak 1</option>
                                        <option value="Anak 2">Anak 2</option>
                                        <option value="Anak 3">Anak 3</option>
                                        <option value="Anak 4">Anak 4</option>
                                        <option value="Anak 5">Anak 5</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Informasi Pengobatan -->
                        <div class="mb-3">
                            <h6 class="mb-2">Pengobatan</h6>
                            <div class="row">
                                <div class="col-md-12 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='cost_treatment_${groupIndex}'>Biaya Pengobatan</label>
                                        <div class="input-group">
                                            <span class="input-group-text">Rp</span>
                                            <input type='number' name='cost_treatment[${groupIndex}]' id='cost_treatment_${groupIndex}'
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
                                        <label for='care_type1_${groupIndex}'>Jenis Perawatan 1</label>
                                        <select name='care_type1[${groupIndex}]' id='care_type1_${groupIndex}' class='form-control'>
                                            <option value='' selected disabled>Pilih Perawatan</option>
                                            <option value="Rawat Inap">Rawat Inap</option>
                                            <option value="Rawat Jalan">Rawat Jalan</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='cost_care1_${groupIndex}'>Biaya Perawatan 1</label>
                                        <div class="input-group">
                                            <span class="input-group-text">Rp</span>
                                            <input type='number' name='cost_care1[${groupIndex}]' id='cost_care1_${groupIndex}'
                                                class='form-control' placeholder="Masukkan biaya perawatan">
                                        </div>
                                    </div>
                                </div>
                                <!-- Care 2 -->
                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='care_type2_${groupIndex}'>Jenis Perawatan 2</label>
                                        <select name='care_type2[${groupIndex}]' id='care_type2_${groupIndex}' class='form-control'>
                                            <option value='' selected disabled>Pilih Perawatan</option>
                                            <option value="Rawat Inap">Rawat Inap</option>
                                            <option value="Rawat Jalan">Rawat Jalan</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='cost_care2_${groupIndex}'>Biaya Perawatan 2</label>
                                        <div class="input-group">
                                            <span class="input-group-text">Rp</span>
                                            <input type='number' name='cost_care2[${groupIndex}]' id='cost_care2_${groupIndex}'
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
                                        <label for='cost_glasses_${groupIndex}'>Biaya Kacamata</label>
                                        <div class="input-group">
                                            <span class="input-group-text">Rp</span>
                                            <input type='number' name='cost_glasses[${groupIndex}]' id='cost_glasses_${groupIndex}'
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
                                        <label for='keterangan_${groupIndex}'>Keterangan</label>
                                        <input type='text' name='keterangan[${groupIndex}]' id='keterangan_${groupIndex}'
                                            class='form-control' placeholder="Masukkan keterangan">
                                    </div>
                                </div>
                                <div class="col-md-12 col-sm-12 mb-3">
                                    <div class='form-group'>
                                        <label for='file_detail_${groupIndex}'>Lampiran (JPG,PNG) - Maksimal 5 file, 1MB per file</label>
                                        <input type='file' name='file_detail[${groupIndex}][]' id='file_detail_${groupIndex}'
                                            class='form-control file-input' accept="image/jpeg,image/png" multiple 
                                            data-group="${groupIndex}" data-max-size="1048576" data-max-files="5">
                                    </div>
                                    <div id="file-preview-container-${groupIndex}" class="row mt-2">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                `;
                $('#patient-groups-container').append(html);
                groupIndex++;
            });

            // Remove Patient Group
            $(document).on('click', '.remove-patient-group', function() {
                $(this).closest('.patient-group').remove();
            });
        })
    </script>
@endsection