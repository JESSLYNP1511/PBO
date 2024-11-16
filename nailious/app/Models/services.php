<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class services extends Model
{
    protected $table= "Services";
    protected $fillable = [
        'service_category',
        'price',
        'time_spend',
        'available',  // Status ketersediaan (1 = tersedia, 0 = tidak tersedia)
    ];
}
