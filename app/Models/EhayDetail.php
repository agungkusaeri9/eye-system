<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EhayDetail extends Model
{
    use HasFactory;
    protected $guarded = ['id'];

    public function ehay()
    {
        return $this->belongsTo(Ehay::class);
    }

    public function costCareTotal()
    {
        $cost1 = $this->cost_care1;
        $cost2 = $this->cost_care2;
        return $cost1 + $cost2;
    }

    public function getDescription()
    {
        if ($this->care_type1 && $this->care_type2) {
            $careType = "RANAP";
        } else {
            if ($this->care_type1 == 'Rawat Inap') {
                $careType = 'RANAP';
            } else {
                $careType = 'RAJAL';
            }
        }

        // nrp + ; + jenis perawatan + ; + bulan tahun + nama karyawan 
        $result = $this->ehay->employee->nrp . ';' . $careType . ';' . $this->getMonthYear() . ';' . $this->ehay->employee->name;
        return $result;
    }

    public static function boot()
    {
        parent::boot();

        static::creating(function ($model) {
            $model->uuid = \Str::uuid();
        });
    }

    // public function total()
    // {
    //     $costCareTotal = $this->cost_care_total;
    //     $costTreatment = $this->cost_treatment;
    //     $costGlasses = $this->cost_glasses;
    //     $total = $costCareTotal + $costTreatment + $costGlasses;
    //     return $total;
    // }

    public function getMonthYear()
    {
        if (!$this->ehay->code) {
            return null;
        }
        $parts = explode('/', $this->ehay->code);
        if (count($parts) < 5) {
            return null;
        }
        $romawi = $parts[3];
        $tahun = $parts[4];
        $romawiToBulan = [
            'I' => 1,
            'II' => 2,
            'III' => 3,
            'IV' => 4,
            'V' => 5,
            'VI' => 6,
            'VII' => 7,
            'VIII' => 8,
            'IX' => 9,
            'X' => 10,
            'XI' => 11,
            'XII' => 12,
        ];

        $bulan = $romawiToBulan[$romawi] ?? null;

        if (!$bulan) {
            return null;
        }

        return str_pad($bulan, 2, '0', STR_PAD_LEFT) . substr($tahun, 2);
    }

    public function files()
    {
        return $this->hasMany(EhayFile::class, 'ehay_detail_id', 'id');
    }
}
