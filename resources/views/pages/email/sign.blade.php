<!DOCTYPE html>
<html lang="en">
    <head>
        <title>{{ $subject }}</title>
    </head>
    <body>
        Yth. Pengguna Eye System
        <br /><br />

        @if ($type == 'new')
            @if($category == 'E-Sign')
                Terkirim data {{ $category }} baru dengan id <strong>{{ $sign_number }}</strong> yang ditujukan kepada <strong>{{ $name }}</strong> silahkan segera di periksa<br /><br />
                Catatan untuk validator :<br />
                <strong>{{ $sender }}</strong><br /><br />
            @else
                Terkirim data {{ $category }} baru dengan id <strong>{{ $sign_number }}</strong> yang ditujukan kepada <strong>{{ $name }}</strong> silahkan segera di periksa<br />
            @endif
            Terimakasih
        @elseif ($type == 'accept')
            Hai <strong>{{ $name }}</strong> dokumen {{ $category }} dengan id <strong>{{ $sign_number }}</strong> telah diterima oleh <strong>{{ $sender }}</strong><br />
            Terimakasih
        @elseif ($type == 'reject')
            Mohon maaf dokumen {{ $category }} dengan id <strong>{{ $sign_number }}</strong> telah ditolak oleh <strong>{{ $name }}</strong> silahkan upload dokumen kembali<br />
            Terimakasih
        @elseif ($type == 'return')
            Data dokumen {{ $category }} dengan id <strong>{{ $sign_number }}</strong> telah diperbaiki kembali oleh <strong>{{ $name }}</strong>  silahkan segera di periksa<br /><br />
            Catatan untuk validator :<br />
            <strong>{{ $sender }}</strong><br /><br />
            Terimakasih
        @elseif ($type == 'closed')
            Pengajuan E-Sign dengan nomor <strong>{{ $sign_number }}</strong> sudah diapproved oleh semua validator
            Terimakasih
        @endif
        <br /><br />
        Untuk login ke dalam sistem silahkan mengakses link berikut : <br />
        <a href="{{ url('') }}">{{ url('') }}</a>
        <br /><br />

        KPP ASTO_EYE SYSTEM
    </body>
</html>
