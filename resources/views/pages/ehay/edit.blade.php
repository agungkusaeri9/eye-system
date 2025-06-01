@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Data Ehay /</span> Feature / {{ $title }}
    </h4>
    <div class="row">
        <form method="POST" enctype="multipart/form-data" action="{{ route('ehay.update', $item->uuid) }}">
            @method('patch')
            @csrf
            <!-- Input Mask -->
            <div class="col-12">
                <div class="card mb-34">
                    <h5 class="card-header">{{ $title }}</h5>
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
                                        value='{{ $item->patient_name ?? old('patient_name') }}' disabled>
                                    @error('patient_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='patient_name' class='mb-1'>Status Pasien</label>
                                    <input type='text' name='patient_name' id='patient_name'
                                        class='form-control @error('patient_name') is-invalid @enderror'
                                        value='{{ $item->patient_status ?? old('patient_name') }}' disabled>
                                    @error('patient_name')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="row">
                                    <div class="col-md-6">
                                        <h5>Pengobatan</h5>
                                        <ol>
                                            @foreach ($item->ehayCares as $care)
                                                <li>
                                                    <div class="d-flex gap-4">
                                                        <div>
                                                            {{ $care->name }}
                                                        </div>
                                                        <div>Rp {{ number_format($care->price, 0, '.', '.') }}</div>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ol>
                                    </div>
                                    <div class="col-md-6">
                                        <h5>Perawatan</h5>
                                        <ol>
                                            @foreach ($item->ehayTreatments as $treatment)
                                                <li>
                                                    <div class="d-flex gap-4">
                                                        <div>
                                                            {{ $treatment->name }}
                                                        </div>
                                                        <div>Rp {{ number_format($treatment->price, 0, '.', '.') }}</div>
                                                    </div>
                                                </li>
                                            @endforeach
                                        </ol>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='glasses_price' class='mb-1'>Kacamata</label>
                                    <input type='number' name='glasses_price' id='glasses_price'
                                        class='form-control @error('glasses_price') is-invalid @enderror'
                                        value='{{ $item->glasses_price ?? old('glasses_price') }}' disabled>
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
                                        value='{{ $item->remarks ?? old('remarks') }}'>
                                    @error('remarks')
                                        <div class='invalid-feedback'>
                                            {{ $message }}
                                        </div>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-12 mb-3">
                                <div class='form-group'>
                                    <label for='file' class='mb-1'>Lampiran (PDF,JPG,PNG)</label>
                                    <input type='file' name='file[]' id='file'
                                        class='form-control @error('file') is-invalid @enderror' value='' multiple>
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
                                    <span class="align-middle">Simpan Data</span>
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
