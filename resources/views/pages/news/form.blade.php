@extends('layouts.master')
@section('content')
<style>
    .input-group .position-relative{
        width: 100%;
    }
</style>

<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data Berita Acara  /</span> Feature / {{ $title }}
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

            <div class="col-xl-6 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Nama Berita Acara</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="news_name" class="form-control" name="news_name" placeholder="Nama Berita Acara" value="{{ $sign->name ?? old('news_name') }}" />
                </div>
                @error('news_name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-6 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">File Berita Acara</label>
                <div class="input-group input-group-merge">
                  <input type="file" id="news_file" class="form-control" name="news_file" placeholder="File Berita Acara" accept=".xlx, .xlxs, .pdf, .doc, .docx, .png, .jpg, .jpeg" />
                </div>
                @error('news_file')
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
                    <select class="form-control to_id" multiple name="to[]" id="to"></select>
                </div>
                @error('to')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>
          </div>
          <div class="row d-none" id="validator-data">
            <div class="col-xl-3 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Nama Validator</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="validator_name" class="form-control" name="validator_name" placeholder="Nama Validator" value="{{ isset($user) ? $user->name : '' }}" disabled />
                </div>
            </div>
            <div class="col-xl-3 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Jabatan</label>
                 <div class="input-group input-group-merge">
                  <input type="text" id="position" class="form-control" name="position" placeholder="Jabatan Validator" value="{{ isset($user) ? $user->name : '' }}" disabled />
                </div>
            </div>
            <div class="col-xl-3 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Departemen</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="department" class="form-control" name="department" placeholder="Departemen Validator" value="{{ $sign->name }}" disabled />
                </div>
            </div>
            <div class="col-xl-3 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Distrik</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="district" class="form-control" name="district" placeholder="Distrik Validator" value="{{ $sign->name }}" disabled />
                </div>
            </div>
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
@endsection
@section('page-script')
    <script>
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
                url: "{{ route('news.user-find') }}",
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

        // $('#to').on('change', function(){
        //     $("input[name=validator_name]").val('')
        //     $("input[name=position]").val('')
        //     $("input[name=department]").val('')
        //     $("input[name=district]").val('')
        //     $('#validator-data').addClass('d-none')

        //     let id = $(this).val();
        //     $.ajax({
        //         method: 'GET',
        //         url: "/news/user-find/"+id,
        //         success: function(response){
        //             $("input[name=validator_name]").val(response.name)
        //             $("input[name=position]").val(response.jabatan.name)
        //             $("input[name=department]").val(response.departemen.name)
        //             $("input[name=district]").val(response.distrik.name)
        //             $('#validator-data').removeClass('d-none')
        //         },
        //         error: function(error) {
        //             console.error(error)
        //         }
        //     })
        // })
    </script>

@endsection
