@extends('layouts.app')
@section('title', 'Home Order List')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card panel-default">
                <div class="card-header">Home Order List</div>
                <div class="card-body">
                    <table class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <!-- <th>Order ID</th> -->
                            <th>Insurance Type</th>
                            <th>Start Date</th>
                            <th>End Date</th>
                            <th>Payment Method</th>
                            <th>Price</th>
                            <th>Order Status</th>
                        </tr>
                        </thead>
                        <tbody>
                        @foreach($home_order as $homeorder)
                            <tr>
                                <?php
                                  $insurance_id = $homeorder->home_policy()->value('insurance_id');
                                ?>
                                <!-- <td>{{ $homeorder->id }}</td> -->
                                <td>{{ App\Models\Insurance::where('id', $insurance_id)->value('title') }}</td>
                                <td>{{ $homeorder->start_date }}</td>
                                <td>{{ $homeorder->end_date }}</td>
                                <td>{{ $homeorder->payment_method }}</td>
                                <td>{{ App\Models\Insurance::where('id', $insurance_id)->value('price') * $homeorder->home_policy()->value('amount') }}</td>
                                <td>{{ $homeorder->order_status }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
