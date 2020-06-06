<?php

namespace App\Policies;

use App\Models\User;
use App\Models\AutoPolicy;
use Illuminate\Auth\Access\HandlesAuthorization;

class AutoPolicyPolicy
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

    public function own(User $user, AutoPolicy $auto_policy)
    {
        return $auto_policy->user_id == $user->id;
    }
}
