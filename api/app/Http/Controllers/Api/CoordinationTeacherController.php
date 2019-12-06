<?php

namespace App\Http\Controllers\Api;

use App\Classes;
use App\Http\Controllers\Controller;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CoordinationTeacherController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $users = DB::table('users')
            ->leftJoin('userhasclass', 'users.id', '=', 'userhasclass.user_id')
            ->rightJoin('classes', 'classes.id', '=', 'userhasclass.class_id')
            ->where("user_type" , "PRO")
            ->get();


        return response()->json( $users);
    }

    /**
     * Store a newly created resource in storage.
     *'
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $req = $request->all([
            'full_name',
            'phone',
            'cpf',
            'gender',
            'user_type',
            'email',
            'classes'
        ]);
        $user = DB::table('users')->insertGetId([
            'full_name' => $req['full_name'],
            'phone'     => $req['phone'],
            'cpf'       => $req['cpf'],
            'gender'    => $req['gender'],
            'user_type' => $req['user_type'],
            'email'     => $req['email']
        ]);

        return DB::table('userhasclass')->insertGetId([
            'class_id'  =>  $req['classes'] ,
            'user_id'   =>  $user,
        ]);

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        return  DB::table('users')
            ->where('id', $id)
            ->get([
            "full_name",
            "phone",
            "cpf",
            "gender",
            "email",
        ] );
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        return  DB::table('users')->where('id', $id)->update($request->all());
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
