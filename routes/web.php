<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', 'PagesController@root')->name('root');

Auth::routes();

Route::redirect('/', '/insurance')->name('root');

// Insurance details
Route::get('insurance', 'insuranceController@index')->name('insurance.index');
Route::get('insurance/{insurance}', 'insuranceController@show')->name('insurance.show');

Route::group(['middleware' => ['auth', 'verified']], function () {
    Route::get('home_policy', 'HomePolicyController@index')->name('home_policy.index');
    Route::get('home_policy/create', 'HomePolicyController@create')->name('home_policy.create');
    Route::post('home_policy', 'HomePolicyController@store')->name('home_policy.store');
    Route::get('home_policy/{home_policy}', 'HomePolicyController@edit')->name('home_policy.edit');
    Route::put('home_policy/{home_policy}', 'HomePolicyController@update')->name('home_policy.update');
    Route::delete('home_policy/{home_policy}', 'HomePolicyController@destroy')->name('home_policy.destroy');
    // Route::post('home_policy', 'HomePolicyController@add')->name('home_policy.add');
    // auto Policy
    Route::get('auto_policy', 'AutoPolicyController@index')->name('auto_policy.index');
    Route::get('auto_policy/create', 'AutoPolicyController@create')->name('auto_policy.create');
    Route::post('auto_policy', 'AutoPolicyController@store')->name('auto_policy.store');
    Route::get('auto_policy/{auto_policy}', 'AutoPolicyController@edit')->name('auto_policy.edit');
    Route::put('auto_policy/{auto_policy}', 'AutoPolicyController@update')->name('auto_policy.update');
    Route::delete('auto_policy/{auto_policy}', 'AutoPolicyController@destroy')->name('auto_policy.destroy');

    // home order
    Route::get('home_order', 'HomeOrdersController@index')->name('home_order.index');
    Route::get('home_order/create', 'HomeOrdersController@create')->name('home_order.create');
    Route::post('home_order', 'HomeOrdersController@store')->name('home_order.store');

    // auto order
    Route::get('auto_order', 'AutoOrdersController@index')->name('auto_order.index');
    Route::get('auto_order/create', 'AutoOrdersController@create')->name('auto_order.create');
    Route::post('auto_order', 'AutoOrdersController@store')->name('auto_order.store');
});
