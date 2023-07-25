class Public::GenresController < ApplicationController
before_action :authenticate_customer!
  def show
    @genres = Genre.all
    @genre = Genre.find(params[:id])
    @genre_pages = @genre.items.page(params[:page])
  end
end
