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
    @cart_product = CartProduct.find(params[:cart_prodcut_id])
    if @cart_prodcut.save
      redirect_to cart_products_path
    end
  end

  def destroy
    cart_product = CartProduct.find(params[:cart_prodcut_id])
    cart_product.destroy
    redirect_to cart_products_path
    flash[:notice_destroy] = "Cart prodcut was successfully destroyed."
  end

  def destroy_all
    cart_products = CartProduct.where(customer_id: current_customer.id)
    cart_products.destroy
    redirect_to cart_products_path
    flash[:notice_destroy] = "Cart prodcuts were successfully destroyed."
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :amount)
  end
end
