<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class AutoPolicy extends Model
{
  protected $fillable = [
                    'insurance_id', 'vin', 'make_year', 'status', 'amount',
  ];
  public $timestamps = false;
  protected $casts = [
          'make_year' => 'date_format:"Y"',
      ];

  public function user()
  {
      return $this->belongsTo(User::class);
  }

  public function insurance()
  {
      return $this->belongsTo(Insurance::class);
  }

  public function auto_order()
  {
      return $this->hasOne(AutoOrder::class);
  }

    public function auto_policy_driver()
    {
        return $this->hasMany(AutoPolicyDriver::class);
    }
}
