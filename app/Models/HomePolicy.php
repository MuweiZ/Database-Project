<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HomePolicy extends Model
{
  protected $fillable = [
                    'insurance_id', 'area', 'purchase_date', 'purchase_value', 'home_type', 'fire_notification', 'security_system',
                    'swimming_pool', 'basement', 'amount',
  ];
  public $timestamps = false;
  protected $casts = [
          'fire_notification' => 'boolean',
          'basement' => 'boolean',
          'security_system' => 'boolean',
          'purchase_date' => 'datatime',
      ];

  public function user()
  {
      return $this->belongsTo(User::class);
  }

  public function insurance()
  {
      return $this->belongsTo(Insurance::class);
  }

  public function home_order()
  {
      return $this->hasOne(HomeOrder::class);
  }
}
