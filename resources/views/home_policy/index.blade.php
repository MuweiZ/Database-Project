@extends('layouts.app')
@section('title', 'Home Policy List')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card panel-default">
                <div class="card-header">Home Policy List</div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Ins. Type</th>
                            <th>Area</th>
                            <th>Pur. Date</th>
                            <th>Pur. Value</th>
                            <th>Home Type</th>
                            <th>Fire Noti.</th>
                            <th>Security System</th>
                            <th>Swim. Pool</th>
                            <th>Base- ment</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($home_policy as $homepolicy)
                            <tr>
                                <td>{{ $homepolicy->insurance()->value('title') }}</td>
                                <td>{{ $homepolicy->area }}</td>
                                <td>{{ $homepolicy->purchase_date }}</td>
                                <td>{{ $homepolicy->purchase_value }}</td>
                                <td>{{ $homepolicy->home_type }}</td>
                                <td>{{ $homepolicy->fire_notification == '0'? 'No':'Yes' }}</td>
                                <td>{{ $homepolicy->security_system == '0'? 'No':'Yes'}}</td>
                                <td>{{ $homepolicy->swimming_pool == null? 'None':$homepolicy->swimming_pool }}</td>
                                <td>{{ $homepolicy->basement == '0'? 'No':'Yes'}}</td>
                                <td>{{ $homepolicy->amount }}</td>
                                <td>{{ $homepolicy->insurance()->value('price') * $homepolicy->amount}}</td>
                                <td>
                                  @if($homepolicy->home_order()->value('id'))
                                  <a href="{{ route('home_order.index') }}" class="btn btn-primary">View</a>
                                  @else
                                    <a href="{{ route('home_policy.edit', ['home_policy' => $homepolicy->id]) }}" class="btn btn-primary">Edit</a>
                                    <form action="{{ route('home_policy.destroy', ['home_policy' => $homepolicy->id]) }}" method="post" style="display: inline-block">
                                        {{ csrf_field() }}
                                        {{ method_field('DELETE') }}
                                        <button class="btn btn-danger" type="submit">Delete</button>
                                    </form>
                                    <!-- <button class="btn btn-primary">Pay</button> -->
                                    <a href="{{ route('home_order.create', ['home_policy' => $homepolicy->id]) }}" class="btn btn-primary">Pay</a>
                                  @endif
                                </td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
