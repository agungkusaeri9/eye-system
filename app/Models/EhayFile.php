<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EhayFile extends Model
{
    use HasFactory;
    protected $table = 'ehay_files';
    protected $guarded = ['id'];
}
