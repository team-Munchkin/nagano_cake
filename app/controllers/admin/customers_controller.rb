class Admin::CustomersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

 def history
  @customer = Customer.find(params[:id])
  @orders = @customer.orders
 end

  def update
    customer = Customer.find(params[:id])
    if customer.update(customer_params)
      redirect_to admin_customer_path(customer)
    else
      render "edit"
      flash[:alert]
    end
  end

  protected

  def customer_params
    params.require(:customer).permit(:family_name,:first_name,:family_name_kana,
    :first_name_kana,:post_code,:address,:phone_number,:email,:is_deleted)
  end


end

