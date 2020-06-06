<div class="box box-info">
  <div class="box-header with-border">
    <h3 class="box-title">Order ID: {{ $auto_order->id }}</h3>
    <div class="box-tools">
      <div class="btn-group float-right" style="margin-right: 10px">
        <a href="{{ route('admin.auto_orders.index') }}" class="btn btn-sm btn-default"><i class="fa fa-list"></i> List</a>
      </div>
    </div>
  </div>
  <div class="box-body">
    <table class="table table-bordered">
      <tbody>
      <tr>
        <td>User:</td>
        <td>{{ $auto_order->user->name }}</td>
        <td>Start Date:</td>
        <td>{{ $auto_order->start_date->format('Y-m-d H:i:s') }}</td>
      </tr>
      <tr>
        <td>Insurance Type:</td>
        <td>{{ $auto_order->auto_policy->insurance->title }}</td>
        <td>Ende Date:</td>
        <td>{{ $auto_order->end_date->format('Y-m-d H:i:s') }}</td>
      </tr>
      <tr>
        <td>Payment Method:</td>
        <td>{{ $auto_order->payment_method }}</td>
        <td>Order Amount:</td>
        <td>$ {{ $auto_order->auto_policy->insurance->price * $auto_order->auto_policy->amount }}</td>
      </tr>
      <tr>
        <td rowspan="2">Auto Details</td>
        <td>VIN:</td>
        <td>Model Make Year:</td>
        <td>Vehicle Status:</td>
      </tr>
      <tr>
        <td>{{ $auto_order->auto_policy->vin }}</td>
        <td>{{ $auto_order->auto_policy->make_year }}</td>
        <td>{{ $auto_order->auto_policy->status }}</td>
      </tr>
      <tr>
        <td>Insurance Status:</td>
        <td>{{ $auto_order->order_status }}</td>
        @if($auto_order->order_status === \App\Models\AutoOrder::ORDER_STATUS_CURRENT)
          <td colspan="4">
            <form action="{{ route('admin.auto_orders.expire', [$auto_order->id]) }}" method="post" class="form-inline">
              <!-- 别忘了 csrf token 字段 -->
              {{ csrf_field() }}
              <div class="form-group ">
                <input type="hidden"  name="updated_at" value=<?php echo date("Y-m-d"); ?> class="form-control">
              </div>
              <button type="submit" class="btn btn-success">EXPIRE</button>
            </form>
          </td>
        @endif
      </tr>
      </tbody>
    </table>
  </div>
</div>
