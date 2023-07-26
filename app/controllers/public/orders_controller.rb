class Public::OrdersController < ApplicationController
  before_action :authenticate_customer!
  def new
    @order = Order.new
  end

  def confirm
    @order = Order.new(order_params)
    if params[:order][:select_address]== "0"
      @order.post_code = current_customer.post_code
      @order.address = current_customer.address
      @order.post_name = current_customer.family_name + current_customer.first_name
    elsif params[:order][:select_address] == "1"
      @address = Address.find(params[:order][:address_id])
      @order.post_code = @address.post_code
      @order.address = @address.address
      @order.post_name = @address.name
    else params[:order][:select_address] == "2"
      @order.customer = current_customer
    end
    @cart_items = current_customer.cart_items
    if @cart_items  == []
      redirect_to "/items"
    else
      @order_new = Order.new
      render :confirm
    end
  end

  def complete

  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart|
        @order_item = OrderItem.new
        @order_item.item_id = cart.item_id
        @order_item.order_id = @order.id
        @order_item.quantity = cart.quantity
        @order_item.tax_price = cart.item.taxin_price
        @order_item.order_id = @order.id
        @order_item.production_status = 0
        @order_item.save!
      end
      CartItem.destroy_all
      redirect_to '/orders/complete'
    else
      flash[:alert] = "正しい内容を入力してください"
      redirect_to '/orders/new'
    end
  end

  def index
    @orders = current_customer.orders.order("created_at DESC").page(params[:page]).per(3)
  end

  def show
    @order = Order.find(params[:id])
    @order_items = @order.order_items
  end

  private

  def order_params
    params.require(:order).permit(:payment_method, :post_code, :address, :post_name, :postage, :total_price, :customer_id, :status)
  end

  def cartitem_nill
    cart_items = current_customer.cart_items
    if cart_items.blank?
      redirect_to cart_items_path
    end
  end
end

