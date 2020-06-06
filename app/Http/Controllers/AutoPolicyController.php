<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\AutoPolicy;
use App\Http\Requests\AutoPolicyRequest;

class AutoPolicyController extends Controller
{
  public function index(Request $request)
  {
      return view('auto_policy.index', [
          'auto_policy' => $request->user()->auto_policy,
      ]);
  }

  public function create()
  {
      return view('auto_policy.create_and_edit', ['auto_policy' => new AutoPolicy()]);
  }

  public function edit(AutoPolicy $auto_policy)
  {
      $this->authorize('own', $auto_policy);
      return view('auto_policy.create_and_edit', ['auto_policy' => $auto_policy]);
  }

  public function store(AutoPolicyRequest $request)
  {
      $request->user()->auto_policy()->create($request->only([
          'insurance_id',
          'vin',
          'make_year',
          'status',
          'amount',
      ]));

      return redirect()->route('auto_policy.index');
  }

  public function update(AutoPolicy $auto_policy, AutoPolicyRequest $request)
  {
      $this->authorize('own', $auto_policy);
      $auto_policy->update($request->only([
          'insurance_id',
          'vin',
          'make_year',
          'status',
          'amount',
      ]));

      return redirect()->route('auto_policy.index');
  }

  public function destroy(AutoPolicy $auto_policy)
  {
      $this->authorize('own', $auto_policy);
      $auto_policy->delete();

      return redirect()->route('auto_policy.index');
  }
}
