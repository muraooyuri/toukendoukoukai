class GenresController < ApplicationController
  #新規登録orログインしていないユーザーに観覧等の制限をかける
  before_action :authenticate_user!

  def _sidebar
    @genres = Genre.all
  end
end
