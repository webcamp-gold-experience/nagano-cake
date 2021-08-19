class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!

  def new
    @order = Order.new
  end

  def confirm
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end

  def authenticate_customer
    @customer != current_customer
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :delivary_postal_code, :delivary_address, :delivary_name, :delivary_fee, :total_payment, :order_status, :payment_method)
  end
end
