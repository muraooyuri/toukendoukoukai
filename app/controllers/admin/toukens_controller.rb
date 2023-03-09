class Admin::ToukensController < ApplicationController
  # ログイン済の【管理者】のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @toukens = Touken.all
  end

  def destroy
    # 不適切な【投稿内容】を削除
    @touken = Touken.find(params[:id])
    @touken.destroy
    redirect_to '/admin/toukens'
  end


  private

   def touken_params
     params.require(:touken).permit(:title, :body, :image, :genre_id)
   end
end
