class Admin::OrdersController < ApplicationController
  before_action :authenticate_admin!

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: params[:id])
  end

  def update
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: params[:id])
    @order.update(order_params)
    if @order.order_status == "payment_confirmed"
      @order_products.update_all(production_status: "waiting_for_production")
    end
    redirect_to request.referer
  end

  private


  def order_params
    params.require(:order).permit(:order_status)
  end

end
