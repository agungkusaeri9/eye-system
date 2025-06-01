<?php

namespace App\Imports;

use App\Models\Employee;
use App\Models\Family;
use Illuminate\Support\Collection;
use Log;
use Maatwebsite\Excel\Concerns\ToCollection;

class FamilyImport implements ToCollection
{
    /**
     * @param Collection $collection
     */
    public function collection(Collection $rows)
    {
        foreach ($rows as $row) {
            $nrp = $row[1];
            $relation = $row[2];
            $name = $row[3];
            $employee = Employee::where('nrp', $nrp)->first();
            try {
                $family = Family::where('employee_id', $employee->id)->where('relation', $relation)->where('name', $name)->first();
                if ($family) {
                    continue;
                } else {
                    Family::create([
                        'employee_id' => $employee->id,
                        'relation' => $relation,
                        'name' => $name
                    ]);
                }
            } catch (\Throwable $th) {
                //throw $th;
                Log::error($th->getMessage());
            }
        }
    }
}
