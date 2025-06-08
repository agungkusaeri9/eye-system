<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Laporan Klaim Pengobatan dan Perawatan</title>

    <style>
        @media print {

            body,
            html {
                margin: 0;
                padding: 0;
            }

            .page {
                page-break-after: auto;
                page-break-inside: avoid;
            }
        }

        /* Atur margin dan padding agar sesuai dengan ukuran A4 */
        @page {
            size: A4 landscape;
            margin: 10mm;
        }

        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            font-size: 14px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 10px !important;
        }

        thead th {
            /* background-color: #f2f2f2; */
            text-align: center;
            padding: 2px;
            border: 1px solid black;
        }

        tfoot th {
            /* background-color: #f2f2f2; */
            text-align: center;
            padding: 6px;
            border: 1px solid black;
        }

        tbody td {
            padding: 2px;
            border: 1px solid black;
            vertical-align: top;
        }

        /* tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        } */

        /* tbody tr:hover {
            background-color: #f1f1f1;
        } */

        .text-center {
            text-align: center;
        }

        .text-right {
            text-align: right;
        }

        .title {
            /* text-align: center;
            font-size: 16px;
            font-weight: bold;
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between */
        }

        /* Mengatur ukuran dan margin untuk tabel header */
        th,
        td {
            padding: 2px;
            text-align: center;
            text-transform: uppercase;
        }

        .image-table {
            width: 100%;
            border-collapse: collapse;
        }

        .image-table td {
            width: 50%;
            height: 300px;
            /* contoh tinggi tetap */
            text-align: center;
            vertical-align: middle;
            padding: 0;
            border: none;
        }

        .image-table img {
            max-width: 100%;
            max-height: 100%;
            height: auto;
            display: inline-block;
            object-fit: contain;
        }

        @page {
            margin-top: 120px;
            margin-bottom: 50px;
        }

        header {
            position: fixed;
            top: -80px;
            left: 0;
            right: 0;
            height: 80px;
            /* Optional border */
            /* border-bottom: 1px solid #ccc; */
        }

        .signature-table {
            page-break-inside: avoid;
            /* hindari terpotong di tengah tabel */
            page-break-before: auto;
            /* pindah ke halaman baru jika perlu */
            margin-top: 50px;
            /* beri jarak atas sesuai kebutuhan */
        }
    </style>
</head>

<body style="">

    <div style="padding:10px 80px">
        <header>
            <table style="margin-bottom:20px; width: 100%;">
                <tr>
                    <th style="text-align: right; width:40%">
                        @php
                            $path = public_path('assets/img/logo.png');
                            $type = pathinfo($path, PATHINFO_EXTENSION);
                            $data = file_get_contents($path);
                            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                        @endphp
                        <img src="{{ $base64 }}" alt="Logo" style="height: 60px;">
                    </th>
                    <th style="text-align: left; width:60%">
                        <div>
                            <h3 style="margin: 0; color: gray; font-size: 16px">
                                PT. KALIMANTAN PRIMA PERSADA
                            </h3>
                            <div style="font-style: italic; color: black; font-size:14px; margin-left:55px">
                                Integrated Mining Service
                            </div>
                        </div>
                    </th>
                </tr>
            </table>
        </header>
        <table>
            <thead>
                <tr>
                    <th colspan="8" style="text-align: center">KLAIM DEKLARASI PENGOBATAN PERAWATAN DAN KACAMATA</th>
                </tr>
                <tr>
                    <th colspan="2" style="font-weight:normal;width:3px;border-right:0px solid black !important;"
                        width="3">Tanggal
                    </th>
                    <th
                        style="font-weight:normal;width:40px;text-align:left;border-left:0px solid black !important;border-right:0px solid black !important">
                        : {{ $date }}</th>
                    <th
                        style="font-weight:normal;border-right:0px solid black !important;border-left:0px solid black !important">
                    </th>
                    <th colspan="2"
                        style="font-weight:normal;width:20px;border-right:0px solid black !important;border-left:0px solid black !important">
                        ID
                        Rekap</th>
                    <th
                        style="font-weight:normal;width:40px;text-align:left;border-right:0px solid black !important;border-left:0px solid black !important">
                        :</th>
                    <th style="font-weight:normal;width:40px;text-align:left;border-right:1px solid black !important;border-left:0px solid black !important">
                        </th>
                </tr>
                <tr>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:40px">NO.</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:100px">NRP</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:170px">NAMA KARYAWAN</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:120px">DEPARTMENT</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:120px">PENGOBATAN</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:120px">PERAWATAN</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:120px">KACAMATA</th>
                    <th style="text-align:center;vertical-align:middle;font-weight:bold;width:100px;border-right:1px solid black !important">TOTAL APPROVE</th>
                </tr>
            </thead>
            <tbody>
    
            @foreach ($items as $item)
            <tr>
                <td style="text-align:center;vertical-align:middle;word-wrap:break-word">{{ $loop->iteration }}</td>
                <td style="text-align:center;vertical-align:middle;word-wrap:break-word">{{ $item->employee->nrp }}</td>
                <td style="text-align:center;vertical-align:middle;word-wrap:break-word">{{ $item->employee->name }}</td>
                <td style="text-align:center;vertical-align:middle;word-wrap:break-word">{{ $item->employee->department->name }}</td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($item->details->sum('cost_treatment'), 0, ',', '.') }}</td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format(($item->details->sum('cost_care1') + $item->details->sum('cost_care2')), 0, ',', '.') }}</td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($item->details->sum('cost_glasses'), 0, ',', '.') }}</td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($item->nominal_approve, 0, ',', '.') }}</td>
            </tr>
            @endforeach
            <tr>
                <td colspan="7" style="text-align:center;vertical-align:middle;font-weight:bold;width:100%">TOTAL</td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap font-weight:bold">Rp. {{ number_format($items->sum('nominal_approve'), 0, ',', '.') }}</td>
            </tr>
            </tbody>
        </table>
        <div class="signature-table">
            <header>
                <table style="margin-bottom:20px; width: 100%;">
                    <tr>
                        <th style="text-align: right; width:40%">
                            @php
                                $path = public_path('assets/img/logo.png');
                                $type = pathinfo($path, PATHINFO_EXTENSION);
                                $data = file_get_contents($path);
                                $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                            @endphp
                            <img src="{{ $base64 }}" alt="Logo" style="height: 60px;">
                        </th>
                        <th style="text-align: left; width:60%">
                            <div>
                                <h3 style="margin: 0; color: gray; font-size: 16px">
                                    PT. KALIMANTAN PRIMA PERSADA
                                </h3>
                                <div style="font-style: italic; color: black; font-size:14px; margin-left:55px">
                                    Integrated Mining Service
                                </div>
                            </div>
                        </th>
                    </tr>
                </table>
            </header>

            <table style="margin-top: 120px">
                <tr>
                    <th style="text-transform: capitalize;font-weight:normal;font-size:11px"> Dibuat Oleh :</th>
                    <th style="text-transform: capitalize;font-weight:normal;font-size:11px"> Diperiksa Oleh :</th>
                    <th style="text-transform: capitalize;font-weight:normal;font-size:11px"> Disetujui Oleh :</th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th></th>
                    <th></th>
                    <th></th>
                </tr>
                <tr>
                    <th style="padding:0">
                        <div style="font-weight: bold;margin-bottom:8px;font-size:11px">
                            RIZKY WAHYU <br> FADHLILLAH
                        </div>
                    </th>
                    <th style="padding:0">
                        <div style="font-weight: bold;margin-bottom:8px;font-size:11px">
                            FENDI ARIFIANTO
                        </div>
                    </th>
                    <th style="padding:0">
                        <div style="font-weight: bold;margin-bottom:8px;font-size:11px">
                            SEPTI AJI NUGROHO
                        </div>
                    </th>
                </tr>
                <tr>
                    <th style="font-weight: normal;font-size:11px;padding:0">HUMMAN CAPITAL OFFICER</th>
                    <th style="font-weight: normal;font-size:11px;padding:0"> HCGS & FAT DEP. HEAD</th>
                    <th style="font-weight: normal;font-size:11px;padding:0"> PROJECT MANAGER</th>
                </tr>
            </table>
        </div>
    </div>

    @php
        $filesArray = $files ? $files->toArray() : [];
        $chunks = array_chunk($filesArray, 4);
        $chunksCount = count($chunks);
        $hasSignature = true; // karena ada tabel tanda tangan di halaman sebelumnya
    @endphp

    @foreach ($chunks as $index => $chunk)
        <div
            style="
        {{ $index === 0 && $hasSignature ? 'page-break-before: always;' : '' }}
        {{ $index + 1 < $chunksCount ? 'page-break-after: always;' : '' }}
    ">
            <table class="image-table" style="width:100%;">
                @for ($row = 0; $row < 2; $row++)
                    <tr>
                        @for ($col = 0; $col < 2; $col++)
                            @php $idx = $row * 2 + $col; @endphp
                            @if (isset($chunk[$idx]))
                                @php
                                    $relativePath = 'app/public/' . $chunk[$idx]['file'];
                                    $path = storage_path($relativePath);
                                @endphp

                                @if (file_exists($path))
                                    <td style="margin: 5px; text-align:center;">
                                        @php
                                            $type = pathinfo($path, PATHINFO_EXTENSION);
                                            $data = file_get_contents($path);
                                            $base64 = 'data:image/' . $type . ';base64,' . base64_encode($data);
                                        @endphp
                                        <img src="{{ $base64 }}" alt="Image {{ $idx + 1 }}"
                                            style="max-width: 100%; height: auto;">
                                    </td>
                                @endif
                            @endif
                        @endfor
                    </tr>
                @endfor
            </table>


        </div>
    @endforeach


</body>

</html>
