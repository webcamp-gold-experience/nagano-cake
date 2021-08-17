class Public::OrdersController < ApplicationController
  #before_action :authenticate_customer!
  
  def new
  end

  def confirm
  end

  def create
  end

  def thanks
  end

  def index
  end

  def show
  end
  
  def authenticate_customer
    @customer != current_customer
  end
  
end
