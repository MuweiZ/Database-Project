@extends('layouts.app')
@section('title', 'Auto Order List')

@section('content')
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card panel-default">
                <div class="card-header">Auto Order List</div>
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
                        @foreach($auto_order as $autoorder)
                            <tr>
                                <?php
                                  $insurance_id = $autoorder->auto_policy()->value('insurance_id');
                                ?>
                                <!-- <td>{{ $autoorder->id }}</td> -->
                                <td>{{ App\Models\Insurance::where('id', $insurance_id)->value('title') }}</td>
                                <td>{{ $autoorder->start_date }}</td>
                                <td>{{ $autoorder->end_date }}</td>
                                <td>{{ $autoorder->payment_method }}</td>
                                <td>{{ App\Models\Insurance::where('id', $insurance_id)->value('price') * $autoorder->auto_policy()->value('amount') }}</td>
                                <td>{{ $autoorder->order_status }}</td>
                            </tr>
                        @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
@endsection
