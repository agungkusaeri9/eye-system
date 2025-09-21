@extends('layouts.master', ['title' => $title])
@section('content')
<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">{{ $title }} </span>
</h4>
<!-- DataTable with Buttons -->
<div class="row">
    <div class="col-md-12 mb-2">
        <div class="card">
            <div class="card-header pb-0 d-flex gap-2">
                <h4>Data Klaim </h4>
            </div>
            <div class="card-body">
                <ul class="p-0">
                    <div class="row">
                        <div class="col-md">
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Number</span>
                                <span>{{ $item->code }}</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">NRP</span>
                                <span>{{ $item->employee->nrp }}</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Nama Karyawan</span>
                                <span>{{ $item->employee->name }}</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Department</span>
                                <span>{{ $item->employee->department->name }}</span>
                            </li>
                        </div>
                        <div class="col-md">
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Nominal Total</span>
                                <span>Rp. {{ number_format($item->nominal_total, 0, '.', '.') }}</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Nominal Disetujui</span>
                                <span>Rp. {{ number_format($item->nominal_approve, 0, '.', '.') }}</span>

                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Tanggal</span>
                                <span>{{ $item->created_at->translatedFormat('d F Y H:i') }}</span>
                            </li>
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Status Pengajuan</span>
                                <span>{{ $item->currentLogStatus() }}</span>
                            </li>
                            @if ($item->status == 2)
                            <li class="d-flex justify-content-between mb-3">
                                <span class="" style="font-weight: bold">Alasan</span>
                                <span>{{ $item->currentLogStatusData()->notes }}</span>
                            </li>
                            @endif
                        </div>
                    </div>

                </ul>
            </div>
        </div>
    </div>
    <div class="col-md-12">
        <div class="row">
            <div class="col-md-12 mb-3">
                <div class="card">
                    <div class="card-header pb-0 d-flex gap-2">
                        <h4>Detail</h4>
                    </div>
                    <div class="card-body">
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
                                        {{ number_format($detail->cost_treatment, 0, ',', '.') }}
                                    </td>
                                    <td>{{ $detail->care_type1 ?? '-' }}</td>
                                    <td class="text-end">RP. {{ number_format($detail->cost_care1, 0, ',', '.') }}
                                    </td>
                                    <td>{{ $detail->care_type2 ?? '-' }}</td>
                                    <td class="text-end">RP. {{ number_format($detail->cost_care2, 0, ',', '.') }}
                                    </td>
                                    <td class="text-end">RP.
                                        {{ number_format($detail->cost_glasses, 0, ',', '.') }}
                                    </td>
                                    <td class="text-end">RP.
                                        {{ number_format($detail->nominal_total, 0, ',', '.') }}
                                    </td>
                                </tr>
                                @endforeach
                            </tbody>
                            <tfoot>
                                <tr class="table-light">
                                    <th colspan="8" class="text-end">Total</th>
                                    <th class="text-end">Rp.
                                        {{ number_format($item->details->sum('nominal_total'), 0, ',', '.') }}
                                    </th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>
            </div>
            <div class="col-md-12 mb-2">
                <div class="card">
                    <div class="card-header pb-0 d-flex gap-2">
                        <h4>Files</h4>
                    </div>
                    <div class="card-body row">
                        @foreach ($item->details as $detail)
                        @forelse ($detail->files as $file)
                        @php
                        $extension = pathinfo($file->file, PATHINFO_EXTENSION);
                        @endphp
                        @if ($extension == 'pdf')
                        <div class="col-md-3">
                            <a href="javascript:void(0)" class="file" data-url={{ asset('storage/' . $file->file) }}>
                                <img src="{{ asset('assets/img/pdf-icon.svg') }}" alt="File" class="img-fluid w-full"
                                    style="height:80px">
                            </a>
                        </div>
                        @else
                        <div class="col-md-3">
                            <a href="javascript:void(0)" class="file" data-url={{ asset('storage/' . $file->file) }}>
                                <img src="{{ asset('storage/' . $file->file) }}" alt="File" class="img-fluid">
                            </a>
                        </div>
                        @endif
                        @empty

                        @endforelse
                        {{-- @foreach ($detail->files as $file)
                        @php
                        $extension = pathinfo($file->file, PATHINFO_EXTENSION);
                        @endphp
                        @if ($extension == 'pdf')
                        <div class="col-md-3">
                            <a href="javascript:void(0)" class="file" data-url={{ asset('storage/' . $file->file) }}>
                        <img src="{{ asset('assets/img/pdf-icon.svg') }}" alt="File" class="img-fluid w-full"
                            style="height:80px">
                        </a>
                    </div>
                    @endif
                    @else
                    <div class="col-md-3">
                        <a href="javascript:void(0)" class="file" data-url={{ asset('storage/' . $file->file) }}>
                            <img src="{{ asset('storage/' . $file->file) }}" alt="File" class="img-fluid">
                        </a>
                    </div>
                    @endif
                    @endforeach --}}
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