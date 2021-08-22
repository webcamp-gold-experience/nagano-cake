class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all.order(created_at: :desc)
    @customers = Customer.all.order(:customer_id)
    #@order_products = OrderProduct.where(order_id: current_customer.id)
  end
end
