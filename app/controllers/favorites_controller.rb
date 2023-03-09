class FavoritesController < ApplicationController
  #新規登録orログインしていないユーザーに観覧等の制限をかける(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!

  def create
    @touken = Touken.find(params[:touken_id])
    favorite = current_user.favorites.new(touken_id: @touken.id)
    favorite.save
    #redirect_to touken_path(touken)
  end

  def destroy
    @touken = Touken.find(params[:touken_id])
    favorite = current_user.favorites.find_by(touken_id: @touken.id)
    favorite.destroy
    #redirect_to touken_path(touken)
  end
end
