<?php

namespace App\Models;

use Carbon\Carbon;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ehay extends Model
{
    use HasFactory;
    protected $table = 'ehays';
    protected $guarded = ['id'];
    // protected $appends = [
    //     'nominal_cares',
    //     'nominal_treatments',
    // ];


    public function attachments()
    {
        return $this->hasMany(EhayAttachment::class);
    }

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }

    public static array $PatientStatus = [
        'YBS',
        'Istri/Suami',
        'Anak 1',
        'Anak 2',
        'Anak 3',
    ];

    public static function romawi($bulan)
    {
        $map = [
            1 => 'I',
            2 => 'II',
            3 => 'III',
            4 => 'IV',
            5 => 'V',
            6 => 'VI',
            7 => 'VII',
            8 => 'VIII',
            9 => 'IX',
            10 => 'X',
            11 => 'XI',
            12 => 'XII'
        ];

        return $map[intval($bulan)] ?? '';
    }

    public static function generateCode($divisi = 'KPP', $jenis = 'DEKL')
    {
        $prefix = 'EHAY';
        $bulan = Carbon::now()->format('n');
        $bulanRomawi = self::romawi($bulan);
        $tahun = Carbon::now()->year;

        // Ambil semua kode dari bulan & tahun ini
        $lastKode = self::orderByDesc('id')
            ->first();


        $nomorUrut = 1;

        if ($lastKode) {
            // Misal: EHAY.005/KPP/DEKL/IV/2025
            $potong = explode('.', $lastKode->code); // ['EHAY', '005/KPP/DEKL/IV/2025']

            if (isset($potong[1])) {
                $bagianNomor = explode('/', $potong[1]); // ['005', 'KPP', 'DEKL', ...]

                if (isset($bagianNomor[0])) {
                    $nomorUrut = (int) $bagianNomor[0] + 1;
                }
            }
        }

        $nomorFormatted = str_pad($nomorUrut, 3, '0', STR_PAD_LEFT);

        return "{$prefix}.{$nomorFormatted}/{$divisi}/{$jenis}/{$bulanRomawi}/{$tahun}";
    }

    public static function boot()
    {
        parent::boot();

        static::created(function ($model) {
            EhayLogStatus::create([
                'ehay_id' => $model->id,
                'name' => 'Waiting for HCGS Admin Validation',
                'is_done' => 0
            ]);
        });

        static::creating(function ($model) {
            $model->status = 1;
            $model->uuid = \Str::uuid();
        });
    }

    public function logStatus()
    {
        return $this->hasMany(EhayLogStatus::class)->orderBy('id', 'desc');
    }

    public function currentLogStatus()
    {
        $validatedLog = $this->logStatus()->latest()->first();

        if ($validatedLog) {
            return $validatedLog->name ?? '-';
        }

        return $this->logStatus()->oldest()->first()->name ?? '-';
    }

    public function currentLogStatusData()
    {
        $validatedLog = $this->logStatus()->latest()->first();

        return $validatedLog;
    }

    public function currentLogStatusCustomer()
    {
        $validatedLog = $this->status;

        if ($validatedLog) {
            if ($validatedLog == 5) {
                return "Approved";
            } else {
                return $this->currentLogStatus();
            }
        }

        return $this->logStatus()->oldest()->first()->name ?? '-';
    }

    public function getMonthYear()
    {
        if (!$this->code) {
            return null;
        }
        $parts = explode('/', $this->code);
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

    public function getTreatmentType()
    {
        $treatment = $this->ehayTreatments()->latest()->first();
        if ($treatment) {
            if ($treatment->name === "Rawat Jalan") {
                return "RAJAL";
            } elseif ($treatment->name === "Rawat Inap") {
                return "RANAP";
            }
        } else {
            return "-";
        }
    }


    public function getDescription()
    {
        return $this->employee->nrp . ';' . $this->getTreatmentType() . ';' . $this->getMonthYear() . ';' . $this->employee->name;
    }

    public function ehayCares()
    {
        return $this->hasMany(EhayCare::class);
    }

    public function ehayTreatments()
    {
        return $this->hasMany(EhayTreatment::class);
    }

    public function scopeByRole($query)
    {
        if (auth()->user()->role == 4 || auth()->user()->role == 1) {
            // admin
            return $query->where('status', 1);
        } elseif (auth()->user()->role == 5) {
            // hcgsofficer/validator
            return $query->where('status', 3);
        } else {
            // customer/karyawan
            return $query->where('employee_id', auth()->user()->employee->id);
        }
    }

    public function family()
    {
        return $this->belongsTo(Family::class);
    }

    public static function convertStatus($status)
    {
        if ($status == 1) {
            return "Waiting for HCGS Admin Validation";
        } elseif ($status == 2) {
            return "Waiting for Revision";
        } elseif ($status == 3) {
            return "Waiting for HCGS Officer Validation";
        } elseif ($status == 4) {
            return "Waiting for Approval 1";
        } elseif ($status == 5) {
            return "Dormant EHAY ready to draw";
        }
    }

    public function getStatus()
    {
        $status = $this->status;
        if ($status == 1) {
            return "Waiting for HCGS Admin Validation";
        } elseif ($status == 2) {
            return "Waiting for Revision";
        } elseif ($status == 3) {
            return "Waiting for HCGS Officer Validation";
        } elseif ($status == 4) {
            return "Waiting for Approval 1";
        } elseif ($status == 5) {
            return "Dormant EHAY ready to draw";
        }
    }

    public static function getStatusSummary()
    {
        $ehayData = self::groupBy('status')
            ->select('status', \DB::raw('count(*) as total'))
            ->orderBy('status')
            ->get()
            ->keyBy('status');

        $finalData = [];

        for ($i = 1; $i <= 5; $i++) {
            if ($i != 4) {
                $finalData[] = [
                    'status' => $i,
                    'status_text' => self::convertStatus($i),
                    'total' => $ehayData[$i]->total ?? 0,
                ];
            }
        }

        return $finalData;
    }

    public function getNominalCaresAttribute()
    {
        return $this->ehayCares()->sum('nominal');
    }

    public function getNominalTreatmentsAttribute()
    {
        return $this->ehayTreatments()->sum('nominal');
    }

    public function ehayFiles()
    {
        return $this->hasMany(EhayFile::class, 'ehay_id', 'id');
    }

}
