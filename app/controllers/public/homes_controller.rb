class Public::HomesController < ApplicationController
  def top
    @products = Product.order(created_at: :desc).limit(8)
    @genres = Genre.all
  end

  def about
  end
end
