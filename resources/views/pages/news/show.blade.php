@extends('layouts.master')
@section('content')
<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data Berita Acara  /</span> Feature / {{ $title }}
</h4>
<div class="row">
    <!-- Inline text elements -->
    <div class="col">
      <div class="card mb-4">
        <h5 class="card-header">{{ $title }}</h5>
        <div class="card-body">
          <table id="wo-detail" class="table table-borderless">
            <tbody>
                <tr>
                    <td colspan="2"><span class="text-dark fw-bold">Data Berita Acara</span></td>
                </tr>
              <tr>
                <td><small class="text-light fw-semibold">Nama Berita</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $news->name }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">File Berita</small></td>
                <td class="py-1">
                  <p class="mb-0">
                    <a href="{{ asset('storage/'.$news->sign_file) }}" target="__blank">{{ basename($news->sign_file) }}</a>
                  </p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Tanggal Pengiriman</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ date('d-m-Y H:i', strtotime($news->created_at)) }}</p>
                </td>
              </tr>
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Pembuat Berita Acara</span></td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Nama</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $news->from->name }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">NRP</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $news->from->nrp }}</p>
                </td>
              </tr>
              <tr>
                <td><small class="text-light fw-semibold">Email</small></td>
                <td class="py-1">
                  <p class="mb-0">{{ $news->from->email }}</p>
                </td>
              </tr>
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Ditujukan Kepada</span></td>
              </tr>
              @foreach ( $user as $index => $us )
                <tr>
                    <td><small class="text-light fw-semibold">Nama</small></td>
                    <td class="py-1">
                    <p class="mb-0">{{ $us->name }}</p>
                    </td>
                </tr>
                <tr>
                    <td><small class="text-light fw-semibold">Nama</small></td>
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
                <tr>
                    <td colspan="2"><hr /></td>
                </tr>
              @endforeach
              <tr>
                <td colspan="2"><span class="text-dark fw-bold">Dokumen Pendukung</span></td>
              </tr>
              @foreach($news->support as $support)
                <tr>
                    <td class="py-1 w-100" colspan="2">
                        <p class="mb-0">
                            <a href="{{ asset('storage/'.$support->sign_document) }}" target="__blank">{{ basename($support->sign_document) }}</a>
                        </p>
                    </td>
                </tr>
              @endforeach
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>

@endsection

@section('page-script')
  <script>
    $(document).ready(function(){
        $("#wo-detail").on('click', '.btn-accept', function(e) {
            e.preventDefault();
                Swal.fire({
                    title: 'Edit data?',
                    text: "Setujui data bersifat permanen!",
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Ya, Terima!'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $(this).parent().submit()
                    }
                })
            });
    })
  </script>
@endsection
