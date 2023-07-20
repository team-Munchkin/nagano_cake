class Public::CartItemsController < ApplicationController
  def index
  end
  
  def create
    @cart_item = current_user.cart_items.build(cart_item_params)
    @cart_items = current_user.cart_items.all
  end
  
  
end
