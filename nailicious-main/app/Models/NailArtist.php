<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class NailArtist extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'specialty',
        'bio',
        'photo',
    ];

    protected $table = 'artists';

    /**
     * Define the relationship with the Booking model.
     * An artist can have many bookings.
     */
    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
