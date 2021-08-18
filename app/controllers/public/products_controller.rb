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
    @genre = Genre.find(id: params[:id])
    @products = Product.where(" genre_id = ? and sales_status = ? ", @genre.id, 0 )
    @genres = Genre.all
    render :index
  end
end
