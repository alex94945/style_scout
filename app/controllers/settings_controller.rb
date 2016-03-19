class SettingsController < ApplicationController

  def index
    @categories = Category.all
  end

end