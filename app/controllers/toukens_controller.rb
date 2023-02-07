class ToukensController < ApplicationController
  def new
   @touken = Touken.new
  end

  def create
    @touken = Touken.new(touken_params)
    @touken.user_id = current_user.id
    if @touken.save
      flash[:notice] = "入力を忘れていませんか？"
      redirect_to toukens_path(@touken)
    else
      @toukens = Touken.all
      @user = current_user
      render :index
    end
  end

  def index
    @toukens = Touken.all
    #@touken = touken.new
    @user = current_user
  end

  def show
    #@toukens = touken.all
    @touken = Touken.find(params[:id])
  end

  def edit
  end


  private

  def touken_params
    params.require(:touken).permit(:title, :body)
  end
end
