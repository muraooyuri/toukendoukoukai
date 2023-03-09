class UsersController < ApplicationController
  # 【ログイン済】のユーザーのみにアクセスを許可する(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!
  # ゲストログイン、またゲストは編集ページに飛べない様に更新出来ない様にする
  before_action :check_guest_user, only: [:edit, :update]

  def index
    if params[:range] == "Touken"
      redirect_to toukens_path(keyword: params[:keyword])
    end
    @users = User.search(params[:keyword])
    @touken = Touken.new
    @user = current_user
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @touken = Touken.new
    @toukens= @user.toukens
    @genres = Genre.all
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])

    # パスワード入力欄にパスワードが入っていなければ…
    if params[:user][:password].blank?
      # プロフィール編集のみ
      if @user.update(user_params)
        redirect_to edit_user_path(current_user), notice: 'プロフィールの更新に成功しました。'
      else
        render :edit
      end
    else
      # パスワード変更を含む
      if @user.update(user_with_password_params)
        redirect_to root_path, notice: 'パスワードが変更されたのでログアウトしました。'
      else
        render :edit
      end
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction)
  end

  def user_with_password_params
    params.require(:user).permit(:name, :introduction, :password)
  end

  # ゲストログインしている場合、観覧出来るページを制限する記述
  def check_guest_user
    redirect_to root_path, notice: 'ゲストユーザーは見ることができません。' if current_user.email == 'guest@example.com'
  end
end