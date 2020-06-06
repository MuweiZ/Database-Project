@extends('layouts.app')
@section('title', ' Home Orders')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-lg-1">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">
                        Pay for a Home Policy
                    </h2>
                </div>
                <div class="card-body">
                    <!-- 输出后端报错开始 -->
                    @if (count($errors) > 0)
                        <div class="alert alert-danger">
                            <h4>Error:</h4>
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li><i class="glyphicon glyphicon-remove"></i> {{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                    <!-- 输出后端报错结束 -->
                    <!-- inline-template 代表通过内联方式引入组件 -->


                        <form class="form-horizontal" role="form" action="{{ route('home_order.store') }}" method="post">
                            {{ csrf_field() }}
                        <?php
                          $id = $_REQUEST['home_policy'];
                          $price = App\Models\Insurance::where('id', App\Models\HomePolicy::where('id', $id)->value('insurance_id'))->value('price');
                          $amount = App\Models\HomePolicy::where('id', $id)->value('amount');

                        ?>
                        <!-- $price = App\Models\HomePolicy::where('id', $id)->insurance()->value('price');
                        $amount = App\Models\HomePolicy::where('id', $id)->value('amount'); -->
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3">Insurance Type</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-left col-sm-4"> {{ App\Models\Insurance::where('id', App\Models\HomePolicy::where('id', $id)->value('insurance_id'))->value('title') }} </label>
                                <input type="hidden" class="form-control" name="home_policy_id" value={{$id}}>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3">Price</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-left col-sm-3"> {{ $price * $amount }} </label>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3">Start Date</label>
                            <div class="col-sm-8">
                                <input type="text" readonly class="form-control-plaintext" name="start_date" value= <?php echo $start_date = date("Y-m-d"); ?> >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3">End Date</label>
                            <div class="col-sm-8">
                              <input type="text" readonly class="form-control-plaintext" name="end_date" value=<?php echo $end_date = date("Y-m-d",strtotime('+'.$amount.'year')); ?> >
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Payment Method</label>
                            <div class="col-sm-8">
                                <select  class="form-control" name="payment_method">
                                  <option vlue = "PayPal">PayPal</option>
                                  <option vlue = "Credit">Credit</option>
                                  <option vlue = "Debit">Debit</option>
                                  <option vlue = "Check">Check</option>
                                </select>
                            </div>
                        </div>

                        <div class="form-group row text-center">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">{{ 'Pay' }}</button>
                            </div>
                        </div>
                    </form>
{{--                    </user-addresses-create-and-edit>--}}
                </div>
            </div>
        </div>
    </div>
@endsection
