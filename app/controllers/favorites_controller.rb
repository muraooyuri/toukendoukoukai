class FavoritesController < ApplicationController
  
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
