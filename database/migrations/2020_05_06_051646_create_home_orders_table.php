<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHomeOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_orders', function (Blueprint $table) {
          $table->bigIncrements('id');
          $table->unsignedBigInteger('user_id');
          $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
          $table->unsignedBigInteger('home_policy_id');
          $table->foreign('home_policy_id')->references('id')->on('home_policies')->onDelete('cascade');
          $table->dateTime('start_date')->nullable();
          $table->dateTime('end_date')->nullable();
          $table->string('payment_method')->nullable();
          $table->string('order_status')->default(\App\Models\HomeOrder::ORDER_STATUS_CURRENT);
          $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('home_orders');
    }
}
