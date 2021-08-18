class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(sales_status:0)
    @genres = Genre.all

  end

  def show
    @product = Product.find(params[:id])
    @genres = Genre.all
  end

  def search
    @products = Product.where(" genre_id = ? and sales_status = ? ", params[:id], 0 )
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    render :index
  end
  
end
