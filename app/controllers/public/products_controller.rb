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

    @genres = Genre.all
    @word = params[:word]

    if @word == ""
      @products = Product.all

    elsif

      @products = []
      @word.split(/[[:blank:]]+/).each do |keyword|
      next if keyword == ""
      @products << Genre.find_by(name: keyword).products
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
end
