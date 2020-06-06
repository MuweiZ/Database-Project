<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Insurance extends Model
{
  protected $fillable = [
                'title', 'description', 'is_home', 'price'
  ];
  protected $casts = [
      'is_home' => 'boolean',
  ];
  public $timestamps = false;

  // 与商品SKU关联
//  public function home_skus()
//  {
//      return $this->hasMany(HomeSku::class);
//  }

  public function home_policy()
  {
      return $this->hasMany(HomePolicy::class);
  }

    public function auto_policy()
    {
        return $this->hasMany(AutoPolicy::class);
    }
}
