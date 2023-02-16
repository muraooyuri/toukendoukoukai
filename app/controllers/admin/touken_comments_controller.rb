class Admin::ToukenCommentsController < ApplicationController

  def index
    @touken_comments = ToukenComment.all
  end

  def destroy
    @touken_comment = ToukenComment.destroy(params[:id])
    redirect_to admin_touken_comments_path(@touken)
  end


  def touken_comment_params
     params.require(:touken_comment).permit(:comment)
  end
end
