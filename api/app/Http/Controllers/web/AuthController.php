<?php

namespace App\Http\Controllers\web;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\DB;

class AuthController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:web', ['except' => ['doLogin' , 'sign' , 'upPassword']]);
    }

    public function doLogin()
    {
        $data = request(['email', 'password']);

        if ( $token = auth()->attempt($data) ) {
            session(['user' => [
                'id'    => auth()->user()['id'] ,
            ] ]);
            return redirect('/');
        }
        return redirect('/login');
    }
    public function sign()
    {
        $email = request(['email']);
        $res = DB::table('users')->where('email', $email);


        if ( !empty( $res->value('password') ) ) {
            session(['error' => "erroooooooooooooo"]);
            return redirect('/sign');
        }

        session(['show' => true , 'id' => $res->value('id')]);
        return redirect('/sign');
    }

    public function upPassword()
    {
        $data = request(['id' , 'password' , 'passwordConf']);

        if ( $data['password'] == $data['passwordConf'] && ( $data['password'] != null ) ) {
            $res = DB::table('users')->where('id', $data['id'])->update(['password' => bcrypt($data['password'])]);
            if ( $res ) {
                return redirect('/login');
            }
            session(['error' => "Erro no atualicao" , 'show' => true]);
            return redirect('/sign');
        }
        session(['error' => "Senha invalidos" , 'show' => true]);
        return redirect('/sign');
    }
}
