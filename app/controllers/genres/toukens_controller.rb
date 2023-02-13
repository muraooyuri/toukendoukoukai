class Genres::ToukensController < ApplicationController

  def index
     @genre = Genre.find(params[:genre_id])
  end
end
