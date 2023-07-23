class Public::HomesController < ApplicationController
  
  def top
    @genres = Genre.all
    @newest_items = Item.order(created_at: :desc).limit(4)
  end
  
  def about
    
  end
end
