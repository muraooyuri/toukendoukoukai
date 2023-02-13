class CategoriesController < 
  
  def index
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    @category.save
  end
  
  
  private

  def category_params
    params.require(:category).permit(:name)
  end

end