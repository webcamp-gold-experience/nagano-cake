class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!
  before_action :correct_address, only: [:edit]

  def index
    @address = Address.new
    @addresses = Address.where(customer_id: current_customer.id)
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      redirect_to addresses_path
    else
      @addresses = Address.where(customer_id: current_customer.id)
      render :index
    end
  end

  def edit
    @address = Address.find(params[:id])
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to addresses_path
  end

  def destroy
    address = Address.find(params[:id])
    address.destroy
    redirect_to addresses_path
  end

  def correct_address
    @address = Address.find(params[:id])
    unless @address.customer.id == current_customer.id
      redirect_to addresses_path
    end
  end

  private

  def address_params
    params.require(:address).permit(:address, :postal_code, :name)
  end



end
