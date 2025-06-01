<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SignHistory extends Model
{
    use HasFactory;
    protected $table = 'sign_histories';
    protected $primaryKey = 'id';
    protected $fillable = [
        'validator_id',
        'sign_id',
        'news_status',
        'sign_status',
        'accepted_note',
        'rejected_reason',
        'approved_news_date',
        'approved_sign_date',
        'note_customer',
    ];

    public function validatorTag()
    {
        return $this->belongsTo(User::class, 'validator_id');
    }
    public function signTag()
    {
        return $this->belongsTo(Sign::class, 'sign_id');
    }
}
