class Admin::CustomersController < ApplicationController
  def index
    @customers = customer.all
  end

  def show
    @customer = Customer.find(params[])
  end

  def edit
  end

  def update
  end
end
