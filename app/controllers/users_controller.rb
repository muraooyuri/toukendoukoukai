class UsersController < ApplicationController
  # 【新規登録済orログイン済】のユーザーのみにアクセスを許可する(この記述はとても重要、必ず記述する様にする)
  before_action :authenticate_user!
  # ゲストログイン、またゲストはユーザ情報等の【編集ページに飛べない様】に【更新出来ない様】にする
  before_action :check_guest_user, only: [:edit, :update]

  def index
    # 【投稿したユーザー】と紐付けられているものを検索結果として表示させる
    if params[:range] == "Touken"
      redirect_to toukens_path(keyword: params[:keyword])
    end
    @users = User.search(params[:keyword])
    @touken = Touken.new
    @user = current_user
    # ジャンル機能を適用させて表示する箇所全てに記述
    @genres = Genre.all
  end

  def show
    @user = User.find(params[:id])
    @touken = Touken.new
    @toukens= @user.toukens
    # ジャンル機能を適用させて表示する箇所全てに記述
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
        # 更新後に飛ぶビュー画面(userのedit)、更新後に表示されるメッセージ(notice:'...')
        redirect_to edit_user_path(current_user), notice: 'プロフィールの更新に成功しました。'
      else
        render :edit
      end
    else
      # パスワード変更を含む
      if @user.update(user_with_password_params)
        # 変更後に飛ぶビュー画面(homesのtop)、変更後に表示されるメッセージ(notice:'...')
        redirect_to root_path, notice: 'パスワードが変更されたのでログアウトしました。'
      else
        render :edit
      end
    end
  end


  private

    def user_params
      # require(:オブジェクト名).permit【変更を加えられる、保存の処理ができる】(キーを指定)
      params.require(:user).permit(:name, :introduction)
    end
  
    def user_with_password_params
      # require(:オブジェクト名).permit【変更を加えられる、保存の処理ができる】(キーを指定)
      params.require(:user).permit(:name, :introduction, :password)
    end
  
    # ゲストログインしている場合、観覧出来るページを制限する記述
    def check_guest_user
      redirect_to root_path, notice: 'ゲストユーザーは見ることができません。' if current_user.email == 'guest@example.com'
    end
end