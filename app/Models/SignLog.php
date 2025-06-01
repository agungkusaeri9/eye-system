<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SignLog extends Model
{
    use HasFactory;
    protected $table = 'sign_logs';
    protected $primaryKey = 'id';
    protected $fillable = [
        'sign_id',
        'log_title',
        'log_description',
    ];

    public function signTag()
    {
        return $this->belongsTo(Sign::class, 'sign_id');
    }
}
