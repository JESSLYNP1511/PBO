<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class nailArtist extends Model
{
    protected $table= "Nail Artist";
    protected $fillable = [
        'name',
        'nail_artist_id',
        'rate_price', // Rata-rata biaya per layanan
        'specialization',   // Spesialisasi nail artist
        'availability', // Status ketersediaan (1 = tersedia, 0 = tidak tersedia)
        'total_customer', // Jumlah pelanggan yang dilayani
        'schedule',     // Jadwal kerja dalam format JSON atau string
        'rating',// Rata-rata rating dari pelanggan
    ];
}
