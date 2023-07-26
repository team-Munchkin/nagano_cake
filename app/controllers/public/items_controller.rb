class Public::ItemsController < ApplicationController

  def index
    @item_all = Item.all
    @items = Item.all.order("created_at DESC").page(params[:page])
    @genres = Genre.all
  end

  def show
    @item = Item.find(params[:id])
    @genres = Genre.all
    @cart_items = CartItem.new
  end

end
