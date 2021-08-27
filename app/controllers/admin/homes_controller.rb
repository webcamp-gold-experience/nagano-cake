class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @orders = Order.all
  end

  def search

    @word = params[:word]
    @range = params[:range]
    @genres = Genre.all

    if @range == "会員"
      if @word == ""
        @customers = Customer.all
      else
        @customers = []
        @word.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @customers += Customer.where('last_name LIKE ? or first_name LIKE ? or last_name_kana LIKE ? or first_name_kana LIKE ?', "%#{keyword}%", "%#{keyword}%", "%#{keyword}%", "%#{keyword}%")
        end
        @customers.uniq!
      end

    elsif @range == "商品"

      if @word == ""
        @products = Product.all
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

    elsif @range == "ジャンル"
      if @word == ""
        @products = Product.all
      else
        @products = []
        @word.split(/[[:blank:]]+/).each do |keyword|
        next if keyword == ""
        @products << Genre.find_by(name: keyword).products
        end
        @products.flatten!
      end 
    end

  end
end


