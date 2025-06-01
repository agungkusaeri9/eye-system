@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="card">
        <div class="card-header pb-0">
            <a class="btn btn-primary " href="{{ route('karyawan.create') }}"><i class="ti ti-plus me-1"></i> <span>Tambah
                    Karyawan</span></a>
            {{-- <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalImport" href="javascript:void(0)"><i
                    class="ti ti-upload me-1"></i> <span>Karyawan</span></a>
            <a class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#modalImportFamily"
                href="javascript:void(0)"><i class="ti ti-upload me-1"></i> <span>Family</span></a> --}}
        </div>
        <div class="card-datatable table-responsive pt-0">
            <table class="table" id="dataTable">
                <thead>
                    <tr>
                        <th>No Karyawan</th>
                        <th>Nama Karyawan</th>
                        <th>Email</th>
                        <th>No Whatsapp</th>
                        <th>Alamat</th>
                        <th>Departemen</th>
                        <th>Perusahaan</th>
                        <th>Action</th>
                    </tr>
                </thead>
            </table>
        </div>
    </div>

    {{-- <!-- Modal -->
    <div class="modal fade" id="modalImport" tabindex="-1" aria-labelledby="modalImportLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalImportLabel">Import Excel Karyawan</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('karyawan.import-excel') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class='alert alert-danger small'>
                            <strong>Perhatian!</strong> <br> File Excel yang diunggah <u>harus mengikuti format template</u>
                            yang
                            telah disediakan.
                            <a href="{{ asset('assets/template-excel/template_excel_karyawan.xlsx') }}" target="_blank"
                                rel="noopener">Download Template</a>
                        </div>
                        <div class='form-group mb-3'>
                            <label for='file' class='mb-2'>Pilih File Excel</label>
                            <input type='file' name='file' id='file'
                                class='form-control @error('file') is-invalid @enderror' value='{{ old('file') }}'>
                            @error('file')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="modalImportFamily" tabindex="-1" aria-labelledby="modalImportFamily" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="modalImportFamily">Import Keluarga</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <form action="{{ route('family.import-excel') }}" method="post" enctype="multipart/form-data">
                    @csrf
                    <div class="modal-body">
                        <div class='alert alert-danger small'>
                            <strong>Perhatian!</strong> <br> File Excel yang diunggah <u>harus mengikuti format template</u>
                            yang
                            telah disediakan.
                            <a href="{{ asset('assets/template-excel/template_excel_keluarga.xlsx') }}" target="_blank"
                                rel="noopener">Download Template</a>
                        </div>
                        <div class='form-group mb-3'>
                            <label for='file' class='mb-2'>Pilih File Excel</label>
                            <input type='file' name='file' id='file'
                                class='form-control @error('file') is-invalid @enderror' value='{{ old('file') }}'>
                            @error('file')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </form>
            </div>
        </div>
    </div> --}}
@endsection

@section('page-script')
    <script src="{{ asset('assets/js/tables-datatables-basic.js') }}"></script>
    <script>
        $(document).ready(function() {
            var table = $('#dataTable').DataTable({
                ajax: {
                    url: "{{ route('karyawan.index') }}",
                    type: "GET",
                    data: function(d) {
                        // d._user = $('#user').val(),
                        // d._start_date = $('#start_date').val(),
                        // d._end_date = $('#end_date').val()

                    }
                },
                processing: true,
                serverSide: true,
                columnDefs: [{
                        "defaultContent": "-",
                        "targets": "_all"
                    },

                ],
                order: [
                    [0, 'ASC']
                ],
                columns: [{
                        data: 'nrp',
                        name: 'nrp'
                    },

                    {
                        data: 'name',
                        name: 'name'
                    },
                    {
                        data: 'email',
                        name: 'email'
                    },
                    {
                        data: 'no_handphone',
                        name: 'no_handphone'
                    },
                    {
                        data: 'address',
                        name: 'address'
                    },
                    {
                        data: 'department.name',
                        name: 'department.name'
                    },
                    {
                        data: 'company.name',
                        name: 'company.name'
                    },
                    {
                        data: 'action',
                        name: 'action'
                    },
                ],
            });


        })
    </script>
@endsection
