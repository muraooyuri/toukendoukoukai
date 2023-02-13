class GenresController < ApplicationController
  
  def _sidebar
    @genres = Genre.all
  end
end
