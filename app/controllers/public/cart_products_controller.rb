class Public::CartProductsController < ApplicationController
  def index
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end

  def create
    @cart_product = CartProduct.new(cart_product_params)
    @cart_products = CartProduct.where(customer_id: current_customer.id)
    @cart_products.each do |cart_product|
      if cart_product.product_id == @cart_product.product_id
        new_amount = cart_product.amount + @cart_product.amount
        cart_product.update_attribute(:amount, new_amount)
        @cart_product.delete
      end
    end
    @cart_product.save
    redirect_to cart_products_path
  end

  def update
    @cart_product = CartProduct.find(params[:id])
    if @cart_product.update(cart_product_params)
      redirect_to cart_products_path
    end
  end

  def destroy
    cart_product = CartProduct.find(params[:id])
    cart_product.destroy
    redirect_to cart_products_path
    flash[:notice_destroy] = "Cart prodcut was successfully destroyed."
  end

  def destroy_all
    cart_products = CartProduct.where(customer_id: current_customer.id)
    cart_products.destroy_all
    redirect_to cart_products_path
    flash[:notice_destroy] = "Cart prodcuts were successfully destroyed."
  end

  private
  def cart_product_params
    params.require(:cart_product).permit(:product_id, :customer_id, :amount)
  end
end