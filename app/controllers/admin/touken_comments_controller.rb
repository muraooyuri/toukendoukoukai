class Admin::ToukenCommentsController < ApplicationController
  # ログイン済の【管理者】のみにアクセスを許可する
  before_action :authenticate_admin!

  def index
    @touken_comments = ToukenComment.all
  end

  def destroy
    # 不適切な【コメント】を削除
    @touken_comment = ToukenComment.destroy(params[:id])
    redirect_to admin_touken_comments_path(@touken)
  end


  def touken_comment_params
     params.require(:touken_comment).permit(:comment)
  end
end
