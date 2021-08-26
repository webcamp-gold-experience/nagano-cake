class Public::ProductsController < ApplicationController

  before_action :authenticate, only: [:show]



  def index
    @products = Product.where(sales_status:0).page(params[:page]).per(6)
    @genres = Genre.all

  end

  def show
    @cart_product = CartProduct.new
    @product = Product.find(params[:id])
    @genres = Genre.all
    @numbers = 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
  end

  def search
    @products = Product.where(genre_id: params[:id], sales_status: 0).page(params[:page]).per(9)
    @genres = Genre.all
    @genre = Genre.find(params[:id])
  end

  def search_all

    @genres = Genre.all
    @word = params[:word]
     @genre = []
      @word.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @genre += Genre.where(name: keyword)
      end

    if @word == ""
      @products = Product.all.page(params[:page]).per(6)

    elsif
      @genre.present?
      @products = []
      @genre.each do |genre|
      @products << genre.products
      end
      @products.flatten!

    else

      @products = []
      @word.split(/[[:blank:]]+/).each do |keyword|
      next if keyword == ""
        if keyword.match(/[一-龠々]/)
          @products += Product.where('conversion_name LIKE ?', "%#{keyword.to_kanhira.to_roman}%")
        elsif keyword.is_hira? || keyword.is_kana?
          @products += Product.where('conversion_name LIKE ?', "%#{keyword.to_roman}%")
        else
          @products += Product.where('conversion_name LIKE ?', "%#{keyword}%")
        end
      end
      @products.uniq!
    end
  end

  def authenticate
    redirect_to new_customer_registration_url unless customer_signed_in?
  end
end
