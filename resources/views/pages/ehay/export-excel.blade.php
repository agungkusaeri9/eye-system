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
            font-size: 11px;
        }

        th, td {
            border: 1px solid #000;
            padding: 4px;
        }

        .total-row {
            background-color: #f9f9f9;
            font-weight: bold;
        }

        .no-border-top {
            border-top: none !important;
        }
    </style>

    <table>
        <tr>
            <td style="text-align:center;vertical-align:middle;font-weight:bold;width:100%" rowspan="2" colspan="{{ $status === 'ready' ? 13 : 13 }}">
                Laporan Klaim Pengobatan dan Perawatan
            </td>
        </tr>
        <tr></tr>
        <!-- Header -->
        <tr>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:30px">No.</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:120px">Number</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Tanggal Masuk Sistem</th>
            @if ($status === 'ready')
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Tanggal Approve</th>
            @endif
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:60px">NRP</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:120px">Nama Karyawan</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:120px">Deskripsi</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:120px">Nama Pasien</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Status Pasien</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Pengobatan</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Perawatan</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Kacamata</th>
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:80px">Total Approve</th>
            @if (!$status || $status !== 'ready')
            <th style="text-align:center;vertical-align:middle;font-weight:bold;background-color:#f2f2f2;width:100px">Status</th>
            @endif
        </tr>

        @php 
            $currentNumber = null; 
            $no = 1;
            $totalPengobatan = 0;
            $totalPerawatan = 0;
            $totalKacamata = 0;
            $grandTotal = 0;
        @endphp

        @foreach ($items as $item)
            @php
                $isNewGroup = $currentNumber !== $item->code;
                if ($isNewGroup) {
                    if ($currentNumber !== null) {
                        // Reset totals for new group
                        $totalPengobatan = 0;
                        $totalPerawatan = 0;
                        $totalKacamata = 0;
                        $grandTotal = 0;
                    }
                    $currentNumber = $item->code;
                }
            @endphp

            @foreach($item->details as $index => $detail)
                @php
                    $totalPengobatan += $detail->cost_treatment;
                    $totalPerawatan += ($detail->cost_care1 + $detail->cost_care2);
                    $totalKacamata += $detail->cost_glasses;
                    $grandTotal += $detail->nominal_total;
                @endphp

                <tr class="{{ $index > 0 ? 'no-border-top' : '' }}">
                    @if ($index === 0)
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">{{ $no }}</td>
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">{{ $item->code }}</td>
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">{{ $item->created_at->format('d/m/Y') }}</td>
                        @if ($status === 'ready')
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">
                            {{ $item->currentLogStatusData()->created_at->format('d/m/Y') }}
                        </td>
                        @endif
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">{{ $item->employee->nrp }}</td>
                        <td style="text-align:left;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">{{ $item->employee->name }}</td>
                    @endif
                    <td style="text-align:left;vertical-align:middle;word-wrap:break-word">{{ $detail->getDescription() }}</td>
                    <td style="text-align:left;vertical-align:middle;word-wrap:break-word">{{ $detail->patient_name }}</td>
                    <td style="text-align:left;vertical-align:middle;word-wrap:break-word">{{ $detail->patient_status }}</td>
                    <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($detail->cost_treatment, 0, ',', '.') }}</td>
                    <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($detail->cost_care1 + $detail->cost_care2, 0, ',', '.') }}</td>
                    <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($detail->cost_glasses, 0, ',', '.') }}</td>
                    @if ($index === 0)
                        <td style="text-align:right;vertical-align:middle;white-space:nowrap" rowspan="{{ count($item->details) }}">Rp. {{ number_format($item->nominal_approve, 0, ',', '.') }}</td>
                    @endif

                    @if (!$status || $status !== 'ready')
                        @if ($index === 0)
                        <td style="text-align:center;vertical-align:middle;word-wrap:break-word" rowspan="{{ count($item->details) }}">
                            {{ $item->getStatus() }}
                        </td>
                        @else
                        {{-- <td style="text-align:center;vertical-align:middle" rowspan="{{ $index === 0 ? count($item->details) + 1 : 1 }}">
                            {{ $detail->ehay->getStatus() }}
                        </td> --}}
                        @endif
                    @endif
                </tr>
            @endforeach

            <!-- Total Row -->
            {{-- <tr class="total-row">
                <td colspan="{{ $status === 'ready' ? 8 : 7 }}" style="font-weight:bold;text-align:center;vertical-align:middle">Total</td>
                <td style="font-weight:bold;text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($totalPengobatan, 0, ',', '.') }}</td>
                <td style="font-weight:bold;text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($totalPerawatan, 0, ',', '.') }}</td>
                <td style="font-weight:bold;text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($totalKacamata, 0, ',', '.') }}</td>
                <td style="font-weight:bold;text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($grandTotal, 0, ',', '.') }}</td>
            </tr> --}}

            @php $no++; @endphp
        @endforeach
        @if ($status === 'ready')
            <tr>
                <td colspan="12" style="text-align:center;vertical-align:middle;font-weight:bold;">
                    Total
                </td>
                <td style="text-align:right;vertical-align:middle;white-space:nowrap">Rp. {{ number_format($items->sum('nominal_approve'), 0, ',', '.') }}</td>
            </tr>
        @endif
    </table>
</body>

</html>
