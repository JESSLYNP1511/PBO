<?php


namespace App\Models;

use Illuminate\Database\Eloquent\Model;


class NailiciousUser extends Model
{

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
    ];

    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $table = 'nailicious_users';

    /**
     * Define the relationship with the Booking model.
     * A user can have multiple bookings.
     */
    public function bookings()
    {
        return $this->hasMany(Booking::class);
    }
}
