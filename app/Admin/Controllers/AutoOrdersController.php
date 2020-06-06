<?php

namespace App\Admin\Controllers;

use App\Models\AutoOrder;
use Encore\Admin\Controllers\AdminController;
use Encore\Admin\Form;
use Encore\Admin\Grid;
use Encore\Admin\Show;
use Encore\Admin\Layout\Content;
use Illuminate\Http\Request;
use App\Exceptions\InvalidRequestException;
use Illuminate\Foundation\Validation\ValidatesRequests;

class AutoOrdersController extends AdminController
{
    use ValidatesRequests;
    /**
     * Title for current resource.
     *
     * @var string
     */
    protected $title = 'Auto Insurance Order';

    /**
     * Make a grid builder.
     *
     * @return Grid
     */
    protected function grid()
    {
        $grid = new Grid(new AutoOrder);

        $grid->model()->whereNotNull('start_date')->orderBy('end_date', 'desc');
        $grid->disableCreateButton();

        $grid->column('id', __('Id'));
        $grid->column('user_id', __('User id'));
        $grid->column('auto_policy_id', __('Auto policy id'));
        $grid->column('start_date', __('Start date'));
        $grid->column('end_date', __('End date'));
        $grid->column('payment_method', __('Payment method'));
        $grid->column('order_status', __('Order status'));
        // $grid->column('created_at', __('Created at'));
        // $grid->column('updated_at', __('Updated at'));

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
        $show = new Show(AutoOrder::findOrFail($id));

        $show->field('id', __('Id'));
        $show->field('user_id', __('User id'));
        $show->field('auto_policy_id', __('Auto policy id'));
        $show->field('start_date', __('Start date'));
        $show->field('end_date', __('End date'));
        $show->field('payment_method', __('Payment method'));
        $show->field('order_status', __('Order status'));
        $show->field('created_at', __('Created at'));
        $show->field('updated_at', __('Updated at'));

        return $show;
    }

    /**
     * Make a form builder.
     *
     * @return Form
     */
    protected function form()
    {
        $form = new Form(new AutoOrder);

        $form->number('user_id', __('User id'));
        $form->number('auto_policy_id', __('Auto policy id'));
        $form->datetime('start_date', __('Start date'))->default(date('Y-m-d H:i:s'));
        $form->datetime('end_date', __('End date'))->default(date('Y-m-d H:i:s'));
        $form->text('payment_method', __('Payment method'));
        $form->text('order_status', __('Order status'))->default('pending');

        return $form;
    }

    public function show($id, Content $content)
    {
        return $content
            ->header('View Auto Insurance Orders')
            // body 方法可以接受 Laravel 的视图作为参数
            ->body(view('admin.auto_orders.show', ['auto_order' => AutoOrder::find($id)]));
    }

    public function expire(AutoOrder $auto_order, Request $request)
    {
        if($auto_order->order_status == AutoOrder::ORDER_STATUS_EXPIRED) {
            throw new InvalidRequestException('This insurance is expired!');
        }

        $data = $this->validate($request, [
            'updated_at' => ['after:$auto_order->end_date'],
        ]);

        $auto_order->update([
            'order_status' => AutoOrder::ORDER_STATUS_EXPIRED,
        ]);
        // 返回上一页
        return redirect()->back();
    }
}
