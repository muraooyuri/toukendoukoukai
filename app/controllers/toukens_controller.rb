class ToukensController < ApplicationController
  
  def new
   @touken= Touken.new
   @genres = Genre.all
  end

  def create
    @touken= Touken.new(touken_params)
    @touken.user_id= current_user.id
    if @touken.save
      flash[:notice]= "投稿が完了しました"
      redirect_to toukens_path(@touken)
    else
      @toukens= Touken.all
      @user= current_user
      render :index
    end
  end

  def index
    @toukens= Touken.all
    #@touken = Touken.new
    @user= current_user
    @genres = Genre.all
  end

  def show
    #@toukens = Touken.all
    @touken= Touken.find(params[:id])
    @touken_comment = ToukenComment.new
    @touken_comments = @touken.id
    @touken_new= Touken.new
    @user= @touken.user
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
    params.require(:touken).permit(:title, :body, :image, :genre_id, :category_id)
  end
end
