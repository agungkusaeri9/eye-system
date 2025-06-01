<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EhayCare extends Model
{
    use HasFactory;

    protected $table = 'ehay_cares';

    protected $guarded = ['id'];


}
