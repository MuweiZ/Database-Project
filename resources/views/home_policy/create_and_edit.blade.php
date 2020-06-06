@extends('layouts.app')
@section('title', ($home_policy->id ? 'Edit': 'Purchase') . ' Home Policy')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-lg-1">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">
                        {{ $home_policy->id ? 'Edit': 'Purchase' }} Home Policy
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
                      @if($home_policy->id)
                        <form class="form-horizontal" role="form" action="{{ route('home_policy.update', ['home_policy' => $home_policy->id]) }}" method="post">
                            {{ method_field('PUT') }}
                      @else
                        <form class="form-horizontal" role="form" action="{{ route('home_policy.store') }}" method="post">
                      @endif
                            {{ csrf_field() }}
                      @if($home_policy->id)
                      @else
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Insurance Type</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-left col-sm-6"><font size = "4"> <?php $id = $_REQUEST['insurance'] ?> {{ App\Models\Insurance::where('id', $id)->value('title') }}</font></label>
                                <input type="hidden" class="form-control" name="insurance_id" value={{$id}}>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Insurance Price</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-right col-sm-3"><font size = "4"> {{ App\Models\Insurance::where('id', $id)->value('price') }} / year</font></label>
                            </div>
                        </div>
                      @endif
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font> Area </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="area" value="{{ old('area', $home_policy->area) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font> Purchase Date (Y-M-D) </label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="purchase_date" value="{{ old('purchase_date', $home_policy->purchase_date) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Purchase Value</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="purchase_value" value="{{ old('purchase_value', $home_policy->purchase_value) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Home Type (S/M/C/T)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="home_type" value="{{ old('home_type', $home_policy->home_type) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Fire Notification (0/1)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="fire_notification" value="{{ old('fire_notification', $home_policy->fire_notification) == '0' || old('fire_notification', $home_policy->fire_notification) == null? '0':'1' }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Security System (0/1)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="security_system" value="{{ old('security_system', $home_policy->security_system) == '0' || old('fire_notification', $home_policy->fire_notification) == null? '0':'1' }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3">Swimming Pool (U/O/I/M/empty)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="swimming_pool" value="{{ old('swimming_pool', $home_policy->swimming_pool) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Basement (0/1)</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="basement" value="{{ old('basement', $home_policy->basement) == '0' || old('fire_notification', $home_policy->fire_notification) == null? '0':'1' }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Amount</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="amount" value="{{ old('amount', $home_policy->amount)?? '1' }}">
                            </div>
                        </div>

                        <div class="form-group row text-center">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">{{ $home_policy->id ? 'Edit': 'Purchase' }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
