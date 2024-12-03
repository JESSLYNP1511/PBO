<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class ServiceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        DB::table('services')->insert([
            [
                'name' => 'Basic Manicure',
                'description' => 'A simple manicure with nail trimming and polish.',
                'price' => 20
            ],
            [
                'name' => 'Gel Manicure',
                'description' => 'A manicure with gel polish for long-lasting wear.',
                'price' => 40
            ],
            [
                'name' => 'Pedicure',
                'description' => 'A full pedicure to pamper your feet with trimming and polish.',
                'price' => 30
            ],
            [
                'name' => 'Nail Art Design',
                'description' => 'Customized nail art designs with creative patterns.',
                'price' => 50
            ]
        ]);
    }
}
