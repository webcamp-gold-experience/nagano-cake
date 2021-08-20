class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!

  def new
    @order = Order.new
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if @order.invalid?
     render :new
    end
  end

  def create
    Order.create!(order_params)
    render :thanks
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
