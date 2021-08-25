class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    @order_product = OrderProduct.find(params[:id])
    @order_product.update(order_product_params)
    @order = @order_product.order
    @order_products = @order.order_products
    @status = @order_products.pluck(:production_status)
    if @order_product.production_status == "during_production"
      @order.order_status = "in_production"
      @order.save
    elsif @status.all?{|status|status == "production_completed"}
      @order.order_status = "preparing_delivery"
      @order.save
    end
    redirect_to request.referer
  end

  private

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
