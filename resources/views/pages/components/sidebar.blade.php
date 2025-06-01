<!-- Menu -->

<aside id="layout-menu" class="layout-menu menu-vertical bg-black ">
    <div class="app-brand demo">
        <a href="{{ route('dashboard') }}" class="app-brand-link">
            <span class="app-brand-logo">
                <img src="{{ asset('assets/logo/logoasto.png') }}" alt="" srcset="" width="50px"
                    height="50px">
            </span>
            <span class="app-brand-text demo menu-text fw-bold">Eye System</span>
        </a>

        <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-white text-large ms-auto">
            <i class="ti menu-toggle-icon d-none d-xl-block ti-sm align-middle"></i>
            <i class="ti ti-x d-block d-xl-none ti-sm align-middle"></i>
        </a>
    </div>

    <div class="menu-inner-shadow"></div>

    <ul class="menu-inner py-1">
        @if (auth()->user()->role == 1 || auth()->user()->role == 2)
            <li class="menu-item {{ request()->is('dashboard') ? 'active' : '' }}">
                <a href="{{ route('dashboard') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-dashboard"></i>
                    <div>Dashboard</div>
                </a>
            </li>
        @endif

        @if (\Auth::user()->role == 1)
            <li
                class="menu-item {{ request()->is('karyawan') || request()->is('karyawan/*') || request()->is('departemen') || request()->is('departemen/*') ? 'active' : '' }}">
                <a href="javascript:void(0);" class="menu-link text-white menu-toggle">
                    <i class="menu-icon tf-icons ti ti-database"></i>
                    <div>Data Master</div>
                </a>
                <ul class="menu-sub">
                    <li
                        class="menu-item {{ request()->is('karyawan') || request()->is('karyawan/*') ? 'active' : '' }}">
                        <a href="{{ route('karyawan.index') }}" class="menu-link text-white">
                            <div>Karyawan</div>
                        </a>
                    </li>
                    <li
                        class="menu-item {{ request()->is('validator') || request()->is('validator/*') ? 'active' : '' }}">
                        <a href="{{ route('validator.index') }}" class="menu-link text-white">
                            <div>Validator</div>
                        </a>
                    </li>
                    <li
                        class="menu-item {{ request()->is('customer') || request()->is('customer/*') ? 'active' : '' }}">
                        <a href="{{ route('customer.index') }}" class="menu-link text-white">
                            <div>Customer</div>
                        </a>
                    </li>
                    <li
                        class="menu-item {{ request()->is('perusahaan') || request()->is('perusahaan/*') ? 'active' : '' }}">
                        <a href="{{ route('perusahaan.index') }}" class="menu-link text-white">
                            <div>Perusahaan</div>
                        </a>
                    </li>
                    <li
                        class="menu-item {{ request()->is('departemen') || request()->is('departemen/*') ? 'active' : '' }}">
                        <a href="{{ route('departemen.index') }}" class="menu-link text-white">
                            <div>Departemen</div>
                        </a>
                    </li>
                    <li class="menu-item {{ request()->is('unit') || request()->is('unit/*') ? 'active' : '' }}">
                        <a href="{{ route('unit.index') }}" class="menu-link text-white">
                            <div>Unit</div>
                        </a>
                    </li>
                    <li class="menu-item {{ request()->is('distrik') || request()->is('distrik/*') ? 'active' : '' }}">
                        <a href="{{ route('distrik.index') }}" class="menu-link text-white">
                            <div>Distrik</div>
                        </a>
                    </li>
                    <li class="menu-item {{ request()->is('jabatan') || request()->is('jabatan/*') ? 'active' : '' }}">
                        <a href="{{ route('jabatan.index') }}" class="menu-link text-white">
                            <div>Jabatan</div>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="menu-item {{ request()->is('workorder-1') ? 'active' : '' }}">
                <a href="{{ route('workorder1') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-clipboard"></i>
                    <div>Work Order 1</div>
                </a>
            </li>
            <li class="menu-item {{ request()->is('workorder-2') ? 'active' : '' }}">
                <a href="{{ route('workorder2') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-archive"></i>
                    <div>Work Order 2</div>
                </a>
            </li>
            <li class="menu-item {{ request()->is('laporan') ? 'active' : '' }}">
                <a href="{{ route('laporan') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-report-analytics"></i>
                    <div>Laporan</div>
                </a>
            </li>
            <li class="menu-item {{ request()->is('report') ? 'active' : '' }}">
                <a href="{{ route('report') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-report"></i>
                    <div>Report</div>
                </a>
            </li>
        @endif

        @if (auth()->user()->role == 1 || auth()->user()->role == 2)
            <li class="menu-item {{ request()->is('news') ? 'active' : '' }}">
                <a href="{{ route('news.index') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-news"></i>
                    <div>Berita Acara</div>
                </a>
            </li>
            <li class="menu-item {{ request()->is('sign') ? 'active' : '' }}">
                <a href="{{ route('sign.index') }}" class="menu-link text-white">
                    <i class="menu-icon tf-icons ti ti-signature"></i>
                    <div>E-Sign</div>
                </a>
            </li>
        @endif

        @if (auth()->user()->role != 2)
            <li class="menu-item">
                <a href="javascript:void(0);" class="menu-link text-white menu-toggle">
                    <i class="menu-icon ti ti-heart"></i>
                    <div>Klaim Pengobatan</div>
                </a>
                <ul class="menu-sub">
                    @if (auth()->user()->role == 4 || auth()->user()->role == 5 || auth()->user()->role == 1)
                        <li class="menu-item {{ request()->is('ehay/status') ? 'active' : '' }}">
                            <a href="{{ route('ehay.index') }}" class="menu-link text-white">
                                <div>Pengajuan</div>
                            </a>
                        </li>
                        @if (auth()->user()->role == 4 || auth()->user()->role == 1)
                            {{-- admin --}}
                            <li class="menu-item {{ request()->is('ehay/status') ? 'active' : '' }}">
                                <a href="{{ route('ehay.status') }}" class="menu-link text-white">
                                    <div>Status</div>
                                </a>
                            </li>
                            <li class="menu-item {{ request()->is('ehay/status') ? 'active' : '' }}">
                                <a href="{{ route('ehay.list') }}" class="menu-link text-white">
                                    <div>List</div>
                                </a>
                            </li>
                            <li class="menu-item {{ request()->is('ehay/status') ? 'active' : '' }}">
                                <a href="{{ route('ehay.history') }}" class="menu-link text-white">
                                    <div>History</div>
                                </a>
                            </li>
                        @endif
                    @elseif(auth()->user()->role == 3)
                        <li class="menu-item {{ request()->is('ehay/create') ? 'active' : '' }}">
                            <a href="{{ route('ehay.create') }}" class="menu-link text-white">
                                <div>Ajukan</div>
                            </a>
                        </li>
                        <li class="menu-item {{ request()->is('ehay/create') ? 'active' : '' }}">
                            <a href="{{ route('ehay.customer-list') }}" class="menu-link text-white">
                                <div>List Pengajuan</div>
                            </a>
                        </li>
                    @endif

                </ul>
            </li>
        @endif

    </ul>
</aside>
