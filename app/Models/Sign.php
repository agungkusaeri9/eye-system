<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Sign extends Model
{
    use HasFactory;
    protected $table = 'signs';
    protected $primaryKey = 'id';
    protected $fillable = [
        'sign_number',
        'from_id',
        'name',
        'sign_file',
        'verified_sign_file',
        'to_id',
        'type',
        'status',
        'sign',
        'signature',
        'catatan_diterima',
        'alasan_ditolak',
    ];

    public function from()
    {
        return $this->belongsTo(User::class, 'from_id');
    }
    public function support()
    {
        return $this->hasMany(SignDocument::class);
    }
    public static function generateSignNumber()
    {
        $existingSignNumber = Sign::pluck('sign_number')->toArray();

        do {
            $datenow = date('Ymd');
            $rand = mt_rand(100000000, 999999999);
            $newSignNumber = $datenow.$rand;
        } while (in_array($newSignNumber, $existingSignNumber));

        return $newSignNumber;
    }
}
