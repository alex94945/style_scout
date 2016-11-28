class SettingsController < ApplicationController

before_action :authenticate_admin

  def index
    @categories = Category.all
  end

  private
    def authenticate_admin
      redirect_to root_path unless current_user.administrator?
    end

end