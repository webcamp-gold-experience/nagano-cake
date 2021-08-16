class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.genre_id = 1
    if @product.save
      redirect_to admin_product_path(@product.id)
    else
      render :new
    end

  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product = Product.update(update_product)
       @product.update(genre_id:1)
       admin_product_path(@product)
    else
     render :edit
    end
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :image, :price, :sales_status)
  end
  def update_product
    params.require(:product).permit(:name, :introduction, :image, :price, :sales_status)
  end
end
