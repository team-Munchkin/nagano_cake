class Public::AddressesController < ApplicationController
  def index
    @customer = current_customer
    @addresses = @customer.addresses
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    @address.save
    redirect_to '/addresses'
  end

  def update
    @address = Address.find(params[:id])
    @address.update(address_params)
    redirect_to '/addresses'
  end

  def destroy
    @address = Address.find(params[:id])
    @address.delete
    redirect_to '/addresses'
  end

private

def address_params
  params.require(:address).permit(:post_code, :address, :name)
end
end
