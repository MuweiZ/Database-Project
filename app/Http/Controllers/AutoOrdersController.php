<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AutoOrder;
use App\Http\Requests\AutoOrderRequest;

class AutoOrdersController extends Controller
{
    public function index(Request $request)
    {
        return view('auto_order.index', [
            'auto_order' => $request->user()->auto_order,
        ]);
    }

    public function create()
    {
        return view('auto_order.create', ['auto_order' => new AutoOrder()]);
    }

    public function store(AutoOrderRequest $request)
    {
        $request->user()->auto_order()->create($request->only([
            'auto_policy_id',
            'start_date',
            'end_date',
            'payment_method',
            'order_status',
        ]));

        return redirect()->route('auto_order.index');
    }
}
