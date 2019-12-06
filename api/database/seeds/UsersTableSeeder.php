<?php

use Illuminate\Database\Seeder;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {

        DB::table('users')->insert([
            'full_name' => "edalicio",
            'phone'     => '21212121',
            'cpf'       => '212121',
            'gender'    =>  'M',
            'user_type' => 'PRO',
            'email' => 'pro@pro.com',
            'login' => "pro",
            'password' => bcrypt('edalicio'),
        ]);
        DB::table('users')->insert([
            'full_name' => "edalicio",
            'phone'     => '21212121',
            'cpf'       => '212121',
            'gender'    =>  'M',
            'user_type' => 'PAI',
            'email' => 'pai@pai.com',
            'login' => "pai",
            'password' => bcrypt('edalicio'),
        ]);
    }
}
