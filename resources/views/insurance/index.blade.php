@extends('layouts.app')
@section('title', 'Insurance List')

@section('content')
<div class="row">
<div class="col-lg-10 offset-lg-1">
<div class="card">
  <div class="card-body">
    <!-- 筛选组件开始 -->
    <form action="{{ route('insurance.index') }}" class="search-form">
      <div class="form-row">
        <div class="col-md-9">
          <div class="form-row">
            <div class="col-auto"><input type="text" class="form-control form-control-sm" name="search" placeholder="search"></div>
            <div class="col-auto"><button class="btn btn-primary btn-sm">Search</button></div>
          </div>
        </div>
{{--        <div class="col-md-3">--}}
{{--          <select name="order" class="form-control form-control-sm float-right">--}}
{{--            <option value="">Order by</option>--}}
{{--            <option value="price_asc">price from low to high</option>--}}
{{--            <option value="price_desc">price from high to low</option>--}}
{{--          </select>--}}
{{--        </div>--}}
      </div>
    </form>
    <!-- 筛选组件结束 -->

    <div class="row insurance-list">
      @foreach($insurance as $insurance)
        <div class="col-3 insurance-item">
          <div class="insurance-content">
            <div class="top">
              <div class="title">
                <?php if ($insurance->is_home): ?>
                  <a href="{{ route('home_policy.create', ['insurance' => $insurance->id]) }}">{{ $insurance->title }}</a>
                <?php else: ?>
                  <a href="{{ route('auto_policy.create', ['insurance' => $insurance->id]) }}">{{ $insurance->title }}</a>
                <?php endif; ?>
              </div>
                <div class="price"><b>$</b>{{ $insurance->price }}</div>
            </div>
            <div class="bottom">
            </div>
          </div>
        </div>
      @endforeach
    </div>
  </div>
</div>
</div>
</div>

@endsection

@section('scriptsAfterJs')
    <script>
        var filters = {!! json_encode($filters) !!};
        $(document).ready(function () {
            $('.search-form input[name=search]').val(filters.search);
            // $('.search-form select[name=order]').val(filters.order);
        })
    </script>
@endsection
