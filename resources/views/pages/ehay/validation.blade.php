@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Data Ehay /</span> Feature / {{ $title }}
    </h4>
    <div class="row">
        <div class="col">
            <form enctype="multipart/form-data" method="post" action="{{ route('ehay.validation-process', $item->uuid) }}"
                id="formValidation">
                @csrf
                <div class="col mb-2">
                    {{-- <div class="row">
                        <div class="col-md-3">
                            <div class='form-group mb-3'>
                                <textarea name='notes' id='note' cols='30' rows='3'
                                    class='form-control @error('note') is-invalid @enderror' placeholder="Must be added when rejected">{{ old('note') }}</textarea>
                                @error('note')
                                    <div class='invalid-feedback'>
                                        {{ $message }}
                                    </div>
                                @enderror
                            </div>
                        </div>
                    </div> --}}
                    <div class="row">
                        <div class="col-md">
                            <button class="btn btn-success" name="btn" value="1">Approve</button>
                            <button class="btn btn-danger btnReject" name="btn" value="0">Reject</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-6">
            <div class="col-12">
                <div class="card mb-34">
                    <h5 class="card-header">{{ $item->code }}</h5>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md">
                                <div class="row">
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='employee_name' class='mb-1'>NRP</label>
                                            <input disabled type='text' name='employee_name' id='employee_name'
                                                class='form-control @error('employee_name') is-invalid @enderror' readonly
                                                value='{{ $item->employee->nrp ?? old('employee_name') }}'>
                                            @error('employee_name')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='employee_name' class='mb-1'>Nama</label>
                                            <input disabled type='text' name='employee_name' id='employee_name'
                                                class='form-control @error('employee_name') is-invalid @enderror' readonly
                                                value='{{ $item->employee->name ?? old('employee_name') }}'>
                                            @error('employee_name')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='employee_department' class='mb-1'>Department</label>
                                            <input disabled type='text' name='employee_department'
                                                id='employee_department'
                                                class='form-control @error('employee_department') is-invalid @enderror'
                                                value='{{ $item->employee->department->name ?? old('employee_department') }}'
                                                readonly>
                                            @error('employee_department')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='patient_name' class='mb-1'>Nama Pasien</label>
                                            <input disabled type='text' name='patient_name' id='patient_name'
                                                class='form-control @error('patient_name') is-invalid @enderror'
                                                value='{{ $item->patient_name ?? old('patient_name') }}'>
                                            @error('patient_name')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='patient_name' class='mb-1'>Status Pasien</label>
                                            <input disabled type='text' name='patient_name' id='patient_name'
                                                class='form-control @error('patient_name') is-invalid @enderror'
                                                value='{{ $item->patient_status ?? old('patient_name') }}'>
                                            @error('patient_name')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>

                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='glasses_price' class='mb-1'>Kacamata</label>
                                            <input disabled type='number' name='glasses_price' id='glasses_price'
                                                class='form-control @error('glasses_price') is-invalid @enderror'
                                                value='{{ $item->glasses_price ?? old('glasses_price') }}'>
                                            @error('glasses_price')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='remarks' class='mb-1'>Keterangan</label>
                                            <input disabled type='text' name='remarks' id='remarks'
                                                class='form-control @error('remarks') is-invalid @enderror'
                                                value='{{ $item->remarks ?? old('remarks') }}'>
                                            @error('remarks')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                    <div class="col-md-4 col-12 mb-3">
                                        <div class='form-group'>
                                            <label for='remarks' class='mb-1'>Total</label>
                                            <input disabled type='text' name='remarks' id='remarks'
                                                class='form-control @error('remarks') is-invalid @enderror'
                                                value='Rp. {{ number_format($item->nominal_total, 0, '.', '.') }}'>
                                            @error('remarks')
                                                <div class='invalid-feedback'>
                                                    {{ $message }}
                                                </div>
                                            @enderror
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <hr>

                    </div>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card">
                <div class="card-header pb-0 d-flex gap-2">
                    <h4>Files</h4>
                </div>
                <div class="card-body row">
                    @foreach ($item->ehayFiles as $file)
                        @php
                            $extension = pathinfo($file->file, PATHINFO_EXTENSION);
                        @endphp
                        @if ($extension == 'pdf')
                            <div class="col-md-4">
                                <a href="javascript:void(0)" class="file"
                                    data-url={{ asset('storage/' . $file->file) }}>
                                    <img src="{{ asset('assets/img/pdf-icon.svg') }}" alt="File"
                                        class="img-fluid w-full" style="height:80px">
                                </a>
                            </div>
                        @else
                            <div class="col-md-4">
                                <a href="javascript:void(0)" class="file"
                                    data-url={{ asset('storage/' . $file->file) }}>
                                    <img src="{{ asset('storage/' . $file->file) }}" alt="File" class="img-fluid">
                                </a>
                            </div>
                        @endif
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="card">
                <div class="card-header pb-0 d-flex gap-2">
                    <h4>Pengobatan</h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <tr>
                            <th>No.</th>
                            <th>Nama</th>
                            <th>Nominal</th>
                        </tr>
                        @foreach ($item->ehayCares as $care)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $care->name }}</td>
                                <td>Rp. {{ number_format($care->price, 0, ',', '.') }}</td>
                            </tr>
                        @endforeach
                        <tr>
                            <th colspan="2">Total</th>
                            <th>Rp. {{ number_format($item->ehayCares()->sum('price'), 0, ',', '.') }}
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6 mb-3">
            <div class="card">
                <div class="card-header pb-0 d-flex gap-2">
                    <h4>Perawatan</h4>
                </div>
                <div class="card-body">
                    <table class="table">
                        <tr>
                            <th>No.</th>
                            <th>Nama</th>
                            <th>Nominal</th>
                        </tr>
                        @foreach ($item->ehayTreatments as $treatment)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $treatment->name }}</td>
                                <td>Rp. {{ number_format($treatment->price, 0, ',', '.') }}</td>
                            </tr>
                        @endforeach
                        <tr>
                            <th colspan="2">Total</th>
                            <th>Rp.
                                {{ number_format($item->ehayTreatments()->sum('price'), 0, ',', '.') }}
                            </th>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal -->
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

    <!-- Modal -->
    <div class="modal fade" id="modalReject" tabindex="-1" aria-labelledby="modalRejectLabel" aria-hidden="true">
        <div class="modal-dialog">
            <form method="POST" action="#" id="formReject">
                @csrf
                <input type="number" name="btn" value="0" hidden>
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="modalRejectLabel">Reject</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>

                    <div class="modal-body">
                        {{-- Optional checkbox untuk Close --}}
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" name="is_closed" id="is_closed"
                                value="1">
                            <label class="form-check-label" for="is_closed">
                                Tandai sebagai <strong>Close</strong> (pengajuan ditutup)
                            </label>
                        </div>

                        {{-- Wajib textarea notes --}}
                        <div class="mb-3">
                            <label for="notes" class="form-label">Catatan / Alasan Penolakan <span
                                    class="text-danger">*</span></label>
                            <textarea name="notes" id="notes" class="form-control" rows="3" required></textarea>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Tutup</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
@endsection
@section('page-script')
    <script>
        $(function() {
            $('body').on('click', '.file', function() {
                var url = $(this).data('url');
                var extension = url.split('.').pop();
                if (extension == 'pdf') {
                    $('#iframeDetail').removeClass('d-none');
                    $('#imgDetail').addClass('d-none');
                    $('#iframeDetail').attr('src', url + '#toolbar=0&navpanes=0&scrollbar=0');
                } else {
                    $('#imgDetail').removeClass('d-none');
                    $('#iframeDetail').addClass('d-none');
                    $('#imgDetail').attr('src', url);
                }
                $('#modalDetail').modal('show');
            });

            $('.btnReject').on('click', function() {
                let action = $('#formValidation').attr('action');
                $('#formValidation').attr('action', 'javascript:void(0)');
                $('#formReject').attr('action', action);
                $('#modalReject').modal('show');
            })
        })
    </script>
@endsection
