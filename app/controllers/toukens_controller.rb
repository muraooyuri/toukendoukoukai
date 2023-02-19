class ToukensController < ApplicationController
  #新規登録orログインしていないユーザーに観覧等制限をかける
  before_action :authenticate_user!

  before_action :check_guest_user, only: [:new, :create, :edit, :update, :destroy]

  def new
    @touken = Touken.new
    @genres = Genre.all
  end

  def create
    @touken = Touken.new(touken_params)
    @touken.user_id = current_user.id
    @genres = Genre.all
    if @touken.save
      flash[:notice] = "投稿が完了しました"
      redirect_to toukens_path(@touken)
    else
      @toukens = Touken.all
      @user = current_user
      render :new
    end
  end

  def index
    @toukens = Touken.search(params[:keyword])
    @user = current_user
    @genres = Genre.all
  end

  def show
    @touken = Touken.find(params[:id])
    @touken_comment = ToukenComment.new
    @touken_comments = @touken.id
    @touken_new = Touken.new
    @user = @touken.user
    @genres = Genre.all
  end

  def edit
    @touken = Touken.find(params[:id])
    if @touken.user != current_user
     redirect_to toukens_path
    end
  end

  def destroy
    @touken = Touken.find(params[:id])
    @touken.destroy
    redirect_to '/toukens'
  end

  def update
    @touken = Touken.find(params[:id])
    if @touken.update(touken_params)
     flash[:notice] = "編集が成功しました"
     redirect_to touken_path(@touken)
    else
     render :edit
    end
  end

  private

  def touken_params
    params.require(:touken).permit(:title, :body, :image, :genre_id)
  end

  def check_guest_user
    redirect_to root_path, notice: 'ゲストユーザーは見ることができません。' if current_user.email == 'guest@example.com'
  end
end
