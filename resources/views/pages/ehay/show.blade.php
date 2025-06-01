@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header pb-0 d-flex gap-2">
                    <h4>Detail Data</h4>
                </div>
                <div class="card-body">
                    <ul class="p-0 ">
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Number</span>
                            <span>{{ $item->code }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">NRP</span>
                            <span>{{ $item->employee->nrp }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Nama Karyawan</span>
                            <span>{{ $item->employee->name }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Department</span>
                            <span>{{ $item->employee->department->name }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Nama Pasien</span>
                            <span>{{ $item->patient_name }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Status Pasien</span>
                            <span>{{ $item->patient_status }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Nominal Kacamata</span>
                            <span>Rp. {{ number_format($item->glasess_price, 0, '.', '.') }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Keterangan</span>
                            <span>{{ $item->notes ?? '-' }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Nominal Total</span>
                            <span>Rp. {{ number_format($item->nominal_total, 0, '.', '.') }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Nominal Disetujui</span>
                            <span>Rp. {{ number_format($item->nominal_approve, 0, '.', '.') }}</span>

                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Tanggal</span>
                            <span>{{ $item->created_at->translatedFormat('d F Y H:i') }}</span>
                        </li>
                        <li class="d-flex justify-content-between mb-3">
                            <span class="font-bold">Status Pengajuan</span>
                            <span>{{ $item->currentLogStatus() }}</span>
                        </li>
                        @if ($item->status == 2)
                            <li class="d-flex justify-content-between mb-3">
                                <span class="font-bold">Alasan</span>
                                <span>{{ $item->currentLogStatusData()->notes }}</span>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="row">
                <div class="col-md-12 mb-3">
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
                                    <th>Rp. {{ number_format($item->ehayCares()->sum('price'), 0, ',', '.') }}</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
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
                                    <th>Rp. {{ number_format($item->ehayTreatments()->sum('price'), 0, ',', '.') }}</th>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div class="col-md-12 mb-3">
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
