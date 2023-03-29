class Genres::ToukensController < ApplicationController
  # 【新規登録済orログイン済】のユーザーのみにアクセスを許可する(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!

  def index
     @genre = Genre.find(params[:genre_id])
  end
end
