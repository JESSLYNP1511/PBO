<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class NailArtistSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('artists')->insert([
            [
                'name' => 'Artist A',
                'bio' => 'Experienced in French nails and designs.',
                "email" => "artisA@gmail.com"
            ],
            [
                'name' => 'Artist B',
                'bio' => 'Specializes in Gel nails and intricate designs.',
                "email" => "artisB@gmail.com"
            ],
            [
                'name' => 'Artist C',
                'bio' => 'Expert in nail art with a creative flair for custom designs.',
                "email" => "artisC@gmail.com"
            ]
        ]);
    }
}
