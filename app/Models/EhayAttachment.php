<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class EhayAttachment extends Model
{
    use HasFactory;
    protected $table = 'ehay_attachments';
    protected $guarded = ['id'];


    public function ehay()
    {
        return $this->belongsTo(Ehay::class);
    }
}
