<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AutoPolicyDriver extends Model
{
    //
    public function driver()
    {
        return $this->belongsTo(Driver::class);
    }

    public function auto_policy()
    {
        return $this->belongsTo(AutoPolicy::class);
    }
}
