class GenresController < ApplicationController
  #新規登録orログインしていないユーザーに観覧等の制限をかける(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!

  def _sidebar
    @genres = Genre.all
  end
end
