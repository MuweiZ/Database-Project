<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Requests\AddHomePolicyRequest;
use App\Models\HomePolicy;
use Illuminate\Http\Request;
//use App\Http\Requests\Request;
use App\Http\Requests\AddHomePolicyRequest;

class HomePolicyController extends Controller
{
  public function add(AddHomePolicyRequest $request)
  {
      $user   = $request->user();
      $insuranceId  = $request->input('insurance_id');
      $area  = $request->input('area');
      $purchase_date  = $request->input('purchase_date');
      $purchase_value  = $request->input('purchase_value');
      $home_type  = $request->input('home_type');
      $fire_notification  = $request->input('fire_notification');
      $security_system  = $request->input('security_system');
      $swimming_pool  = $request->input('swimming_pool');
      $basement  = $request->input('basement');
      $amount = $request->input('amount');

      // 创建一个新的home policy记录
      $homePlicy = new HomePolicy([
                              'insurance_id' => $insuranceId,
                              'area' => $area,
                              'purchase_date' => $purchase_date,
                              'purchase_value' => $purchase_value,
                              'home_type' => $home_type,
                              'fire_notification' => $fire_notification,
                              'security_system' => $security_system,
                              'swimming_pool' => $swimming_pool,
                              'basement' => $basement,
                              'amount' => $amount
                            ]);
      $homePlicy->user()->associate($user);
      $homePlicy->insurance()->associate($insuranceId);
      $homePlicy->save();
      return redirect()->route('insurance.index');
      }

    public function index(Request $request)
    {
        return view('home_policy.index', [
            'home_policy' => $request->user()->home_policy,
//            'home_policy' => new HomePolicy()
        ]);
    }

    public function create()
    {
        return view('home_policy.create_and_edit', ['home_policy' => new HomePolicy()]);
    }

    public function store(AddHomePolicyRequest $request)
    {
        $request->user()->home_policy()->create($request->only([
            'insurance_id',
            'area',
            'purchase_date',
            'purchase_value',
            'home_type',
            'fire_notification',
            'security_system' ,
            'swimming_pool',
            'basement',
            'amount',
        ]));

        return redirect()->route('home_policy.index');
    }

    public function edit(HomePolicy $home_policy)
    {
        $this->authorize('own', $home_policy);
        return view('home_policy.create_and_edit', ['home_policy' => $home_policy]);
    }

    public function update(HomePolicy $home_policy, AddHomePolicyRequest $request)
    {
        $this->authorize('own', $home_policy);
        $home_policy->update($request->only([
            'insurance_id',
            'area',
            'purchase_date',
            'purchase_value',
            'home_type',
            'fire_notification',
            'security_system' ,
            'swimming_pool',
            'basement',
            'amount',
        ]));

        return redirect()->route('home_policy.index');
    }

    public function destroy(HomePolicy $home_policy)
    {
        $this->authorize('own', $home_policy);
        $home_policy->delete();

        return redirect()->route('home_policy.index');
    }

  }
