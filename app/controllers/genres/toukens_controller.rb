class Genres::ToukensController < ApplicationController
  #新規登録orログインしていないユーザーに観覧等の制限をかける
  before_action :authenticate_user!

  def index
     @genre = Genre.find(params[:genre_id])
  end
end
