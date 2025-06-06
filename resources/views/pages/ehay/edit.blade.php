@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Data Ehay /</span> Feature / {{ $title }}
    </h4>
    <form method="POST" enctype="multipart/form-data" action="{{ route('ehay.update', $item->uuid) }}">
    <div class="row">
            @method('patch')
            @csrf
            <!-- Input Mask -->
            <div class="col-md-4">
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
                                    <label for='file' class='mb-1'>Lampiran (JPG,PNG,JPEG)</label>
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
            <div class="col-md-8">
               <div class="row">
                <div class="col-md-12">
                    <div class="row">
                        <div class="col-md-12 mb-3">
                            <div class="card">
                                <div class="card-header pb-0 d-flex gap-2">
                                    <h4>Detail</h4>
                                </div>
                                <div class="card-body">
                                   <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead class="table-light">
                                            <tr>
                                                <th rowspan="2" class="text-center align-middle">Nama Pasien</th>
                                                <th rowspan="2" class="text-center align-middle">Status Pasien</th>
                                                <th rowspan="2" class="text-center align-middle">Pengobatan</th>
                                                <th colspan="2" class="text-center">Perawatan 1</th>
                                                <th colspan="2" class="text-center">Perawatan 2</th>
                                                <th rowspan="2" class="text-center align-middle">Kacamata</th>
                                                <th rowspan="2" class="text-center align-middle">Total</th>
                                            </tr>
                                            <tr>
                                                <th class="text-center">Jenis</th>
                                                <th class="text-center">Biaya</th>
                                                <th class="text-center">Jenis</th>
                                                <th class="text-center">Biaya</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($item->details as $detail)
                                                <tr>
                                                    <td>{{ $detail->patient_name }}</td>
                                                    <td>{{ $detail->patient_status }}</td>
                                                    <td class="text-end">RP.
                                                        {{ number_format($detail->cost_treatment, 0, ',', '.') }}</td>
                                                    <td>{{ $detail->care_type1 ?? '-' }}</td>
                                                    <td class="text-end">RP. {{ number_format($detail->cost_care1, 0, ',', '.') }}
                                                    </td>
                                                    <td>{{ $detail->care_type2 ?? '-' }}</td>
                                                    <td class="text-end">RP. {{ number_format($detail->cost_care2, 0, ',', '.') }}
                                                    </td>
                                                    <td class="text-end">RP.
                                                        {{ number_format($detail->cost_glasses, 0, ',', '.') }}</td>
                                                    <td class="text-end">RP.
                                                        {{ number_format($detail->nominal_total, 0, ',', '.') }}</td>
                                                </tr>
                                            @endforeach
                                        </tbody>
                                        <tfoot>
                                            <tr class="table-light">
                                                <th colspan="8" class="text-end">Total</th>
                                                <th class="text-end">Rp.
                                                    {{ number_format($item->details->sum('nominal_total'), 0, ',', '.') }}</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                   </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 mb-2">
                            <div class="card">
                                <div class="card-header pb-0 d-flex gap-2">
                                    <h4>Files</h4>
                                </div>
                                <div class="card-body row">
                                    @foreach ($item->files as $file)
                                        @php
                                            $extension = pathinfo($file->file, PATHINFO_EXTENSION);
                                        @endphp
                                        @if ($extension == 'pdf')
                                            <div class="col-md-3">
                                                <a href="javascript:void(0)" class="file"
                                                    data-url={{ asset('storage/' . $file->file) }}>
                                                    <img src="{{ asset('assets/img/pdf-icon.svg') }}" alt="File"
                                                        class="img-fluid w-full" style="height:80px">
                                                </a>
                                            </div>
                                        @else
                                            <div class="col-md-3">
                                                <a href="javascript:void(0)" class="file"
                                                    data-url={{ asset('storage/' . $file->file) }}>
                                                    <img src="{{ asset('storage/' . $file->file) }}" alt="File"
                                                        class="img-fluid">
                                                </a>
                                            </div>
                                        @endif
                                    @endforeach
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
               </div>
            </div>
        </div>
    </form>
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
    <script>
        $(function() {
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
