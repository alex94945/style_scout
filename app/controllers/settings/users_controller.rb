class Settings::UsersController < ApplicationController
  def edit
    @user = current_company.users.find(params[:id])
  end

  def update
    return unless current_user.administrator?
    @user = current_company.users.find(params[:id])
    @user.update(user_params)
    redirect_to settings_path
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :administrator)
    end

end