class Public::HomesController < ApplicationController
  def top
    @products = Product.order(created_at: :desc);
  end

  def about
  end
end
