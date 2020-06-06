@extends('layouts.app')
@section('title', $insurance->title)

@section('content')
<div class="row">
<div class="col-lg-10 offset-lg-1">
<div class="card">
  <div class="card-body insurance-info">
    <div class="row">
      <div class="col-7">
        <div class="title">{{ $insurance->title }}</div>
        <div class="price"><label>Price</label><em>$</em><span>{{ $insurance->price }}</span></div>
        <!-- <div class="skus">
          <label>Value</label>
          <div class="btn-group btn-group-toggle" data-toggle="buttons">
            @foreach($insurance->home_skus as $sku)
              <label class="btn sku-btn" title="{{ $sku->value }}">
                <input type="radio" name="skus" autocomplete="off" value="{{ $sku->id }}"> {{ $sku->value }}
              </label>
            @endforeach
          </div>
        </div> -->
        <form class="form-horizontal" role="form" action="{{ route('home_policy.add') }}" method="post">
          @csrf
          <div class="insurance_id"><label>Insurance ID</label><input type="text" class="form-control form-control-sm" value={{ $insurance->id }}><br></div>
{{--          <div class="area"><label>Area</label><input type="text" class="form-control form-control-sm" value="{{ old('area', $homePlicy->area) }}"><br></div>--}}
            <div class="area"><label>Area</label><input type="text" class="form-control form-control-sm" value=""><br></div>
          <div class="date"><label>Purchase date</label><input type="text" class="form-control form-control-sm" value=""><br></div>
          <div class="value"><label>Purchase value</label><input type="text" class="form-control form-control-sm" value=""><br></div>
          <div class="type"><label>Home type</label><input type="text" class="form-control form-control-sm" value=""><br></div>
          <div class="fire_notification"><label>Auto fire notification(Yes:1 / No: 0)</label><input type="text" class="form-control form-control-sm" value="0"><br></div>
          <div class="security_system"><label>Home security system(Yes:1 / No: 0)</label><input type="text" class="form-control form-control-sm" value="0"><br></div>
          <div class="swimming_pool"><label>Swimming pool</label><input type="text" class="form-control form-control-sm" value="N"><br></div>
          <div class="basement"><label>Basement(Yes:1 / No: 0)</label><input type="text" class="form-control form-control-sm" value="0"><br></div>
          <div class="amount"><label>Amount</label><input type="text" class="form-control form-control-sm" value="1"><br></div>
          <div class="buttons">
            <!-- <button class="btn btn-success btn-favor">❤ 收藏</button> -->
{{--            <button class="btn btn-primary btn-add-to-cart">Purchase</button>--}}
              <button type="submit" class="btn btn-primary">Purchase</button>
          </div>
          <!-- </div> -->
        </form>
    </div>
  </div>
</div>
</div>
</div>
@endsection

<!-- @section('scriptsAfterJs')
<script>
  $(document).ready(function () {
    // 加入购物车按钮点击事件
    $('.btn-add-to-cart').click(function () {

      // 请求加入购物车接口
      axios.post('{{ route('home_policy.add') }}', {
        insurance_id: $({$insurance->id}).val(),
        area: $('.area input').val(),
        purchase_date: $('.date input').val(),
        purchase_value: $('.value input').val(),
        home_type: $('.type input').val(),
        fire_notification: $('.fire_notification input').val(),
        security_system: $('.security_system input').val(),
        swimming_pool: $('.swimming_pool input').val(),
        basement: $('.basement input').val(),
        amount: $('.amount input').val(),
      })
        .then(function () { // 请求成功执行此回调
          swal('加入购物车成功', '', 'success');
        }, function (error) { // 请求失败执行此回调
          if (error.response.status === 401) {

            // http 状态码为 401 代表用户未登陆
            swal('请先登录', '', 'error');

          } else if (error.response.status === 422) {

            // http 状态码为 422 代表用户输入校验失败
            var html = '<div>';
            _.each(error.response.data.errors, function (errors) {
              _.each(errors, function (error) {
                html += error+'<br>';
              })
            });
            html += '</div>';
            swal({content: $(html)[0], icon: 'error'})
          } else {

            // 其他情况应该是系统挂了
            swal('系统错误', '', 'error');
          }
        })
    });

  }); -->
