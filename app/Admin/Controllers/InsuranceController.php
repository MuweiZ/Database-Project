<?php

namespace App\Admin\Controllers;

use App\Models\Insurance;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;

class InsuranceController extends AdminController
{
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Insurance';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new Insurance);

        $grid->id('ID')->sortable();
        $grid->title('Insurance Type');
        $grid->price('Price');

        $grid->actions(function ($actions) {
            $actions->disableView();
//            $actions->disableDelete();
        });
        $grid->tools(function ($tools) {
            // 禁用批量删除按钮
            $tools->batch(function ($batch) {
                $batch->disableDelete();
            });
        });

        return $grid;
    }


    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
      $form = new Form(new Insurance);

      // 创建输入框
      $form->text('title', 'Insurance Type')->rules('required');
      // 富文本编辑器
      $form->quill('description', 'Description')->rules('required');
      $form->radio('is_home', 'Insurance Type')->options(['1' => 'Home Insurance', '0'=> 'Auto Insurance'])->default('1');
      $form->text('price', 'Price')->rules('required')->default('0');

      return $form;
    }
}
