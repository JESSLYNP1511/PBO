<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Booking extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id',
        'artist_id',
        'service_id',
        'status',
        'note',
        'booking_time',
        'artist_name',
        'service_name',
        'price'
    ];

    protected $casts = [
        'booking_time' => 'datetime', // Ensure 'booking_time' is treated as a date
    ];

    /**
     * Define the relationship with the User model.
     * A booking belongs to a user.
     */
    public function user()
    {
        return $this->belongsTo(NailiciousUser::class);
    }

    /**
     * Define the relationship with the Artist model.
     * A booking belongs to an artist.
     */
    public function artist()
    {
        return $this->belongsTo(NailArtist::class);
    }

    /**
     * Define the relationship with the Service model.
     * A booking belongs to a service.
     */
    public function service()
    {
        return $this->belongsTo(Service::class);
    }
}
