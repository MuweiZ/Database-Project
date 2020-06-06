<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class HomeOrder extends Model
{
  const ORDER_STATUS_PENDING = 'pending';
  const ORDER_STATUS_CURRENT = 'current';
  const ORDER_STATUS_EXPIRED = 'expired';

  protected $fillable = [
        'home_policy_id',
        'start_date',
        'end_date',
        'payment_method',
        'order_status',
    ];

    protected $dates = [
        'start_date',
        'end_date',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function home_policy()
    {
        return $this->belongsTo(HomePolicy::class);
    }
}
