class CategoriesController < ApplicationController

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    @category.update(name:params["category"]["name"] )
    redirect_to settings_path
  end

end