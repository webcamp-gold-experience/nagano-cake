class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(sales_status:0).page(params[:page]).per(4)
    @genres = Genre.all

  end

  def show
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    @genres = Genre.all
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end

  def search
    @products = Product.where(genre_id: params[:id], sales_status: 0)
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

end
