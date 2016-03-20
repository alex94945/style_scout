class CategoriesController < ApplicationController

  def new
    @category = Category.new
  end

  def create
    Category.create(category_params)
    redirect_to settings_path
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update( name:params["category"]["name"] )
    redirect_to settings_path
  end

  private
    def category_params
      params.require(:category).permit(:name)
    end

end