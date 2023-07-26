class Public::SearchesController < ApplicationController

  def index
    @keyword = search_params[:keyword]
    @items = Item.search(search_params[:keyword])
    @search_items_all = @items.all
    @search_items = @items.order("created_at DESC").page(params[:page]).per(12)
  end


  protected

  def search_params
    params.permit(:keyword)
  end


end
