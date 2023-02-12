class UsersController < ApplicationController

  def index
    @users = User.all
    @touken = Touken.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @touken = Touken.new
    @toukens= @user.toukens
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end
 
  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end
end