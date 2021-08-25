class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!

  def new
    @order = Order.new
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end

  def confirm
    @order = Order.new(order_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if params[:order][:address_option] == "0"
      @order.delivery_postal_code = current_customer.postal_code
      @order.delivery_address = current_customer.address
      @order.delivery_name = current_customer.last_name + current_customer.first_name
    elsif params[:order][:address_option] == "1"
      @selected_address = Address.find(params[:order][:address_id])
      @order.delivery_postal_code =  @selected_address.postal_code
      @order.delivery_address =  @selected_address.address
      @order.delivery_name =  @selected_address.name
    elsif params[:order][:address_option] == "2"
      @order.delivery_postal_code = params[:order][:delivery_postal_code]
      @order.delivery_address = params[:order][:delivery_address]
      @order.delivery_name = params[:order][:delivery_name]
      if @order.delivery_postal_code.empty? || @order.delivery_address.empty? || @order.delivery_name.empty?
        redirect_to new_order_path
      end
    end
  end

  def create
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    if @order = Order.create!(order_params)
      @cart_products.each do |cart_product|
        OrderProduct.create!(
          order_id: @order.id,
          product_id: cart_product.product_id,
          tax_price: cart_product.product.include_tax,
          amount: cart_product.amount,
          production_status: 0
        )
      end
      render :thanks
      cart_products = CartProduct.where(customer_id: current_customer.id)
      cart_products.destroy_all
    end
  end

  def thanks
  end

  def index
    @orders = Order.where(customer_id: current_customer.id)
  end

  def show
    @order = Order.find(params[:id])
    @order_products = OrderProduct.where(order_id: params[:id])
  end

  def authenticate_customer
    @customer != current_customer
  end

  private

  def order_params
    params.require(:order).permit(:customer_id, :delivery_postal_code, :delivery_address, :delivery_name, :delivery_fee, :total_payment, :order_status, :payment_method)
  end
end
