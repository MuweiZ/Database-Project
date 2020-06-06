<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\HomeOrder;
use App\Http\Requests\HomeOrderRequest;

class HomeOrdersController extends Controller
{
  public function index(Request $request)
  {
      return view('home_order.index', [
          'home_order' => $request->user()->home_order,
      ]);
  }

  public function create()
  {
      return view('home_order.create', ['home_order' => new HomeOrder()]);
  }

  public function store(HomeOrderRequest $request)
  {
      $request->user()->home_order()->create($request->only([
          'home_policy_id',
          'start_date',
          'end_date',
          'payment_method',
          'order_status',
      ]));

      return redirect()->route('home_order.index');
  }
}
