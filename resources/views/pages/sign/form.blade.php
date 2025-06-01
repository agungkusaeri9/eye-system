@extends('layouts.master')
@section('content')
<style>
    .input-group .position-relative{
        width: 100%;
    }
</style>

<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data E-Sign /</span> Feature / {{ $title }}
</h4>
<div class="row">
    <form method="POST" enctype="multipart/form-data" action="{{ $action }}">
        @method($method)
        @csrf
    <!-- Input Mask -->
    <div class="col-12">
      <div class="card mb-34">
        <h5 class="card-header">{{ $title }}</h5>
        <div class="card-body">
          <div class="row">

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Nama E-Sign</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="e_sign_name" class="form-control" name="e_sign_name" placeholder="Nama E-Sign" value="{{ old('e_sign_name') }}" />
                </div>
                @error('e_sign_name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">File Berita Acara</label>
                <div class="input-group input-group-merge">
                  <input type="file" id="news_file" class="form-control" name="news_file" placeholder="File Berita Acara" accept=".xlx, .xlxs, .pdf, .doc, .docx, .png, .jpg, .jpeg" />
                </div>
                @error('news_file')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">File Untuk Diverifikasi</label>
                <div class="input-group input-group-merge">
                  <input type="file" id="verification_file" class="form-control" name="verification_file" placeholder="File Verifikasi" accept=".pdf" />
                </div>
                @error('verification_file')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-12">
                <label class="form-label" for="creditCardMask">Dokumen Pendukung <a onclick="addFile()" style="cursor: pointer" class="ms-2 text-primary"><i class="fas fa-plus-square"></i></a></label>
                <div class="row" id="form-container">
                    <div class="col-12 mb-3 form-pendukung">
                        <div class="row">
                            <div class="col-md-11 col-9">
                                <div class="input-group input-group-merge">
                                    <input type="file" class="form-control" name="supporting_file[]" placeholder="Dokumen Pendukung" accept=".xlx, .xlxs, .pdf, .doc, .docx, .png, .jpg, .jpeg" />
                                </div>
                            </div>
                            <div class="col-md-1 col-3">
                                <button type="button" class="btn btn-danger d-none delete-input"><i class="fas fa-trash"></i></button>
                            </div>
                        </div>
                        @error('supporting_file[]')
                            <small class="text-danger">{{ $message }}</small>
                        @enderror
                    </div>
                </div>
            </div>

            <div class="col-12 mb-3">
                <label class="form-label" for="creditCardMask">Ditujukan Ke</label>
                <div class="input-group input-group-merge">
                    <select class="form-control to_id" name="to" id="to"></select>
                </div>
                <input type="hidden" class="" id="validator_data_input" name="validator_data" value="{{ old('validator_data') }}">
                @error('validator_data')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>
          </div>
          <div class="table-responsive mb-2" >
            <table class="table table-bordered table-hovered table-striped" id="datatable-validator">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>Nama Validator</th>
                        <th>Jabatan</th>
                        <th>Departemen</th>
                        <th>Distrik</th>
                        <th>Catatan Untuk Validator</th>
                        <th>Aksi</th>
                    </tr>
                </thead>
                <tbody id="validator-tbody"></tbody>
            </table>
          </div>
          <div class="row">
            <div class="float-right">
                <button class="btn btn-primary mt-2" type="submit">
                    <i class="fa fa-save me-2"></i>
                    <span class="align-middle">Simpan Data</span>
                </button>
            </div>
        </div>
      </form>
      </div>
    </div>
</div>
<div class="modal fade" id="modalValidator" tabindex="-1" aria-labelledby="modalValidatorLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="modalValidatorLabel">Tambah Validator</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form class="row d-none" id="validator-data">
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Nama Validator</label>
                    <input type="hidden" id="validator_id" class="form-control" name="id_validator" placeholder="ID Validator" disabled />
                    <div class="input-group input-group-merge">
                      <input type="text" id="validator_name" class="form-control" name="validator_name" placeholder="Nama Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Jabatan</label>
                     <div class="input-group input-group-merge">
                      <input type="text" id="position" class="form-control" name="position" placeholder="Jabatan Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Departemen</label>
                    <div class="input-group input-group-merge">
                      <input type="text" id="department" class="form-control" name="department" placeholder="Departemen Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Distrik</label>
                    <div class="input-group input-group-merge">
                      <input type="text" id="district" class="form-control" name="district" placeholder="Distrik Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Informasi (Catatan) untuk Validator</label>
                    <div class="input-group input-group-merge">
                      <input required type="text" id="catatan" class="form-control" name="catatan" placeholder="Catatan untuk validator" value="" />
                    </div>
                    <small class="text-danger" id="catatan-error"></small>
                </div>
                <div class="col-12 mb-3">
                    <button onclick="submitValidator()" type="button" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
      </div>
    </div>
</div>

<div class="modal fade" id="modalValidatorEdit" tabindex="-1" aria-labelledby="modalValidatorEditLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h1 class="modal-title fs-5" id="modalValidatorEditLabel">Edit Validator</h1>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form class="row d-none" id="validator-data-edit">
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Nama Validator</label>
                    <input type="hidden" id="validator_id-edit" class="form-control" name="id_validator" placeholder="ID Validator" disabled />
                    <div class="input-group input-group-merge">
                      <input type="text" id="validator_name-edit" class="form-control" name="validator_name" placeholder="Nama Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Jabatan</label>
                     <div class="input-group input-group-merge">
                      <input type="text" id="position-edit" class="form-control" name="position" placeholder="Jabatan Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Departemen</label>
                    <div class="input-group input-group-merge">
                      <input type="text" id="department-edit" class="form-control" name="department" placeholder="Departemen Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Distrik</label>
                    <div class="input-group input-group-merge">
                      <input type="text" id="district-edit" class="form-control" name="district" placeholder="Distrik Validator" disabled />
                    </div>
                </div>
                <div class="col-12 mb-3">
                    <label class="form-label" for="creditCardMask">Informasi (Catatan) untuk Validator</label>
                    <div class="input-group input-group-merge">
                      <input required type="text" id="catatan-edit" class="form-control" name="catatan" placeholder="Catatan untuk validator" value="" />
                    </div>
                    <small class="text-danger" id="catatan-error-edit"></small>
                </div>
                <div class="col-12 mb-3">
                    <button onclick="submitEditValidator()" type="button" class="btn btn-primary">Simpan</button>
                </div>
            </form>
        </div>
      </div>
    </div>
</div>

@endsection
@section('page-script')
    <script>
        let validatorList = [];

        function getValidator(){
            let getDataValidator = $('input[name=validator_data]').val()
            if(getDataValidator) {
                validatorList = JSON.parse(getDataValidator)
                renderValidatorTable()
            }
        }

        getValidator()

        function addFile(){
            var formPendukung = $('.form-pendukung').first().clone();
            formPendukung.find('input').val('');
            $('#form-container').append(formPendukung);

            if($('.form-pendukung').length > 1) {
                $('.form-pendukung').find('.delete-input').click(deleteForm);
                $('.form-pendukung').find('input').prop('required', true)
                $('.delete-input').removeClass('d-none')
            }
        }

        function deleteForm(e) {
            e.preventDefault();
            $(this).closest('.form-pendukung').remove();

            if ($('.form-pendukung').length == 1) {
                $('.form-pendukung').find('input').removeAttr('required')
                $('.delete-input').addClass('d-none')
            }
        }

        $('.to_id').select2({
            placeholder: "Pilih validator tujuan",
            ajax: {
                url: "{{ route('sign.user-find') }}",
                dataType: 'json',
                data: function(params) {
                    return {
                        search: params.term
                    };
                },
                processResults: function(data){
                    return {
                        results: $.map(data, function(item){
                            return {
                                id: item.id,
                                text: `${item.name} - ${item.jabatan.name} - ${item.departemen.name} - ${item.distrik.name}`
                            }
                        })
                    }
                },
                cache: true
            }
        })

        $('#to').on('change', function(){
            $('input[name=id_validator]').val('')
            $("input[name=validator_name]").val('')
            $("input[name=position]").val('')
            $("input[name=department]").val('')
            $("input[name=district]").val('')
            $("input[name=catatan]").val('')


            let id = $(this).val();
            let existingIndex = validatorList.findIndex(v => v.id == id);
            if(existingIndex < 0){
                $('#modalValidator').modal('show')
                $.ajax({
                    method: 'GET',
                    url: "/news/user-find/"+id,
                    success: function(response){
                        $('input[name=id_validator]').val(response.id)
                        $("input[name=validator_name]").val(response.name)
                        $("input[name=position]").val(response.jabatan.name)
                        $("input[name=department]").val(response.departemen.name)
                        $("input[name=district]").val(response.distrik.name)
                        $('#validator-data').removeClass('d-none')
                    },
                    error: function(error) {
                        console.error(error)
                    }
                })
            } else {
                Swal.fire({
                    text: 'Validator sudah ada',
                    icon: 'error'
                })
            }
        })



        function submitValidator(){
            $('#catatan-error').html('')
            let catatan = $('input[name=catatan]').val();
            if(!catatan) {
                $('#catatan-error').html('Catatan harus diisi')
                return
            }
            let validator = {
                id: $('input[name=id_validator]').val(),
                name: $('input[name=validator_name]').val(),
                position: $('input[name=position]').val(),
                department: $('input[name=department]').val(),
                district: $('input[name=district]').val(),
                catatan: catatan
            };

            validatorList.push(validator);

            let row = `
                <tr>
                    <td>${validatorList.length}</td>
                    <td>${validator.name}</td>
                    <td>${validator.position}</td>
                    <td>${validator.department}</td>
                    <td>${validator.district}</td>
                    <td>${validator.catatan}</td>
                    <td>
                        <button type="button" class="btn btn-warning mx-1 my-1" onclick="editValidator(${validator.id})"><i class="fas fa-edit"></i></button>
                        <button type="button" class="btn btn-danger mx-1 my-1" onclick="removeValidator(${validatorList.length - 1})"><i class="fas fa-trash"></i></button>
                    </td>
                </tr>
            `;
            $('#validator-tbody').append(row);
            $('#modalValidator').modal('hide');

            $('input#validator_data_input').val(JSON.stringify(validatorList))
        }

        function removeValidator(index) {
            validatorList.splice(index, 1);
            renderValidatorTable();
            if(validatorList.length > 0) $('input#validator_data_input').val(JSON.stringify(validatorList))
            else $('input#validator_data_input').val('')
        }

        function editValidator(id) {
            let existingIndex = validatorList.findIndex(v => v.id == id);
            let response = validatorList[existingIndex]

            $('#modalValidatorEdit').find('input[name=id_validator]').val('')
            $('#modalValidatorEdit').find("input[name=validator_name]").val('')
            $('#modalValidatorEdit').find("input[name=position]").val('')
            $('#modalValidatorEdit').find("input[name=department]").val('')
            $('#modalValidatorEdit').find("input[name=district]").val('')
            $('#modalValidatorEdit').find("input[name=catatan]").val('')

            $('#modalValidatorEdit').modal('show')

            $('#modalValidatorEdit').find('input[name=id_validator]').val(response.id)
            $('#modalValidatorEdit').find("input[name=validator_name]").val(response.name)
            $('#modalValidatorEdit').find("input[name=position]").val(response.position)
            $('#modalValidatorEdit').find("input[name=department]").val(response.department)
            $('#modalValidatorEdit').find("input[name=district]").val(response.district)
            $('#modalValidatorEdit').find("input[name=catatan]").val(response.catatan)
            $('#validator-data-edit').removeClass('d-none')
        }

        function submitEditValidator(){
            $('#catatan-error-edit').html('')
            let catatan = $('#modalValidatorEdit').find('input[name=catatan]').val();
            if(!catatan) {
                $('#catatan-error-edit').html('Catatan harus diisi')
                return
            }
            let validator = {
                id: $('#modalValidatorEdit').find('input[name=id_validator]').val(),
                name: $('#modalValidatorEdit').find('input[name=validator_name]').val(),
                position: $('#modalValidatorEdit').find('input[name=position]').val(),
                department: $('#modalValidatorEdit').find('input[name=department]').val(),
                district: $('#modalValidatorEdit').find('input[name=district]').val(),
                catatan: catatan
            };

            let existingIndex = validatorList.findIndex(v => v.id == validator.id);
            validatorList[existingIndex] = validator;
            renderValidatorTable();
            $('input#validator_data_input').val(JSON.stringify(validatorList))
            $('#modalValidatorEdit').modal('hide');

        }

        function renderValidatorTable() {
            $('#validator-tbody').empty();
            validatorList.forEach((validator, index) => {
                let row = `
                    <tr>
                        <td>${index + 1}</td>
                        <td>${validator.name}</td>
                        <td>${validator.position}</td>
                        <td>${validator.department}</td>
                        <td>${validator.district}</td>
                        <td>${validator.catatan}</td>
                        <td>
                            <button type="button" class="btn btn-warning mx-1 my-1" onclick="editValidator(${validator.id})"><i class="fas fa-edit"></i></button>
                            <button type="button" class="btn btn-danger mx-1 my-1" onclick="removeValidator(${index})"><i class="fas fa-trash"></i></button>
                        </td>
                    </tr>
                `;
                $('#validator-tbody').append(row);
            });
        }
    </script>

@endsection
