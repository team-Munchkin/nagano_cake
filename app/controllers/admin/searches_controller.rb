class Admin::SearchesController < ApplicationController
  before_action :authenticate_admin!

  def index
    @keyword = search_params[:keyword]
    @items = Item.search(search_params[:keyword])
    @search_items = @items.page(params[:page]).per(20)
  end

  protected

  def search_params
    params.permit(:keyword)
  end
end
