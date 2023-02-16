class Admin::ToukensController < ApplicationController

  def index
    @toukens = Touken.all
  end

  def destroy
    @touken = Touken.find(params[:id])
    @touken.destroy
    redirect_to '/admin/toukens'
  end


  private

   def touken_params
     params.require(:touken).permit(:title, :body, :image, :genre_id)
   end
end
