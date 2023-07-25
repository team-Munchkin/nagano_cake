class Public::SearchesController < ApplicationController
before_action :authenticate_customer!
  def index
    @keyword = search_params[:keyword]
    @items = Item.search(search_params[:keyword])
    @search_items_all = @items.all
    @search_items = @items.page(params[:page]).per(12)
  end


  protected

  def search_params
    params.permit(:keyword)
  end


end
