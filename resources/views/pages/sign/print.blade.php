<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>E-Sign | {{ $sign->sign_number }}</title>

    <style>
        body{
            font-family: "Roboto", sans-serif;
        }
        .text-center{
            text-align: center
        }
        .fw-bold{
            font-weight: bold;
        }
        .fw-semibold{
            font-weight: 700;
        }
        .text-dark{
            color: black;
        }
        .text-light{
            color: #555353;
        }
        .py-1{
            padding: 5px 0;
        }
        .text-warning{
            color: rgb(190, 190, 82);
        }
        .text-success{
            color: rgb(18, 94, 18);
        }
        .text-danger{
            color: rgb(95, 33, 33);
        }
    </style>
</head>
<body>
    <div>
        <div>
            <h4 style="margin: 0">Eye System PT. Kalimantan Prima Persada</h4>
            <hr color="black">
        </div>
        <div>
            <div style="background-color: lightgray; padding: 10px; border-top: 2px solid black; border-bottom: 2px solid black">
                <h3 style="margin: 0 0 5px 0">Data Laporan E-Sign</h3>
                <small><em>Nomor E-Sign : <strong>{{ $sign->sign_number }}</strong></em></small>
            </div>
            <hr>
        </div>
        <div>
            <div style="background-color: lightgray; padding: 10px; border-top: 2px solid black; border-bottom: 2px solid black">
                <h4 style="margin: 0">Dokumen ini sebagai data pendukung E-Signature Sah</h4>
            </div>
            <hr>
        </div>
        <section>
            <table id="wo-detail" class="table table-borderless" style="width: 100%;">
                <tr>
                    <td colspan="2">
                        <p class="text-dark fw-bold">Data E-Sign</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Nama E-Sign</small></td>
                    <td class="py-1">
                        <small>{{ $sign->name }}</small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">File Berita Acara</small></td>
                    <td class="py-1">
                        <small><a href="{{ asset('storage/'.$sign->sign_file) }}" target="__blank">{{ basename($sign->sign_file) }}</a></small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">File E-Sign Untuk Verifikasi</small></td>
                    <td class="py-1">
                        <small class="mb-0">
                            <a href="{{ asset('storage/'.$sign->verified_sign_file) }}" target="__blank">{{ basename($sign->verified_sign_file) }}</a>
                        </small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Status Pengajuan E-Sign</small></td>
                    <td class="py-1">
                        <small class="mb-0">
                            <span class="fw-bold @if($sign->signature == 'Pending') text-warning @elseif($sign->signature == 'Diterima') text-success @elseif($sign->signature == 'Ditolak') text-danger @endif"><em>{{ $sign->signature }}</em></span>
                        </small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Tanggal Pengiriman</small></td>
                    <td class="py-1">
                      <small class="mb-0">{{ date('d-m-Y H:i', strtotime($sign->created_at)) }}</small>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <p class="text-dark fw-bold">Pembuat Berita Acara</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Nama</small></td>
                    <td class="py-1">
                        <small class="mb-0">{{ $sign->from->name }}</small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">NRP</small></td>
                    <td class="py-1">
                        <small class="mb-0">{{ $sign->from->nrp }}</small>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Email</small></td>
                    <td class="py-1">
                        <small class="mb-0">{{ $sign->from->email }}</small>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <p class="text-dark fw-bold">Ditujukan Kepada</p>
                    </td>
                </tr>
                @foreach ( $user as $index => $us )
                    @php
                        $history = \App\Models\SignHistory::where('sign_id', $sign->id)->where('validator_id', $us->id)->first();
                    @endphp
                    <tr>
                        <td><small class="text-light fw-semibold">Nama</small></td>
                        <td class="py-1">
                            <small class="mb-0">{{ $us->name }}</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">NRP</small></td>
                        <td class="py-1">
                            <small class="mb-0">{{ $us->nrp }}</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">Departemen</small></td>
                        <td class="py-1">
                            <small class="mb-0">{{ $us->departemen->name }}</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">Jabatan</small></td>
                        <td class="py-1">
                            <small class="mb-0">{{ $us->jabatan->name }}</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">Distrik</small></td>
                        <td class="py-1">
                            <small class="mb-0">{{ $us->distrik->name }}</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">Status Penerimaan E-Sign</small></td>
                        <td class="py-1">
                            <small class="mb-0">@if($history && $history->sign_status) <strong> @if($history->sign_status == 'Diterima') {{ $history->sign_status }} pada {{ date('d-m-Y H:i', strtotime($history->approved_sign_date)) }} @else {{ $history->sign_status }} @endif </strong> @else <span class="text-warning"><em>Belum melakukan validasi</em></span> @endif</small>
                        </td>
                    </tr>
                    <tr>
                        <td><small class="text-light fw-semibold">Catatan </small></td>
                        <td class="py-1">
                            <small class="mb-0">@if($history && $history->sign_status) <strong> @if($history->sign_status == 'Diterima') {{ $history->accepted_note ? $history->accepted_note : 'Tidak ada catatan' }} @elseif($history->sign_status == 'Ditolak') {{ $history->rejected_reason ? $history->rejected_reason : 'Tidak ada catatan' }} @endif </strong> @else <span class="text-warning"><em>Belum melakukan validasi</em></span> @endif</small>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2"><hr /></td>
                    </tr>
                @endforeach


                <tr>
                    <td colspan="2">
                        <p class="text-dark fw-bold">Dokumen Pendukung</p>
                    </td>
                </tr>
                @if (count($sign->support) > 0)
                    @foreach($sign->support as $support)
                        <tr>
                            <td class="py-1" colspan="2" style="padding-left: 10px">
                                <small class="mb-0">
                                    <a href="{{ asset('storage/'.$support->sign_document) }}" target="__blank">{{ basename($support->sign_document) }}</a>
                                </small>
                            </td>
                        </tr>
                    @endforeach
                @else
                    <tr>
                        <td class="py-1 w-100" colspan="2">
                            <small class="mb-0">
                                <em>Tidak ada dokumen pendukung ditemukan</em>
                            </small>
                        </td>
                    </tr>
                @endif


                <tr>
                    <td colspan="2">
                        <hr>
                    </td>
                </tr>
            </table>
        </section>
    </div>
</body>
</html>
