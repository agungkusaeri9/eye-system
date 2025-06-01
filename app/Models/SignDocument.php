<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SignDocument extends Model
{
    use HasFactory;
    protected $table = 'sign_documents';
    protected $primaryKey = 'id';
    protected $fillable = [
        'sign_id',
        'sign_document',
    ];
}
