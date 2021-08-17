class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!
  before_action :correct_customer

  def corrent_customer
    @customer = customer.find(params[:id])
    unless @customer.customer.id == current_customer.id
      redirect_to root_path
    end
  end


  def index
    @customers = Customer.all
  end

  def show
  end

  def edit
  end

  def update
  end
end
