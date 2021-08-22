class Public::ProductsController < ApplicationController
  def index
    @products = Product.where(sales_status:0)
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

  def search_all

    @word = params[:word]
    @genre = Genre.where(name: @word)
    if @word == ""
      @products = Product.all
      @genres = Genre.all
    elsif @genre.present?
      @genres = Genre.all
      @products = Product.where(genre_id: @genre.ids)
    else
      @products = []
      @word.split(/[[:blank:]]+/).each do |keyword|
      next if keyword == ""
      @products += Product.where('name LIKE ?', "%#{keyword}%")
      end
      @products.uniq!
      @genres = Genre.all
    end
  end
end
