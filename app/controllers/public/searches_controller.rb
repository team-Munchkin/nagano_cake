class Public::SearchesController < ApplicationController

  def index
    @keyword = search_params[:keyword]
    @items = Item.search(search_params[:keyword])
  end


  protected

  def search_params
    params.permit(:keyword)
  end


end
