<?php

use Illuminate\Routing\Router;

Admin::routes();

Route::group([
    'prefix'        => config('admin.route.prefix'),
    'namespace'     => config('admin.route.namespace'),
    'middleware'    => config('admin.route.middleware'),
], function (Router $router) {

    $router->get('/', 'HomeController@index')->name('admin.home');
    $router->get('users', 'UsersController@index');
    $router->get('users/{id}', 'UsersController@show')->name('admin.UsersController.show');
    $router->get('users/create', 'UsersController@create');
    $router->post('users', 'UsersController@store');
    $router->get('users/{id}/edit', 'UsersController@edit');
    $router->put('users/{id}', 'UsersController@update');

    $router->get('insurance', 'InsuranceController@index');
    $router->get('insurance/create', 'InsuranceController@create');
    $router->post('insurance', 'InsuranceController@store');
    // insurance
    $router->get('insurance/{id}/edit', 'InsuranceController@edit');
    $router->put('insurance/{id}', 'InsuranceController@update');
    $router->delete('insurance/{id}', 'insuranceController@destroy');

    // home orders
    $router->get('home_orders', 'HomeOrdersController@index')->name('admin.home_orders.index');
    $router->get('home_orders/{home_order}', 'HomeOrdersController@show')->name('admin.home_orders.show');
    $router->post('home_orders/{home_order}/expire', 'HomeOrdersController@expire')->name('admin.home_orders.expire');
    $router->get('home_orders/{home_order}/edit', 'HomeOrdersController@edit');
    $router->put('home_orders/{home_order}', 'HomeOrdersController@update');

    // auto orders
    $router->get('auto_orders', 'AutoOrdersController@index')->name('admin.auto_orders.index');
    $router->get('auto_orders/{auto_order}', 'AutoOrdersController@show')->name('admin.auto_orders.show');
    $router->post('auto_orders/{auto_order}/expire', 'AutoOrdersController@expire')->name('admin.auto_orders.expire');
    $router->get('auto_orders/{auto_order}/edit', 'AutoOrdersController@edit');
    $router->put('auto_orders/{auto_order}', 'AutoOrdersController@update');
});
