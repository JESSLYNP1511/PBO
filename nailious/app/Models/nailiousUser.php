<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class nailiousUser extends Model
{
    use HasFactory;
    protected $table= "User";
    protected $fillable = [
        'name',
        'email',
        'cust_id',
        'history',
        'phone_number',
        'customer_since',
        
    ];
}
