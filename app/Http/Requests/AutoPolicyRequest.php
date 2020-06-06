<?php

namespace App\Http\Requests;

// use Illuminate\Foundation\Http\FormRequest;

class AutoPolicyRequest extends Request
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
          'vin' => ['required', 'filled'],
          'make_year' => ['required', 'date_format:"Y"', 'filled'],
          'status' => ['required', 'alpha', 'in:L,F,O', 'filled'],
          'amount' => ['required', 'integer', 'min:1', 'filled'],
        ];
    }
}
