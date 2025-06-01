<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Sanctum\HasApiTokens;

class Employee extends Authenticatable
{
    use HasFactory, HasApiTokens;
    protected $table = 'employees';
    protected $primaryKey = 'id';
    protected $fillable = ['nrp', 'name', 'email', 'no_handphone', 'date_born', 'address', 'password', 'department_id', 'company_id', 'user_id'];
    public function department()
    {
        return $this->belongsTo(Department::class, 'department_id');
    }
    public function company()
    {
        return $this->belongsTo(Company::class, 'company_id');
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }


}
