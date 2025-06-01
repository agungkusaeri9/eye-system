<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class AdminClaimSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        User::create([
            'name' => 'Admin Claim Pengobatan',
            'email' => 'adminclaim@gmail.com',
            'password' => bcrypt('secret'),
            'role' => 4
        ]);
    }
}
