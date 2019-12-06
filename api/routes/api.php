<?php

use Illuminate\Http\Request;

Route::group([

    'middleware' => 'api',
    'prefix' => 'auth'

], function ($router) {

    Route::post('login', 'AuthController@login');
    Route::post('sign', 'AuthController@sign');
    Route::post('upPassword', 'AuthController@upPassword');
    Route::get('logout', 'AuthController@logout');
    Route::post('refresh', 'AuthController@refresh');
    Route::post('me', 'AuthController@me');

    Route::group(['prefix' => 'coordenacao'], function () {
        Route::apiResource('professores' , 'Api\CoordinationTeacherController');
        Route::apiResource('estudantes' , 'Api\CoordinationStudentController');
        Route::apiResource('classes' , 'Api\CoordinationClassController');
    });

});

