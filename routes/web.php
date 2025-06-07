<?php

use App\Http\Controllers\Auth\AuthController;
use App\Http\Controllers\CompanyController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DepartmentController;
use App\Http\Controllers\DetailEhayController;
use App\Http\Controllers\DistrictController;
use App\Http\Controllers\EhayController;
use App\Http\Controllers\FamilyController;
use App\Http\Controllers\PositionController;
use App\Http\Controllers\EmployeeController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\ValidatorController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\ReportController;
use App\Http\Controllers\UnitController;
use App\Http\Controllers\WorkOrder1Controller;
use App\Http\Controllers\WorkOrder2Controller;

use App\Http\Controllers\NewsController;
use App\Http\Controllers\SignController;

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', [AuthController::class, 'index'])->name('login');
Route::post('/auth', [AuthController::class, 'auth'])->name('auth');
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');
Route::get('/test', [\App\Http\Controllers\test\TCPDFController::class, 'index']);
Route::middleware('auth')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard');
    Route::prefix('/news')->controller(NewsController::class)->name('news.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/show/{id}', 'show')->name('show');
        Route::delete('/{id}', 'destroy')->name('destroy');
        Route::middleware('customer')->group(function () {
            Route::get('/create', 'create')->name('create');
            Route::post('/create', 'store')->name('store');
            Route::get('/user-find', 'findUser')->name('user-find');
            Route::get('/user-find/{id}', 'findUser')->name('user-find-id');
        });
    });



    Route::prefix('/sign')->controller(SignController::class)->name('sign.')->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/show/{id}', 'show')->name('show');
        Route::get('/print/{id}', 'print')->name('print');
        Route::delete('/{id}', 'destroy')->name('destroy');
        Route::middleware('customer')->group(function () {
            Route::get('/create', 'create')->name('create');
            Route::post('/create', 'store')->name('store');
            Route::get('/edit/{id}', 'edit')->name('edit');
            Route::post('/edit/{id}', 'update')->name('update');
            Route::get('/dokumen-pendukung/{id}', 'getSupportDocument')->name('getSupportDocument');
            Route::get('/hapus-dokumen-pendukung/{id}', 'deleteSuportDocument')->name('deleteSuportDocument');
            Route::get('/user-find', 'findUser')->name('user-find');
            Route::get('/user-find/{id}', 'findUser')->name('user-find-id');
        });

        Route::middleware('validator')->group(function () {
            Route::post('/aksi/{id}/{type}/{action}', 'action')->name('action');
            Route::get('/lihat-dokumen/{id}', 'showDocument')->name('show-document');
            Route::post('/lihat-dokumen/{id}', 'saveDocument')->name('save-document');
        });
    });

    Route::middleware('admin')->group(function () {
        // Route Karyawan
        Route::post('karyawan/import-excel', [EmployeeController::class, 'importExcel'])->name('karyawan.import-excel');
        Route::resource('/karyawan', EmployeeController::class);

        // family
        Route::post('family/emport-excel', [FamilyController::class, 'importExcel'])->name('family.import-excel');
        Route::resource('/family', FamilyController::class);


        // Route Customer
        Route::resource('/customer', CustomerController::class);

        // Route Customer
        Route::resource('/validator', ValidatorController::class);

        // Route Departement
        Route::resource('/departemen', DepartmentController::class);

        // Route Company
        Route::resource('/perusahaan', CompanyController::class);

        // Route Company
        Route::resource('/unit', UnitController::class);
        Route::get('unit/{type}/get-by-type', [UnitController::class, 'getByType'])->name('unit.getByType');
        Route::get('/unit/{unit}/get-egi', [UnitController::class, 'getEgiByUnit'])->name('unit.get-egi');


        // Route District
        Route::resource('/distrik', DistrictController::class);

        // Route Position
        Route::resource('/jabatan', PositionController::class);

        // Route WorkOrder1
        Route::controller(WorkOrder1Controller::class)->group(function () {
            Route::get('workorder-1', 'index')->name('workorder1');
            Route::get('workorder-1/{id}/show', 'show')->name('workorder1.show');
            Route::put('workorder-1/{id}/accept', 'accept')->name('workorder1.accept');
            Route::put('workorder-1/{id}/reject', 'reject')->name('workorder1.reject');
            Route::delete('workorder-1/{id}', 'destroy')->name('workorder1.destroy');
        });

        // Route WorkOrder2
        Route::controller(WorkOrder2Controller::class)->group(function () {
            Route::get('workorder-2', 'index')->name('workorder2');
            Route::get('workorder-2/{id}/edit', 'edit')->name('workorder2.edit');
            Route::put('workorder-2/{id}/update', 'update')->name('workorder2.update');
            Route::get('workorder-2/{id}/print', 'print')->name('workorder2.print');
            Route::delete('workorder-2/{id}', 'destroy')->name('workorder2.destroy');

            Route::get('workorder-approved', 'getWoApproved')->name('wo_approved');
        });

        Route::controller(LaporanController::class)->group(function () {
            Route::get('laporan', 'index')->name('laporan');
            Route::get('laporan/{id}/detail', 'show')->name('laporan.show');
        });

        Route::controller(ReportController::class)->group(function () {
            Route::get('report', 'index')->name('report');
            Route::get('report/export', 'export')->name('report.export');
        });
    });

    // Route Ehay
    Route::get('/karyawan-json/get', [EmployeeController::class, 'getById'])->name('karyawan.getById');

    Route::controller(EhayController::class)->middleware(['auth', 'is_role:1,3,5,4'])->group(function () {

        Route::middleware(['is_role:3'])->group(function () {
            Route::get('ehay/list', [EhayController::class, 'cust_history'])->name('ehay.customer-list');
            Route::get('ehay/{id}/edit', [EhayController::class, 'edit'])->name('ehay.edit');
            Route::patch('ehay/{id}/edit', [EhayController::class, 'update'])->name('ehay.update');
        });

        // ehay customer/employee
        Route::middleware(['is_role:3'])->group(function () {
            Route::get('ehay/cust-list', 'cust_history')->name('ehay.customer-list');
            Route::get('ehay/create', 'create')->name('ehay.create');
            Route::post('ehay/create', 'store')->name('ehay.store');
        });

        Route::middleware(['is_role:1,4,5'])->group(function () {

            Route::middleware(['is_role:1,4,5'])->group(function () {
                Route::get('ehay', 'index')->name('ehay.index');
                Route::get('ehay/{id}/validation', 'validation')->name('ehay.validation');
                Route::post('ehay/{id}/validation', 'validation_process')->name('ehay.validation-process');
            });

            // ehay admin claim
            Route::middleware(['is_role:1,4,5'])->group(function () {
                Route::post('ehay/{uuid}/approve', [EhayController::class, 'approve'])->name('ehay.approve')->middleware('is_role:4,5');
                Route::get('ehay/list', 'list')->name('ehay.list');
                Route::get('ehay/status', 'status')->name('ehay.status');
                Route::get('ehay/history', 'history')->name('ehay.history');
                Route::get('ehay/export-excel', 'exportExcel')->name('ehay.export-excel');
                Route::get('ehay/export-pdf', 'exportPdf')->name('ehay.export-pdf');
                Route::post('ehay/validation/admin', 'validation_all_admin')->name('ehay.validation-process-admin-all');
            });
        });

        Route::get('ehay/get-by-id', 'getByIdJson')->name('ehay.getByIdJson');
        Route::get('ehay/{id}', 'show')->name('ehay.show');

    });


    Route::controller(DetailEhayController::class)->group(function () {
        Route::get('ehay-detail/{id}/edit', 'edit')->name('ehay-detail.edit');
    });

    Route::middleware(['auth', 'is_role:3'])->group(function () {
        Route::get('profile', [ProfileController::class, 'index'])->name('profile.index');
        Route::post('profile', [ProfileController::class, 'update'])->name('profile.update');
    });

    // family
    Route::get('/familiy-json/get', [FamilyController::class, 'getById'])->name('families.getById');
});
