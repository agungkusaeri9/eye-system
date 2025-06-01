@extends('layouts.master')
@section('content')
    <h4 class="fw-bold py-3 mb-34">
        <span class="text-muted fw-light">Data Karyawan /</span> Feature / {{ $title }}
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
                        <input type="text" name="employee_id" value="{{ $employee->id }}" hidden>
                        <div class='form-group mb-3'>
                            <label for='nrp' class='mb-2'>NRP</label>
                            <input type='text' name='nrp' id='nrp'
                                class='form-control @error('nrp') is-invalid @enderror'
                                value='{{ $employee->nrp ?? old('nrp') }}' disabled readonly>
                            @error('nrp')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class='form-group mb-3'>
                            <label for='nrp' class='mb-2'>Nama Karyawan</label>
                            <input type='text' name='nrp' id='nrp'
                                class='form-control @error('nrp') is-invalid @enderror'
                                value='{{ $employee->name ?? old('nrp') }}' disabled readonly>
                            @error('nrp')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class='form-group mb-3'>
                            <label for='name' class='mb-2'>Nama Anggota</label>
                            <input type='text' name='name' id='name'
                                class='form-control @error('name') is-invalid @enderror'
                                value='{{ $family->name ?? old('name') }}'>
                            @error('name')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class='form-group mb-3'>
                            <label for='relation' class="mb-2">Status</label>
                            <select name='relation' id='relation'
                                class='form-control @error('relation') is-invalid @enderror'>
                                <option value='' selected disabled>Pilih relation</option>
                                <option @selected($family->relation === 'Ybs')>Ybs</option>
                                <option @selected($family->relation === 'Istri/Suami')>Istri/Suami</option>
                                <option @selected($family->relation === 'Anak 1')>Anak 1</option>
                                <option @selected($family->relation === 'Anak 2')>Anak 2</option>
                                <option @selected($family->relation === 'Anak 3')>Anak 3</option>
                                <option @selected($family->relation === 'Anak 4')>Anak 4</option>
                                <option @selected($family->relation === 'Anak 5')>Anak 5</option>
                            </select>
                            @error('relation')
                                <div class='invalid-feedback'>
                                    {{ $message }}
                                </div>
                            @enderror
                        </div>
                        <div class="form-group d-flex gap-2">
                            <a href="{{ route('family.index', [
                                'employee_id' => request('employee_id'),
                            ]) }}"
                                class="btn btn-warning mt-2"> <i class="fa fa-arrow-left me-2"></i> Batal</a>
                            <button class="btn btn-primary mt-2" type="submit">
                                <i class="fa fa-save me-2"></i>
                                <span class="align-middle">Simpan Data</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
@endsection
