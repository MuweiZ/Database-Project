<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Driver extends Model
{
    //
    public function auto_policy_driver()
    {
        return $this->hasMany(AutoPolicyDriver::class);
    }
}
