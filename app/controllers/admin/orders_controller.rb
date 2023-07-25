class Admin::OrdersController < ApplicationController
  def show
    @order_items = OrderItem.where(order_id: params[:id])
    @order = Order.find(params[:id])
  end


 def update
  @order = Order.find(params[:id])
  @order_items = OrderItem.where(order_id: params[:id])
  if @order.update(order_params)
    @order_items.update_all(production_status: 1) if @order.status == "pay_confirming"
  end
  redirect_to admin_order_path(@order)
 end

 private
 def order_params
  params.require(:order).permit(:status)
 end

end
