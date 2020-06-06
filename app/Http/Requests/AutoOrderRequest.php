<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AutoOrderRequest extends Request
{

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'payment_method' => 'required',
        ];
    }
}
