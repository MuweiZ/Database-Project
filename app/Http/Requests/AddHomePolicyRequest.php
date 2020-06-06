<?php

namespace App\Http\Requests;



class AddHomePolicyRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
          // 'insurance_id' => ['required', 'filled'],
          'area' => ['required', 'numeric', 'filled'],
          'purchase_date' => ['required', 'date', 'filled'],
          'home_type' => ['required', 'alpha', 'in:S,M,C,T', 'filled'],
          'fire_notification' => ['required', 'boolean', 'filled'],
          'security_system' => ['required', 'boolean', 'filled'],
          'swimming_pool' => ['nullable', 'alpha', 'in:U,O,I,M,N'],
          'basement' => ['required', 'boolean', 'filled'],
          'amount' => ['required', 'integer', 'min:1', 'filled'],
        ];
    }
}
