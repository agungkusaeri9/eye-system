@extends('layouts.master')
@section('content')
<h4 class="fw-bold py-3 mb-34">
    <span class="text-muted fw-light">Data Customer  /</span> Feature / {{ $title }}
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
                  <input type="text" id="name" class="form-control" name="nrp" placeholder="NRP"  value='{{ $customer->nrp ?? old('nrp') }}'/>
                </div>
                  @error('nrp')
                      <small class="text-danger">{{ $message }}</small>
                  @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
              <label class="form-label" for="creditCardMask">Nama Customer</label>
              <div class="input-group input-group-merge">
                <input type="text" id="name" class="form-control" name="name" placeholder="Nama Customer"  value='{{ $customer->name ?? old('name') }}'/>
              </div>
                @error('name')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">Email</label>
                <div class="input-group input-group-merge">
                    <input type="email" id="email" class="form-control" name="email" placeholder="Email" value='{{ $customer->email ?? old('email') }}'/>
                </div>
                @error('email')
                    <small class="text-danger">{{ $message }}</small>
                @enderror
            </div>

            <div class="col-xl-4 col-md- col-sm-12 mb-3">
                <label class="form-label" for="creditCardMask">No Hp</label>
                <div class="input-group input-group-merge">
                    <input type="number" id="no_hp" class="form-control" name="no_hp" placeholder="No Whatsapp" value='{{ $customer->no_hp ?? old('no_hp') }}'/>
                </div>
                @error('no_hp')
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
                <label class="form-label" for="creditCardMask">Status</label>
                <div class="form-control">
                    <div class="d-flex align-items-center">
                        <div class="d-flex align-items-center justify-content-center">
                            <input value="Aktif" type="radio" name="status" id="aktif" @if (!$customer->status || $customer->status == 'Aktif') checked @endif>
                            <label for="aktif" class="ms-2 me-3">Aktif</label>
                        </div>
                        <div class="d-flex align-items-center justify-content-center">
                            <input value="Tidak Aktif" type="radio" name="status" id="tidak-aktif" @if ($customer && $customer->status == 'Tidak Aktif') checked @endif>
                            <label for="tidak-aktif" class="ms-2 me-3">Tidak Aktif</label>
                        </div>
                    </div>
                </div>
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
