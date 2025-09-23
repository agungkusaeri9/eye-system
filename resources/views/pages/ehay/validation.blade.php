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
                    <div class="row">
                        <div class="col-md">
                            @if (auth()->user()->role == 4)
                                <button class="btn btn-success" name="btn" value="1">Approve</button>
                            @elseif (auth()->user()->role == 5)
                                <button class="btn btn-success btnApprove" name="btn" type="button"
                                    value="1">Approve</button>
                            @endif
                            <button class="btn btn-danger btnReject" name="btn" value="0">Reject</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <div class="row mb-2">
        <div class="col-md-12 mb-2">
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
                                        <input disabled type='text' name='employee_department' id='employee_department'
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
        <div class="col-md-12 mb-2">
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
                                        {{ number_format($detail->cost_treatment, 0, ',', '.') }}</td>
                                    <td>{{ $detail->care_type1 ?? '-' }}</td>
                                    <td class="text-end">RP.
                                        {{ number_format($detail->cost_care1, 0, ',', '.') }}
                                    </td>
                                    <td>{{ $detail->care_type2 ?? '-' }}</td>
                                    <td class="text-end">RP.
                                        {{ number_format($detail->cost_care2, 0, ',', '.') }}
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
                                    {{ number_format($item->details->sum('nominal_total'), 0, ',', '.') }}
                                </th>
                            </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md">
            <div class="card">
                <div class="card-header pb-0 d-flex gap-2">
                    <h4>Files</h4>
                </div>
                <div class="card-body row">
                    @foreach ($item->details as $detail)
                        @foreach ($detail->files as $file)
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
                    @endforeach
                </div>
            </div>
        </div>
    </div>

    <div class="row">

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
                    <button type="button" class="btn btn-primary" id="rotateLeft">⟲ Rotate Left</button>
                    <button type="button" class="btn btn-primary" id="rotateRight">⟳ Rotate Right</button>
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

    <!-- Modal -->
    <div class="modal fade" id="modalApprove" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="exampleModalLabel">Approve</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="" id="formApprove" method="post">
                    <div class="modal-body">
                        @csrf

                        <div class='form-group mb-3'>
                            <label for='total' class='mb-2'>Nominal Total</label>
                            <input type='text' name='total' id='total' disabled
                                class='form-control @error('total') is-invalid @enderror'>
                        </div>
                        <div class='form-group mb-3'>
                            <label for='nominal' class='mb-2'>Nominal Disetujui</label>
                            <input type='text' name='nominal' id='nominal'
                                class='form-control @error('nominal') is-invalid @enderror nominal'>
                            @error('nominal')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Approve Claim</button>
                    </div>
                </form>
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

            function formatRupiah(angka) {
                let reverse = angka.toString().split('').reverse().join('');
                let ribuan = reverse.match(/\d{1,3}/g);
                return ribuan.join('.').split('').reverse().join('');
            }

            $('.btnApprove').on('click', function() {
                let nominal = '{{ $item->nominal_total }}';
                let uuid = '{{ $item->uuid }}';
                let route = '{{ route('ehay.approve', ['uuid' => ':uuid']) }}';
                route = route.replace(':uuid', uuid);
                $('#formApprove').attr('action', route);
                $('#total').val(formatRupiah(nominal));
                $('#nominal').val(formatRupiah(nominal));
                $('#modalApprove').modal('show');
            });

            $('.nominal').on('input', function() {
                let value = this.value.replace(/\D/g, '');
                value = new Intl.NumberFormat('id-ID').format(value);
                this.value = value;
            })

            let rotation = 0;

            $('body').on('click', '.file', function() {
                var url = $(this).data('url');
                var extension = url.split('.').pop().toLowerCase();
                rotation = 0; // reset tiap kali buka gambar baru

                if (extension === 'pdf') {
                    $('#iframeDetail').removeClass('d-none');
                    $('#imgDetail').addClass('d-none');
                    $('#iframeDetail').attr('src', url);
                } else {
                    $('#imgDetail').removeClass('d-none');
                    $('#iframeDetail').addClass('d-none');
                    $('#imgDetail').attr('src', url).css('transform', 'rotate(0deg)');
                }
                $('#modalDetail').modal('show');
            });

            $('#rotateLeft').on('click', function() {
                rotation -= 90;
                $('#imgDetail').css('transform', 'rotate(' + rotation + 'deg)');
            });

            $('#rotateRight').on('click', function() {
                rotation += 90;
                $('#imgDetail').css('transform', 'rotate(' + rotation + 'deg)');
            });
        })
    </script>
@endsection
