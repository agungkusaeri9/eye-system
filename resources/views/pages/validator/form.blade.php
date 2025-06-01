@extends('layouts.master')
@section('content')
<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data Validator  /</span> Feature / {{ $title }}
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
                <label class="form-label" for="creditCardMask">NRP</label>
                <div class="input-group input-group-merge">
                  <input type="text" id="nrp" class="form-control" name="nrp" placeholder="No NRP" value="{{ $validator->nrp ?? old('nrp') }}" />
                </div>
                @error('nrp')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
              <label class="form-label" for="creditCardMask">Nama Validator</label>
              <div class="input-group input-group-merge">
                <input type="text" id="name" class="form-control" name="name" placeholder="Nama Validator"  value='{{ $validator->name ?? old('name') }}'/>
              </div>
                @error('name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Email</label>
                <div class="input-group input-group-merge">
                    <input type="email" id="email" class="form-control" name="email" placeholder="Email" value='{{ $validator->email ?? old('email') }}'/>
                </div>
                @error('email')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Password</label>
                <div class="input-group input-group-merge">
                  <input type="password" id="password" class="form-control" name="password" placeholder="Password" />
                </div>
                @error('password')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Konfirmasi Password</label>
                <div class="input-group input-group-merge">
                  <input type="password" id="password_confirmation" class="form-control" name="password_confirmation" placeholder="Password Confirmation" />
                </div>
                @error('password_confirmation')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="position">Jabatan</label>
                <div class="input-group input-group-merge">
                    <select class="form-select" name="position" id="position">
                    <option disabled selected value="">Pilih Jabatan</option>
                    @foreach ($jabatan as $item)
                        <option value="{{ $item->id }}"
                            @if($validator->position)
                                @if($item->id == $validator->position) selected @endif
                            @else
                                @if($item->id == old('position')) selected @endif
                            @endif
                        >
                            {{ $item->name }}
                        </option>
                    @endforeach
                    </select>
                </div>
                @error('position')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Departemen</label>
                <div class="input-group input-group-merge">
                    <select class="form-select" name="department" id="department">
                    <option disabled selected value="">Pilih Departemen</option>
                    @foreach ($departemen as $item)
                        <option value="{{ $item->id }}"
                            @if($validator->department)
                                @if($item->id == $validator->department) selected @endif
                            @else
                                @if($item->id == old('department')) selected @endif
                            @endif
                        >
                            {{ $item->name }}
                        </option>
                    @endforeach
                    </select>
                </div>
                @error('department')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Distrik</label>
                <div class="input-group input-group-merge">
                    <select class="form-select" name="district" id="district">
                    <option disabled selected value="">Pilih Distrik</option>
                    @foreach ($distrik as $item)
                        <option value="{{ $item->id }}"
                            @if($validator->district)
                                @if($item->id == $validator->district) selected @endif
                            @else
                                @if($item->id == old('district')) selected @endif
                            @endif
                        >
                            {{ $item->name }}
                        </option>
                    @endforeach
                    </select>
                </div>
                @error('district')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Status</label>
                <div class="form-control">
                    <div class="d-flex align-items-center">
                        <div class="d-flex align-items-center justify-content-center">
                            <input value="Aktif" type="radio" name="status" id="aktif" @if (!$validator->status || $validator->status == 'Aktif') checked @endif>
                            <label for="aktif" class="ms-2 me-3">Aktif</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <input value="Tidak Aktif" type="radio" name="status" id="tidak-aktif" @if ($validator && $validator->status == 'Tidak Aktif') checked @endif>
                            <label for="tidak-aktif" class="ms-2 me-3">Tidak Aktif</label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-12 mb-3">
                <label class="form-label" for="creditCardMask">Upload Tanda Tangan (Format jpg, jpeg)</label>
                <div class="input-group input-group-merge">
                    <input type="file" name="signature" id="tanda_tangan" class="form-control" accept=".jpg, .jpeg">
                </div>
                @error('signature')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
                <div class="mt-2"><img src="{{ asset('storage/'.$validator->signature) }}" alt="" id="tanda_tangan_show" width="150px"></div>
            </div>

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
        $(document).ready(function(){
            $('#tanda_tangan').on('change', function(){
                if ($(this)[0].files && $(this)[0].files[0]) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $('#tanda_tangan_show').attr('src', e.target.result)
                    }
                    reader.readAsDataURL($(this)[0].files[0]);
                } else {
                    $('#tanda_tangan_show').attr('src', "{{ asset('storage/'.$validator->signature) }}")
                }
            })
        })
    </script>
@endsection
