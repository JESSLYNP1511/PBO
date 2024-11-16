<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class booking extends Model
{
    protected $table= "Booking";
    protected $fillable = [
        'booking_id',     // ID unik untuk pemesanan
        'cust_id',    // ID pelanggan
        'nail_artist_id', // ID nail artist
        'service_id',     // ID layanan yang dipesan
        'booking_date',   // Tanggal pemesanan
        'booking_time',   // Waktu pemesanan
        'total_price',    // Total biaya pemesanan
    ];
}
