@extends('layouts.master')

@section('content')
<h4 class="fw-bold py-3 mb-4">
    <span class="text-muted fw-light">{{ $title }}  </span>
</h4>
<div class="row">
    <!-- Revenue Growth -->
    <div class="col-xl-3 col-md-8 mb-4">
        <a href="{{ route('news.index') }}">
            <div class="card">
              <div class="card-body">
                <div class="d-flex justify-content-center">
                  <div class="d-flex flex-column">
                    <div class="card-title mb-auto">
                      <h5 class="mb-1 text-nowrap text-center">
                        @if(auth()->user()->role == 1)
                            {{ App\Models\Sign::where('type', 'news')->count() }}
                        @elseif(auth()->user()->role == 2)
                            {{ App\Models\Sign::where('to_id', auth()->user()->id)->where('type', 'news')->count() }}
                        @elseif(auth()->user()->role == 3)
                            {{ App\Models\Sign::where('from_id', auth()->user()->id)->where('type', 'news')->count() }}
                        @endif
                      </h5>
                    </div>
                    <div class="chart-statistics">
                      <small class="card-title mb-1 text-black">Total Berita Acara</small>
                    </div>
                  </div>
                  <div id="revenueGrowth"></div>
                </div>
              </div>
            </div>
        </a>
    </div>
    <div class="col-xl-3 col-md-8 mb-4">
        <a href="{{ route('sign.index') }}">
            <div class="card">
              <div class="card-body">
                <div class="d-flex justify-content-center">
                  <div class="d-flex flex-column">
                    <div class="card-title mb-auto">
                      <h5 class="mb-1 text-nowrap text-center">
                        @if(auth()->user()->role == 1)
                            {{ App\Models\Sign::where('type', 'e-sign')->count() }}
                        @elseif(auth()->user()->role == 2)
                            {{ App\Models\Sign::where('to_id', auth()->user()->id)->where('type', 'e-sign')->count() }}
                        @elseif(auth()->user()->role == 3)
                            {{ App\Models\Sign::where('from_id', auth()->user()->id)->where('type', 'e-sign')->count() }}
                        @endif
                      </h5>
                    </div>
                    <div class="chart-statistics">
                      <small class="card-title mb-1 text-black">Total E-Sign</small>
                    </div>
                  </div>
                  <div id="revenueGrowth"></div>
                </div>
              </div>
            </div>
        </a>
    </div>
    <div class="col-xl-3 col-md-8 mb-4">
        <a href="{{ route('sign.index') }}">
            <div class="card">
              <div class="card-body">
                <div class="d-flex justify-content-center">
                  <div class="d-flex flex-column">
                    <div class="card-title mb-auto">
                      <h5 class="mb-1 text-nowrap text-center">
                        @if(auth()->user()->role == 1)
                            {{ App\Models\Sign::where('type', 'e-sign')->where('status', 'Closed')->count() }}
                        @elseif(auth()->user()->role == 2)
                            {{ App\Models\Sign::where('to_id', auth()->user()->id)->where('type', 'e-sign')->where('status', 'Closed')->count() }}
                        @elseif(auth()->user()->role == 3)
                            {{ App\Models\Sign::where('from_id', auth()->user()->id)->where('type', 'e-sign')->where('status', 'Closed')->count() }}
                        @endif
                      </h5>
                    </div>
                    <div class="chart-statistics">
                      <small class="card-title mb-1 text-black">Total E-Sign Diterima</small>
                    </div>
                  </div>
                  <div id="revenueGrowth"></div>
                </div>
              </div>
            </div>
        </a>
    </div>
    <div class="col-xl-3 col-md-8 mb-4">
        <a href="{{ route('sign.index') }}">
            <div class="card">
              <div class="card-body">
                <div class="d-flex justify-content-center">
                  <div class="d-flex flex-column">
                    <div class="card-title mb-auto">
                      <h5 class="mb-1 text-nowrap text-center">
                        @if(auth()->user()->role == 1)
                            {{ App\Models\Sign::where('type', 'e-sign')->where(function($query) { $query->where('sign', 'Ditolak')->orWhere('signature', 'Ditolak'); })->count() }}
                        @elseif(auth()->user()->role == 2)
                            {{ App\Models\Sign::where('to_id', auth()->user()->id)->where('type', 'e-sign')->where(function($query) { $query->where('sign', 'Ditolak')->orWhere('signature', 'Ditolak'); })->count() }}
                        @elseif(auth()->user()->role == 3)
                            {{ App\Models\Sign::where('from_id', auth()->user()->id)->where('type', 'e-sign')->where(function($query) { $query->where('sign', 'Ditolak')->orWhere('signature', 'Ditolak'); })->count() }}
                        @endif
                      </h5>
                    </div>
                    <div class="chart-statistics">
                      <small class="card-title mb-1 text-black">Total E-Sign Ditolak</small>
                    </div>
                  </div>
                  <div id="revenueGrowth"></div>
                </div>
              </div>
            </div>
        </a>
    </div>

    @if(auth()->user()->role == 1)
        <div class="col-xl-3 col-md-8 mb-4">
            <a href="{{ route('workorder1') }}">
                <div class="card">
                    <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <div class="d-flex flex-column">
                        <div class="card-title mb-auto">
                            <h5 class="mb-1 text-nowrap text-center">{{ App\Models\WorkOrder::count() }}</h5>
                        </div>
                        <div class="chart-statistics">
                            <small class="card-title mb-1 text-black">Total Permohonan Work Order</small>
                        </div>
                        </div>
                        <div id="revenueGrowth"></div>
                    </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-8 mb-4">
            <a href="{{ route('workorder1') }}">
                <div class="card">
                    <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <div class="d-flex flex-column">
                        <div class="card-title mb-auto">
                            <h5 class="mb-1 text-nowrap text-center">{{ App\Models\WorkOrder::where('status',2)->count() }}</h5>
                        </div>
                        <div class="chart-statistics">
                            <small class="card-title mb-1 text-black">Total Work Order Diterima</small>
                        </div>
                        </div>
                        <div id="revenueGrowth"></div>
                    </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-8 mb-4">
            <a href="{{ route('workorder1') }}">
                <div class="card">
                    <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <div class="d-flex flex-column">
                        <div class="card-title mb-auto">
                            <h5 class="mb-1 text-nowrap text-center">{{ App\Models\WorkOrder::where('status',3)->count() }}</h5>
                        </div>
                        <div class="chart-statistics">
                            <small class="card-title mb-1 text-black">Total Work Order Ditolak</small>
                        </div>
                        </div>
                        <div id="revenueGrowth"></div>
                    </div>
                    </div>
                </div>
            </a>
        </div>
        <div class="col-xl-3 col-md-8 mb-4">
            <a href="{{ route('karyawan.index') }}">
                <div class="card">
                    <div class="card-body">
                    <div class="d-flex justify-content-center">
                        <div class="d-flex flex-column">
                        <div class="card-title mb-auto">
                            <h5 class="mb-1 text-nowrap text-center">{{ App\Models\Employee::count() }}</h5>
                        </div>
                        <div class="chart-statistics">
                            <small class="card-title mb-1 text-black text-black">Total Karyawan</small>
                        </div>
                        </div>
                        <div id="revenueGrowth"></div>
                    </div>
                    </div>
                </div>
            </a>
        </div>
    @endif

@endsection

@section('page-script')

@endsection
