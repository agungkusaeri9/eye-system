<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EhayDetail extends Model
{
    use HasFactory;
    protected $guarded = [];

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

    // public function total()
    // {
    //     $costCareTotal = $this->cost_care_total;
    //     $costTreatment = $this->cost_treatment;
    //     $costGlasses = $this->cost_glasses;
    //     $total = $costCareTotal + $costTreatment + $costGlasses;
    //     return $total;
    // }
}
