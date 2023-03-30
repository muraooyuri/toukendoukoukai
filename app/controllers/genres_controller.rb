class GenresController < ApplicationController
  # 【新規登録済orログイン済】していないユーザーに観覧等の制限をかける(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!

  def _sidebar
    # ジャンル機能を適用させて表示する箇所全てに記述
    @genres = Genre.all
  end
end
