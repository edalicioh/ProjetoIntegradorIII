<?php



Route::group([

    'prefix' => '/'

], function ($router) {

    Route::get('login', function() { return view('auth.login'); });
    Route::get('sign', function() { return view('auth.signup'); });

    Route::post('login', 'web\AuthController@doLogin');
    Route::post('sign', 'web\AuthController@sign');
    Route::put('sign', 'web\AuthController@upPassword');

});

Route::get('/{any}', 'HomeController@index')->where('any', '.*');
