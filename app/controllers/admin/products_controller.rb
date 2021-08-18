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
    if @product.update(product_params)
       redirect_to admin_product_path(@product.id)
    else
     render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to  admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:genre_id, :name, :introduction, :image, :price, :sales_status)
  end

end
