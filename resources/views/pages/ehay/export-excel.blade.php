<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
</head>

<body>

    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            font-family: Arial, sans-serif;
            font-size: 14px;
        }

        thead th {
            background-color: #f2f2f2;
            text-align: center !important;
            padding: 8px;
            border: 1px solid #ddd;
        }

        tbody td {
            padding: 8px;
            border: 1px solid #ddd;
            vertical-align: top;
        }

        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tbody tr:hover {
            background-color: #f1f1f1;
        }

        .text-center {
            text-align: center !important;
        }

        .text-right {
            text-align: right !important;
        }
    </style>

    <table>
        <thead>
            <tr>
                <th colspan="13" rowspan="2" style="text-align: center;vertical-align: middle">Laporan Klaim
                    Pengobatan dan Perawatan</th>
            </tr>
            <tr></tr>
            <tr>
                <th style="width:40px;text-align:center">No.</th>
                <th style="width:180px;text-align:center">Number</th>
                <th style="width:180px;text-align:center">Tanggal Masuk Sistem</th>
                @if ($status === 'ready')
                    <th style="width:180px;text-align:center">Tanggal Approved</th>
                @endif
                <th style="width:120px;text-align:center">NRP</th>
                <th style="width:150px;text-align:center">Nama Karyawan</th>
                <th style="width:150px;text-align:center">Deskripsi</th>
                <th style="width:120px;text-align:center">Status Pasien</th>
                <th style="width:150px;text-align:center">Nama Pasien</th>
                <th style="width:150px;text-align:center">Pengobatan</th>
                <th style="width:120px;text-align:center">Perawatan</th>
                <th style="width:120px;text-align:center">Kacamata</th>
                <th style="width:120px;text-align:center">Total</th>
                @if (!$status || $status !== 'ready')
                    <th style="width:200px;text-align:center">Status</th>
                @endif
            </tr>
        </thead>
        <tbody>
            @foreach ($items as $item)
                <tr>
                    <td style="text-align: center">{{ $loop->iteration }}</td>
                    <td>{{ $item->code }}</td>
                    <td>{{ $item->created_at->translatedFormat('d/m/Y H:i') }}</td>
                    @if ($status === 'ready')
                        <td>{{ $item->currentLogStatusData()->created_at->translatedFormat('d/m/Y H:i') }}</td>
                    @endif
                    <td style="text-align: left">{{ $item->employee->nrp }}</td>
                    <td style="text-align: left">{{ $item->employee->name }}</td>
                    <td>{{ $item->getDescription() }}</td>
                    <td>{{ $item->patient_status }}</td>
                    <td>{{ $item->patient_name }}</td>
                    <td style="text-align:right">Rp {{ number_format($item->ehay_cares_sum_price, 0, ',', '.') }}</td>
                    <td style="text-align:right">Rp {{ number_format($item->ehay_treatments_sum_price, 0, ',', '.') }}
                    </td>
                    <td style="text-align:right">Rp {{ number_format($item->glasses_price, 0, ',', '.') }}</td>
                    <td style="text-align:right">Rp {{ number_format($item->nominal_total, 0, ',', '.') }}</td>
                    @if (!$status || $status !== 'ready')
                        <td style="text-align:center">{{ $item->getStatus() }}</td>
                    @endif
                </tr>
            @endforeach
        </tbody>
    </table>

</body>

</html>
