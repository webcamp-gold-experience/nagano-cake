class Admin::OrderDetailsController < ApplicationController
  before_action :authenticate_admin!

  def update
    order_product = OrderProduct.find(params[:id])
    order_product.update(order_product_params)
    redirect_to admin_order_path(order_product.order)
  end

  private

  def order_product_params
    params.require(:order_product).permit(:production_status)
  end

end
