class Public::CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
  end
  
  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_prodcut.customer_id = current_customer.id
    if @cart_prodcut.save
      redirect_to cart_products_path
    end  
  end

  def update
  end

  def destroy
  end
  
  def destroy_all
  end
  
  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :amount)
  end
end
