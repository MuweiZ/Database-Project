@extends('layouts.app')
@section('title', ($auto_policy->id ? 'Edit': 'Purchase') . ' Auto Policy')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-lg-1">
            <div class="card">
                <div class="card-header">
                    <h2 class="text-center">
                        {{ $auto_policy->id ? 'Edit': 'Purchase' }} Auto Policy
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

                    @if($auto_policy->id)
                        <form class="form-horizontal" role="form" action="{{ route('auto_policy.update', ['auto_policy' => $auto_policy->id]) }}" method="post">
                            {{ method_field('PUT') }}
                    @else
                        <form class="form-horizontal" role="form" action="{{ route('auto_policy.store') }}" method="post">
                    @endif
                            {{ csrf_field() }}
                        @if($auto_policy->id)
                        @else
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Insurance Type</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-left col-sm-6"><font size = "4"> <?php $id = $_REQUEST['insurance'] ?> {{ App\Models\Insurance::where('id', $id)->value('title') }} </font></label>
                                <input type="hidden" class="form-control" name="insurance_id" value={{$id}}>
                            </div>
                        </div>
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Insurance Price</label>
                            <div class="col-sm-8" align = "left">
                                <label class="col-form-label text-md-right col-sm-3"><font size = "4"> {{ App\Models\Insurance::where('id', $id)->value('price') }} / year</font> </label>
                            </div>
                        </div>
                        @endif
                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>VIN</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="vin" value="{{ old('vin', $auto_policy->vin) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Vehicle Model Make Year</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="make_year" value="{{ old('make_year', $auto_policy->make_year) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Vehicle Status</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="status" value="{{ old('status', $auto_policy->status) }}">
                            </div>
                        </div>

                        <div class="form-group row">
                            <label class="col-form-label text-md-right col-sm-3"><font color = "red"> * </font>Amount</label>
                            <div class="col-sm-8">
                                <input type="text" class="form-control" name="amount" value="{{ old('amount', $auto_policy->amount) }}">
                            </div>
                        </div>

                        <div class="form-group row text-center">
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">{{ $auto_policy->id ? 'Edit': 'Purchase' }}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection
