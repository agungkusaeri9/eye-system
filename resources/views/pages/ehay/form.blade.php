@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Ehay /</span> Pengajuan
    </h4>
    <div class="row">
        <form method="POST" enctype="multipart/form-data" action="{{ $action }}">
            @method($method)
            @csrf
            <!-- Input Mask -->
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
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='patient_name' class='mb-1'>Nama Pasien</label>
                                    <input type='text' name='patient_name' id='patient_name'
                                        class='form-control @error('patient_name') is-invalid @enderror'
                                        value='{{ old('patient_name') }}'>
                                    @error('patient_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='patient_status' class="mb-1">Status Pasien</label>
                                    <select name='patient_status' id='patient_status'
                                        class='form-control @error('patient_status') is-invalid @enderror'>
                                        <option value='' selected disabled>Pilih Status Pasien</option>
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

                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='care_price' class='mb-1'>Pengobatan</label>
                                    <input type='number' name='care_price' id='care_price'
                                        class='form-control @error('care_price') is-invalid @enderror'
                                        value='{{ old('care_price') }}'>
                                    @error('care_price')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 ">
                                <div id="treatment-container">
                                    <div class="row treatment-group mb-3">
                                        <h6>Perawatan</h6>
                                        <div class="col-xl-3 col-md-6 col-sm-12">
                                            <div class='form-group'>
                                                <label for='treatment_name' class="mb-1">Perawatan</label>
                                                <select name='treatment_name[]' id='treatment_name'
                                                    class='form-control @error('treatment_name') is-invalid @enderror'>
                                                    <option value='' selected>Pilih Perawatan</option>
                                                    <option value="Rawat Inap">Rawat Inap</option>
                                                    <option value="Rawat Jalan">Rawat Jalan</option>
                                                </select>
                                                @error('treatment_name')
                                                    <div class='invalid-feedback'>
                                                        {{ $message }}
                                                    </div>
                                                @enderror
                                            </div>
                                        </div>
                                        <div class="col-xl-3 col-md-6 col-sm-12">
                                            <div class='form-group'>
                                                <label for='treatment_price' class='mb-1'>Nominal</label>
                                                <input type='number' name='treatment_price[]' id='treatment_price'
                                                    class='form-control @error('treatment_price') is-invalid @enderror'
                                                    value=''>
                                            </div>
                                        </div>
                                        <div class="col-xl-1 col-md-2 col-sm-2 d-flex align-items-end">
                                            <button type="button" class="btn btn-primary" id="add-treatment"><i
                                                    class="fas fa-plus"></i></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='glasses_price' class='mb-1'>Kacamata</label>
                                    <input type='number' name='glasses_price' id='glasses_price'
                                        class='form-control @error('glasses_price') is-invalid @enderror'
                                        value='{{ old('glasses_price') }}'>
                                    @error('glasses_price')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='remarks' class='mb-1'>Keterangan</label>
                                    <input type='text' name='remarks' id='remarks'
                                        class='form-control @error('remarks') is-invalid @enderror'
                                        value='{{ old('remarks') }}'>
                                    @error('remarks')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='file' class='mb-1'>Lampiran (JPG,PNG)</label>
                                    <div class="input-group">
                                        <input type='file' name='file[]' id='file' multiple
                                            class='form-control @error('file') is-invalid @enderror'>
                                        <button class="btn btn-outline-primary" type="button" id="add-more-files">
                                            <i class="fas fa-plus"></i>
                                        </button>
                                    </div>
                                    <div id="file-preview-container" class="mt-2 row"></div>
                                    @error('file')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
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
            $('#file').on('change', function(e) {
                displayFiles(this.files);
            });

            // Display selected files
            function displayFiles(files) {
                $('#file-preview-container').empty();

                Array.from(files).forEach((file, index) => {
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
                                            <button type="button" class="btn btn-sm btn-danger remove-file" data-index="${index}">Hapus</button>
                                        </div>
                                    </div>
                                </div>
                            `;
                        } else if (fileType === 'application' || fileName.endsWith('.pdf')) {
                            preview = `
                                <div class="col-md-3 mb-2">
                                    <div class="card">
                                        <div class="card-body text-center p-2">
                                            <i class="fas fa-file-pdf text-danger fa-3x mb-2"></i>
                                            <p class="card-text small text-truncate">${fileName}</p>
                                            <button type="button" class="btn btn-sm btn-danger remove-file" data-index="${index}">Hapus</button>
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
                                            <button type="button" class="btn btn-sm btn-danger remove-file" data-index="${index}">Hapus</button>
                                        </div>
                                    </div>
                                </div>
                            `;
                        }

                        $('#file-preview-container').append(preview);
                    };

                    reader.readAsDataURL(file);
                });
            }

            // Remove file from preview
            $(document).on('click', '.remove-file', function() {
                const index = $(this).data('index');
                const fileInput = document.getElementById('file');

                if (fileInput.files && fileInput.files.length) {
                    const dt = new DataTransfer();

                    Array.from(fileInput.files)
                        .filter((_, i) => i !== index)
                        .forEach(file => dt.items.add(file));

                    fileInput.files = dt.files;
                    displayFiles(fileInput.files);
                }

                $(this).closest('.col-md-3').remove();
            });

            // Add more files button
            $('#add-more-files').on('click', function() {
                $('#file').click();
            });

            // add treatment-container
            let indexCare = 1;

            $('#add-care').click(function() {
                let html = `
            <div class="row care-group mb-3">
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class='form-group'>
                        <label for='care_name_${indexCare}'>Pengobatan</label>
                        <input type="text" name="care_name[]" id="care_name_${indexCare}"
                            class="form-control">
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class='form-group'>
                        <label for='care_price_${indexCare}' class='mb-1'>Nominal</label>
                        <input type='number' name='care_price[]' id='care_price_${indexCare}'
                            class='form-control'>
                    </div>
                </div>
                <div class="col-xl-1 col-md-2 col-sm-2 d-flex align-items-end">
                    <button type="button" class="btn btn-danger remove-care">X</button>
                </div>
            </div>
        `;
                $('#care-container').append(html);
                indexCare++;
            });

            // Hapus field pengobatan
            $(document).on('click', '.remove-care', function() {
                $(this).closest('.care-group').remove();
            });

            // add treatment-container
            let index = 1;

            $('#add-treatment').click(function() {
                let html = `
            <div class="row treatment-group mb-3">
               <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class='form-group'>
                        <label for='treatment_name_${index}'>Perawatan</label>
                        <select name='treatment_name[]' id='treatment_name_${index}' class='form-control'>
                            <option value='' selected disabled>Pilih Perawatan</option>
                            <option value="Rawat Inap">Rawat Inap</option>
                            <option value="Rawat Jalan">Rawat Jalan</option>
                        </select>
                    </div>
                </div>
                <div class="col-xl-3 col-md-6 col-sm-12">
                    <div class='form-group'>
                        <label for='treatment_price_${index}' class='mb-1'>Nominal</label>
                        <input type='number' name='treatment_price[]' id='treatment_price_${index}'
                            class='form-control'>
                    </div>
                </div>
                <div class="col-xl-1 col-md-2 col-sm-2 d-flex align-items-end">
                    <button type="button" class="btn btn-danger remove-treatment">X</button>
                </div>
            </div>
        `;
                $('#treatment-container').append(html);
                index++;
            });

            // Hapus field pengobatan
            $(document).on('click', '.remove-treatment', function() {
                $(this).closest('.treatment-group').remove();
            });
        })
    </script>
@endsection
