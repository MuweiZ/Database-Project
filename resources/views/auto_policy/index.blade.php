@extends('layouts.app')
@section('title', 'Auto Policy List')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card panel-default">
                <div class="card-header">Auto Policy List</div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <th>Insurance Type</th>
                            <th>VIN</th>
                            <th>Vehicle Make Year</th>
                            <th>Vehicle Status</th>
                            <th>Amount</th>
                            <th>Price</th>
                            <th>Operation</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($auto_policy as $autopolicy)
                            <tr>
                                <td>{{ $autopolicy->insurance()->value('title') }}</td>
                                <td>{{ $autopolicy->vin }}</td>
                                <td>{{ $autopolicy->make_year }}</td>
                                <td>{{ $autopolicy->status }}</td>
                                <td>{{ $autopolicy->amount }}</td>
                                <td>{{ $autopolicy->insurance()->value('price') * $autopolicy->amount}}</td>
                                <td>
                                  @if($autopolicy->auto_order()->value('id'))
                                  <a href="{{ route('auto_order.index') }}" class="btn btn-primary">View</a>
                                  @else
                                    <a href="{{ route('auto_policy.edit', ['auto_policy' => $autopolicy->id]) }}" class="btn btn-primary">Edit</a>
                                    <form action="{{ route('auto_policy.destroy', ['auto_policy' => $autopolicy->id]) }}" method="post" style="display: inline-block">
                                      {{ csrf_field() }}
                                      {{ method_field('DELETE') }}
                                      <button class="btn btn-danger" type="submit">Delete</button>
                                    </form>
                                    <a href="{{ route('auto_order.create', ['auto_policy' => $autopolicy->id]) }}" class="btn btn-primary">Pay</a>
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
