@extends('layouts.master', ['title' => $title])
@section('content')
    <h4 class="fw-bold py-3 mb-4">
        <span class="text-muted fw-light">{{ $title }} </span>
    </h4>
    <!-- DataTable with Buttons -->
    <div class="col-md-7">
        <div class="card mb-3">
            <div class="card-header">
                <h4 class="card-title">Filter</h4>
            </div>
            <div class="card-body">
                <form action="">
                    <div class="row">
                        <div class="col-md-4
                         col-sm-12">
                            <div class="form-group mb-3">
                                <label for="from_date" class="mb-2">From</label>
                                <input type="date" name="from_date" id="from_date"
                                    class="form-control @error('from_date') is-invalid @enderror"
                                    value="{{ request('from_date') ?? old('from_date') }}">
                                @error('from_date')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-4
                         col-sm-12">
                            <div class="form-group mb-3">
                                <label for="to_date" class="mb-2">To</label>
                                <input type="date" name="to_date" id="to_date"
                                    class="form-control @error('to_date') is-invalid @enderror"
                                    value="{{ request('to_date') ?? old('to_date') }}">
                                @error('to_date')
                                    <div class="invalid-feedback">{{ $message }}</div>
                                @enderror
                            </div>
                        </div>

                        <div class="col-md-4 col-sm-12 d-flex align-items-end mb-3 gap-2">
                            <a href="{{ route('ehay.list') }}" class="btn btn-outline-secondary">Reset</a>
                            <button class="btn btn-secondary">Filter</button>
                        </div>
                    </div>
                </form>

            </div>
        </div>
        <div class="card">
            <div class="card-header pb-0 d-flex gap-2">
                <h4> Start to draw fully Validated Ehay List</h4>
            </div>
            <div class="card-body">
                <button class="w-100 btn btn-info mb-4 btn-link">Draw Ready Ehay</button>

                <!-- Animasi loading -->
                <div id="loading-animation" class="text-center">
                    <div class="spinner-border text-info" role="status" style="width: 6rem; height: 6rem;">
                        <span class="sr-only">Loading...</span>
                    </div>
                </div>

                @if (request('from_date') && request('to_date'))
                    <div id="download-buttons" style="display: none; text-align: center;">
                        <h4 class="text-center mb-2">Download Ready!</h4>
                        <div id="" class="d-flex gap-5 mt-4">
                            <a href="{{ route('ehay.export-excel', [
                                'status' => 'ready',
                                'from_date' => request('from_date'),
                                'to_date' => request('to_date'),
                            ]) }}"
                                class="btn w-100 btn-success" id="start-validation-btn-excel">Excel</a>
                            <a href="{{ route('ehay.export-pdf', [
                                'from_date' => request('from_date'),
                                'to_date' => request('to_date'),
                            ]) }}"
                                class="btn w-100 btn-danger" id="start-validation-btn-pdf">PDF</a>
                        </div>
                    </div>
                @else
                    <p class="text-center">Silahkan filter tanggal terlebih dahulu.</p>
                @endif

            </div>
        </div>
    @endsection

    @section('page-style')
        <style>
            .spinner-border {
                width: 6rem;
                height: 6rem;
            }

            #download-buttons {
                margin-top: 20px;
            }

            .no-spinner {
                display: none;
            }

            .spinner-static {
                display: block;
                text-align: center;
                font-size: 1.5rem;
                color: #17a2b8;
            }
        </style>
    @endsection
    @section('page-script')
        <script>
            $(document).ready(function() {
                $('#loading-animation').show();
                $('#download-buttons').hide();
                setTimeout(function() {
                    $('#loading-animation').hide();
                    $('#loading-animation').html('<div class="spinner-static">Download Ready</div>');
                    $('#download-buttons').show();
                }, 1000);
            });
        </script>
    @endsection
