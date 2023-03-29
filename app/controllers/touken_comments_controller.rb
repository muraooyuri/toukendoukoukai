class ToukenCommentsController < ApplicationController
  # 【新規登録済orログイン済】のユーザーのみにアクセスを許可する(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!

  def create
    @touken = Touken.find(params[:touken_id])
    touken_comments = current_user.touken_comments.new(touken_comment_params)
    touken_comments.touken_id = @touken.id
    touken_comments.save
    redirect_to touken_path(@touken)
  end

  def destroy
    @touken = Touken.find(params[:touken_id])
    @touken_comment=ToukenComment.find_by(id: params[:id], touken_id: params[:touken_id])
    @touken_comment.destroy
    redirect_to touken_path(@touken)
  end


  private

    def touken_comment_params
       params.require(:touken_comment).permit(:comment)
    end

end
