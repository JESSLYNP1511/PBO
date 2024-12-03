<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Service extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'description',
        'price',
    ];

    /**
     * Define the relationship with the Booking model.
     * A service can have many bookings.
     */
    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
