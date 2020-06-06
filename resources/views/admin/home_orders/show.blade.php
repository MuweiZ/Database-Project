<div class="box box-info">
  <div class="box-header with-border">
    <h3 class="box-title">Order ID: {{ $home_order->id }}</h3>
    <div class="box-tools">
      <div class="btn-group float-right" style="margin-right: 10px">
        <a href="{{ route('admin.home_orders.index') }}" class="btn btn-sm btn-default"><i class="fa fa-list"></i> List</a>
      </div>
    </div>
  </div>
  <div class="box-body">
    <table class="table table-bordered">
      <tbody>
      <tr>
        <td>User:</td>
        <td>{{ $home_order->user->name }}</td>
        <td>Start Date:</td>
        <td>{{ $home_order->start_date->format('Y-m-d H:i:s') }}</td>
      </tr>
      <tr>
        <td>Insurance Type:</td>
        <td>{{ $home_order->home_policy->insurance->title }}</td>
        <td>Ende Date:</td>
        <td>{{ $home_order->end_date->format('Y-m-d H:i:s') }}</td>
      </tr>
      <tr>
        <td>Payment Method:</td>
        <td>{{ $home_order->payment_method }}</td>
        <td>Order Amount:</td>
        <td>$ {{ $home_order->home_policy->insurance->price * $home_order->home_policy->amount }}</td>
      </tr>
      <tr>
        <td rowspan="6">Home Details</td>
        <td>Home Area:</td>
        <td>Purchase Date:</td>
        <td>Purchase Value:</td>
      </tr>
      <tr>
        <td>{{ $home_order->home_policy->area }}</td>
        <td>{{ $home_order->home_policy->purchase_date }}</td>
        <td>{{ $home_order->home_policy->purchase_value }}</td>
      </tr>
      <tr>
        <td>Home Type:</td>
        <td>Fire Notification:</td>
        <td>Security System:</td>
      </tr>
      <tr>
        <td>{{ $home_order->home_policy->home_type }}</td>
        <td>{{ $home_order->home_policy->fire_notification == '0'? 'No': 'Yes' }}</td>
        <td>{{ $home_order->home_policy->security_system == '0'? 'No': 'Yes' }}</td>
      </tr>
      <tr>
        <td>Swimming Pool:</td>
        <td>Basement:</td>
        <td></td>
      </tr>
      <tr>
        <td>{{ $home_order->home_policy->swimming_pool == null? 'None':$home_order->home_policy->swimming_pool}}</td>
        <td>{{ $home_order->home_policy->basement == '0'? 'No': 'Yes' }}</td>
        <td></td>
      </tr>
      <tr>
        <td>Insurance Status:</td>
        <td>{{ $home_order->order_status }}</td>
        @if($home_order->order_status === \App\Models\HomeOrder::ORDER_STATUS_CURRENT)
          <td colspan="4">
            <form action="{{ route('admin.home_orders.expire', [$home_order->id]) }}" method="post" class="form-inline">
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
