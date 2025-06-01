@extends('layouts.master')
@section('content')

<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data E-Sign  /</span> Feature / {{ $title }}
</h4>
<div class="row">
    <div class="col">
      <div class="card mb-4">
        <div class="d-md-flex align-items-center justify-content-between text-center">
            <h5 class="card-header">{{ $title }}</h5>
            <div class="flex align-items-center justify-content-end">
                @if(\Auth::user()->role !== 2)
                    <a href="{{ route('sign.print', $sign->id) }}" target="__blank" class="btn btn-success me-md-3 my=2"><i class="fas fa-download me-2"></i>Cetak Detail</a>
                @endif
                <button data-bs-toggle="modal" data-bs-target="#exampleModal" class="btn btn-info me-md-3 my=2">Lihat Log</button>
            </div>
        </div>
        <div class="card-body">
          <table id="wo-detail" class="table table-borderless">
            <tbody>
                @if(\Auth::user()->role == 2)
                    <tr>
                        <td>
                            <div class="text-dark fw-bold"><strong>Catatan dari customer</strong></div>
                        </td>
                        <td>
                            <div class="text-dark fw-bold"><em>{{ $getHistoryData->note_customer }}</em></div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr></td>
                    </tr>
                @endif
                <tr>
                    <td colspan="2"><span class="text-dark fw-bold">Data E-Sign</span></td>
                </tr>
              <tr>
                <td><small class="text-light fw-semibold">Nama E-Sign</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $sign->name }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">File Berita Acara</small></td>
                <td class="py-1">
                  <p class="mb-0">
                    <a href="{{ asset('storage/'.$sign->sign_file) }}" target="__blank">{{ basename($sign->sign_file) }}</a>
                  </p>
                </td>
              </tr>
              {{-- <tr>
                <td><small class="text-light fw-semibold">Status Pengajuan Berita Acara</small></td>
                <td class="py-1">
                  <p class="mb-0">
                    <span class="btn @if($sign->sign == 'Pending') btn-outline-warning @elseif($sign->sign == 'Diterima') btn-outline-success @elseif($sign->sign == 'Ditolak') btn-outline-danger @endif py-2 px-3 rounded-pill"><em>{{ $sign->sign }}</em></span>
                  </p>
                </td>
              </tr> --}}
              <tr>
                <td><small class="text-light fw-semibold">File E-Sign Untuk Verifikasi</small></td>
                <td class="py-1">
                    @if(\Auth::user()->role == 2)
                        @if($sign->sign == 'Diterima')
                            <p class="mb-0">
                                <a href="{{ asset('storage/'.$sign->verified_sign_file) }}" target="__blank">{{ basename($sign->verified_sign_file) }}</a>
                            </p>
                        @elseif($sign->sign == 'Ditolak')
                            <em>Menunggu customer melakukan update data berita acara</em>
                        @else
                            @if(!$checkHistory)
                                <em>Terima Berita Acara Terlebih Dahulu untuk Membuka File E-Sign</em>
                            @else
                                @if($checkHistory->news_status == 'Diterima')
                                    <p class="mb-0">
                                        <a href="{{ asset('storage/'.$sign->verified_sign_file) }}" target="__blank">{{ basename($sign->verified_sign_file) }}</a>
                                    </p>
                                @else
                                    <em>Terima Berita Acara Terlebih Dahulu untuk Membuka File E-Sign</em>
                                @endif
                            @endif
                        @endif
                    @else
                        <p class="mb-0">
                            <a href="{{ asset('storage/'.$sign->verified_sign_file) }}" target="__blank">{{ basename($sign->verified_sign_file) }}</a>
                        </p>
                    @endif
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Status Pengajuan E-Sign</small></td>
                <td class="py-1">
                    @if(\Auth::user()->role == 2)
                        @if($sign->sign == 'Diterima')
                            <p class="mb-0">
                                <span class="btn @if($sign->signature == 'Pending') btn-outline-warning @elseif($sign->signature == 'Diterima') btn-outline-success @elseif($sign->signature == 'Ditolak') btn-outline-danger @endif py-2 px-3 rounded-pill"><em>{{ $sign->signature }}</em></span>
                            </p>
                        @elseif($sign->sign == 'Ditolak')
                            <em>Menunggu customer melakukan update data berita acara</em>
                        @else
                            @if(!$checkHistory)
                                <em>Terima Berita Acara Terlebih Dahulu untuk Membuka File E-Sign</em>
                            @else
                                @if($checkHistory->news_status == 'Diterima')
                                    <p class="mb-0">
                                        <span class="btn @if($sign->signature == 'Pending') btn-outline-warning @elseif($sign->signature == 'Diterima') btn-outline-success @elseif($sign->signature == 'Ditolak') btn-outline-danger @endif py-2 px-3 rounded-pill"><em>{{ $sign->signature }}</em></span>
                                    </p>
                                @else
                                    <em>Terima Berita Acara Terlebih Dahulu untuk Membuka File E-Sign</em>
                                @endif
                            @endif
                        @endif
                    @else
                        <p class="mb-0">
                            <span class="btn @if($sign->signature == 'Pending') btn-outline-warning @elseif($sign->signature == 'Diterima') btn-outline-success @elseif($sign->signature == 'Ditolak') btn-outline-danger @endif py-2 px-3 rounded-pill"><em>{{ $sign->signature }}</em></span>
                        </p>
                    @endif
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Tanggal Pengiriman</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ date('d-m-Y H:i', strtotime($sign->created_at)) }}</p>
                </td>
              </tr>
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Pembuat Berita Acara</span></td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Nama</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $sign->from->name }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">NRP</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $sign->from->nrp }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Email</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $sign->from->email }}</p>
                </td>
              </tr>
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Ditujukan Kepada</span></td>
              </tr>
              @foreach ( $user as $index => $us )
              @php
                  $history = \App\Models\SignHistory::where('sign_id', $sign->id)->where('validator_id', $us->id)->first();
              @endphp
                <tr>
                    <td><small class="text-light fw-semibold">Nama</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->name }}</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">NRP</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->nrp }}</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Departemen</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->departemen->name }}</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Jabatan</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->jabatan->name }}</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Distrik</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->distrik->name }}</p>
                    </td>
                </tr>
                {{-- <tr>
                    <td><small class="text-light fw-semibold">Status Penerimaan Berita Acara</small></td>
                    <td class="py-1">
                    <p class="mb-0">@if($history && $history->news_status) <strong> @if($history->news_status == 'Diterima') {{ $history->news_status }} pada {{ date('d-m-Y H:i', strtotime($history->approved_news_date)) }} @else {{ $history->news_status }} @endif </strong> @else <span class="text-warning"><em>Belum melakukan validasi</em></span> @endif</p>
                    </td>
                </tr> --}}
                <tr>
                    <td><small class="text-light fw-semibold">Status Penerimaan E-Sign</small></td>
                    <td class="py-1">
                    <p class="mb-0">@if($history && $history->sign_status) <strong> @if($history->sign_status == 'Diterima') {{ $history->sign_status }} pada {{ date('d-m-Y H:i', strtotime($history->approved_sign_date)) }} @else {{ $history->sign_status }} @endif </strong> @else <span class="text-warning"><em>Belum melakukan validasi</em></span> @endif</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Catatan : </small></td>
                    <td class="py-1">
                    <p class="mb-0">@if($history && $history->sign_status) <strong> @if($history->sign_status == 'Diterima') {{ $history->accepted_note ? $history->accepted_note : 'Tidak ada catatan' }} @elseif($history->sign_status == 'Ditolak') {{ $history->rejected_reason ? $history->rejected_reason : 'Tidak ada catatan' }} @endif </strong> @else <span class="text-warning"><em>Belum melakukan validasi</em></span> @endif</p>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><hr /></td>
                </tr>
              @endforeach
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Dokumen Pendukung</span></td>
              </tr>
              @if (count($sign->support) > 0)
                @foreach($sign->support as $support)
                    <tr>
                        <td class="py-1 w-100" colspan="2">
                            <p class="mb-0">
                                <a href="{{ asset('storage/'.$support->sign_document) }}" target="__blank">{{ basename($support->sign_document) }}</a>
                            </p>
                        </td>
                    </tr>
                @endforeach
              @else
                    <tr>
                        <td class="py-1 w-100" colspan="2">
                            <p class="mb-0">
                                <em>Tidak ada dokumen pendukung ditemukan</em>
                            </p>
                        </td>
                    </tr>
              @endif
              <tr>
                <td colspan="2">
                    <hr>
                </td>
              </tr>
              @if(\Auth::user()->role == 2)
                <tr>
                    @if($sign->sign == 'Pending')
                        @if (!$checkHistory || $checkHistory->news_status !== 'Diterima')
                            <td colspan="2">
                                <div class="d-flex align-items-center">
                                    <button id="terima" name="sign" class="btn btn-info">Terima Berita Acara</button>
                                    <button id="tolak" name="sign" class="btn btn-danger ms-2">Tolak Berita Acara</button>
                                </div>
                            </td>
                        @endif

                        @if ($checkHistory && $checkHistory->news_status == 'Diterima')
                            <td colspan="2">
                                <strong>Keterangan : </strong><br />
                                <em><span>Menunggu validator lain untuk menerima berita acara</span></em>
                            </td>
                        @endif
                    @endif

                    @if($sign->sign == 'Diterima' && $sign->signature == 'Pending')
                        @if($checkHistory)
                            @if ($checkHistory->sign_status !== 'Diterima')
                            <td colspan="2">
                                <div class="d-flex align-items-center">
                                    <button id="terima" name="signature" class="btn btn-info">Terima E-Sign</button>
                                    <button id="tolak" name="signature" class="btn btn-danger ms-2">Tolak E-Sign</button>
                                </div>
                            </td>
                            @endif
                            @if ($checkHistory->sign_status == 'Diterima')
                                <td colspan="2">
                                    <strong>Keterangan : </strong><br />
                                    <em><span>Menunggu validator lain untuk menerima E-sign</span></em>
                                </td>
                            @endif
                        @else
                            <td colspan="2">
                                <strong>Keterangan : </strong><br />
                                <em><span>Menunggu validator lain untuk menerima E-sign terlebih dahulu</span></em>
                            </td>
                        @endif
                    @endif
                </tr>
               @endif
            </tbody>
          </table>
        </div>
      </div>
    </div>
</div>
<input type="hidden" value="{{ $sign->id }}" id="id">
<input type="hidden" id="signature" value="{{ auth()->user()->signature }}">
<div id="pre-loading-submit" class="d-none position-fixed w-100 d-flex align-items-center justify-content-center" style="top: 0; left: 0; height: 100vh; z-index:9999; background-color: rgba(0,0,0,0.8)">
    <img src="{{ asset('assets/img/loading.gif') }}" alt="" width="150px">
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="exampleModalLabel">Log E-Sign</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <div class="" style="text-align: justify">
                <ul>
                    @foreach ( $log as $lg )
                    <li>
                        <div class="mb-3">
                            <span class="mb-0"><strong>{{ $lg->log_title }}</strong></span><br />
                            <small>{{ $lg->log_description }}</small><br />
                            <small class="text-secondary"><em>{{ date('d-m-Y H:i', strtotime($lg->created_at)) }}</em></small>
                        </div>
                    </li>
                    @endforeach
                </ul>
            </div>
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
    $(document).ready(function(){
        let id = $('input[id=id]').val();
        $("#terima").on('click', function(e) {
            e.preventDefault();
            let type = $(this).attr('name');

            Swal.fire({
                title: 'Terima Data?',
                text: type === 'sign' ? "Setujui data bersifat permanen!" : "Klik terima untuk beralih ke halaman pembubuhan tanda tangan!",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, Terima!'
            }).then((result) => {
                if (result.isConfirmed) {
                    $('#pre-loading-submit').removeClass('d-none')
                    if(type === 'signature'){
                        if($('#signature').val()) document.location.href="/sign/lihat-dokumen/"+id;
                        else {
                            $('#pre-loading-submit').addClass('d-none')
                            Swal.fire({
                                title: 'Tidak dapat beralih halaman',
                                text: 'Tanda tangan belum di upload, silahkan hubungi admin untuk mengupload tanda tangan',
                                icon: 'error'
                            })
                        }
                    } else {
                        let action = 'terima';
                        var dataSend = new FormData();
                        dataSend.append('_token', $('meta[name="csrf-token"]').attr('content'));

                        $.ajax({
                            url: "/sign/aksi/"+id+"/"+type+"/"+action,
                            method: 'POST',
                            data: dataSend,
                            contentType: false,
                            processData:false,
                            success: function(response){
                                $('#pre-loading-submit').addClass('d-none')
                                Swal.fire({
                                    text: response.message,
                                    icon: "success"
                                }).then(() => {
                                    document.location.href="{{ route('sign.index') }}"
                                })
                            },
                            error: function(response){
                                $('#pre-loading-submit').addClass('d-none')
                            }
                        })
                    }
                }
            })
        });

        $("#tolak").on('click', function(e) {
            e.preventDefault();

            Swal.fire({
                title: 'Tolak Data?',
                text: "Anda yakin untuk mengembalikan data ini?",
                icon: 'warning',
                showCancelButton: true,
                confirmButtonColor: '#3085d6',
                cancelButtonColor: '#d33',
                confirmButtonText: 'Ya, Tolak!'
            }).then((result) => {
                if (result.isConfirmed) {
                    Swal.fire({
                        title: "Masukkan alasan penolakan anda",
                        input: "text",
                        inputAttributes: {
                            autocapitalize: "off"
                        },
                        showCancelButton: true,
                        confirmButtonText: "Tolak Data",
                        showLoaderOnConfirm: true,
                        preConfirm: async (text) => {
                            $('#pre-loading-submit').removeClass('d-none')
                            let type = $(this).attr('name');
                            let action = 'tolak';

                            var dataSend = new FormData();
                            dataSend.append('_token', $('meta[name="csrf-token"]').attr('content'));
                            dataSend.append('alasan_ditolak', text ? text : '');
                            $.ajax({
                                url: "/sign/aksi/"+id+"/"+type+"/"+action,
                                method: 'POST',
                                data: dataSend,
                                contentType: false,
                                processData:false,
                                success: function(response){
                                    console.log(response)
                                    $('#pre-loading-submit').addClass('d-none')
                                    Swal.fire({
                                        text: response.message,
                                        icon: "success"
                                    }).then(() => {
                                        document.location.href="{{ route('sign.index') }}"
                                    })
                                },
                                error: function(response){
                                    $('#pre-loading-submit').addClass('d-none')
                                }
                            })
                        }
                    });
                }
            })
        });
    })
  </script>
@endsection
