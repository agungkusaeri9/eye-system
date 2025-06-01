<?php

namespace App\Imports;

use App\Models\Department;
use App\Models\Employee;
use App\Models\Position;
use App\Models\User;
use Carbon\Carbon;
use DB;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\Log;
use Maatwebsite\Excel\Concerns\ToCollection;
use Maatwebsite\Excel\Concerns\ToModel;

class EmployeeImport implements ToCollection
{
    /**
     * @param array $row
     *
     * @return \Illuminate\Database\Eloquent\Model|null
     */
    public function collection(Collection $rows)
    {
        foreach ($rows as $key => $row) {
            if ($key > 0) {
                DB::beginTransaction();
                try {
                    $nrp = $row[1];
                    $nama = $row[2];
                    $position_name = $row[3];
                    $department_name = $row[4];
                    $email = $nrp . '@mail.com';
                    $password = bcrypt($nrp);
                    $default_date_of_birth = Carbon::now();
                    $department = Department::firstOrCreate(
                        ['name' => $department_name],
                        ['name' => $department_name]
                    );
                    $position = Position::firstOrCreate(
                        ['name' => $position_name],
                        ['name' => $position_name]
                    );

                    // cek karyawan by nik
                    $employee = Employee::where('nrp', $nrp)->first();
                    if ($employee) {
                        // cek apakaah punya user_id
                        if ($employee->user_id == null) {
                            // jika tidak punya user_id
                            $user = User::where('nrp', $nrp)->first();
                            if (!$user) {
                                $user = User::create([
                                    'name' => $nama,
                                    'nrp' => $nrp,
                                    'email' => $email,
                                    'password' => $password,
                                    'department_id' => $department->id,
                                    'position_id' => $position->id,
                                    'role' => 3,
                                    'status' => 'Aktif'
                                ]);
                            }
                            // simpan user_id di employee
                            $employee->update([
                                'user_id' => $user->id
                            ]);
                        }

                    } else {

                        $user = User::create([
                            'name' => $nama,
                            'nrp' => $nrp,
                            'email' => $email,
                            'password' => $password,
                            'department_id' => $department->id,
                            'position_id' => $position->id,
                            'role' => 3,
                            'status' => 'Aktif'
                        ]);

                        $user->employee()->create([
                            'nrp' => $nrp,
                            'name' => $nama,
                            'email' => $email,
                            'no_handphone' => '-',
                            'date_born' => $default_date_of_birth,
                            'address' => '-',
                            'department_id' => $department->id,
                            'password' => $password,
                            // 'user_id' => $user->id
                        ]);
                    }
                    DB::commit();
                } catch (\Throwable $th) {
                    dd($th->getMessage());
                    // DB::rollBack();
                    // throw $th;
                    Log::error($th->getMessage());
                }
            }
        }
    }
}
