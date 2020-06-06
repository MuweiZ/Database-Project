<?php

namespace App\Policies;

use App\Models\User;
use App\Models\HomePolicy;
use Illuminate\Auth\Access\HandlesAuthorization;

class HomePolicyPolicy
{
    use HandlesAuthorization;

    /**
     * Create a new policy instance.
     *
     * @return void
     */
    public function __construct()
    {
        //
    }

    public function own(User $user, HomePolicy $home_policy)
    {
        return $home_policy->user_id == $user->id;
    }
}
