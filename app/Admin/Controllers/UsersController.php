<?php

namespace App\Admin\Controllers;

use App\Models\User;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class UsersController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'User Administration';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new User);

        $grid->column('id', __('Id'));
        $grid->column('name', __('Username'));
        $grid->column('email', __('Email'));
        $grid->column('email_verified_at', __('Email verified'))->display(function ($value) {
            return $value ? 'Yes' : 'No';
        });
//        $grid->column('password', __('Password'));
//        $grid->column('password', __('Password'))->display($value);
//        $grid->column('remember_token', __('Remember token'));
        $grid->column('created_at', __('Created at'));
        $grid->column('updated_at', __('Updated at'));
        $grid->column('first_name', __('First name'));
        $grid->column('last_name', __('Last name'));
        $grid->column('gender', __('Gender'));
        $grid->column('state', __('State'));
        $grid->column('city', __('City'));
        $grid->column('street', __('Street'));
        $grid->column('zipcode', __('Zipcode'));
        $grid->column('phone', __('Phone'));
        $grid->column('marital_status', __('Marital status'));

        $grid->disableCreateButton();

        return $grid;
    }

    /**
     * Make a show builder.
     *
     * @param mixed $id
     * @return Show
     */
    protected function detail($id)
    {
        $show = new Show(User::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('name', __('Username'));
        $show->field('email', __('Email'));
        $show->field('email_verified_at', __('Email verified at'));
//        $show->field('email_verified_at', __('Email verified at'))->display(function ($value) {
//            return $value ? 'yes' : 'Not Verified';
//        });;
        //$show->
        $show->field('password', __('Password'));
//        $show->field('remember_token', __('Remember token'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));
        $show->field('first_name', __('First name'));
        $show->field('last_name', __('Last name'));
        $show->field('gender', __('Gender'));
        $show->field('state', __('State'));
        $show->field('city', __('City'));
        $show->field('street', __('Street'));
        $show->field('zipcode', __('Zipcode'));
        $show->field('phone', __('Phone'));
        $show->field('marital_status', __('Marital status'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new User);

        $form->text('name', __('Username'));
        $form->email('email', __('Email'));
//        $form->datetime('email_verified_at', __('Email verified at'))->default(date('Y-m-d H:i:s'));
//        $form->password('password', __('Password'));
//        $form->text('remember_token', __('Remember token'));
        $form->text('first_name', __('First name'));
        $form->text('last_name', __('Last name'));
        $form->text('gender', __('Gender'));
        $form->text('state', __('State'));
        $form->text('city', __('City'));
        $form->text('street', __('Street'));
        $form->text('zipcode', __('Zipcode'));
        $form->mobile('phone', __('Phone'));
        $form->text('marital_status', __('Marital status'));

        return $form;
    }
}
