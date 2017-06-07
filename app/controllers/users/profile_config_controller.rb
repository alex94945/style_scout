class Users::ProfileConfigController < ApplicationController

  def update
    current_user.profile_config.update(profile_config_params)
    redirect_to settings_path
  end

private
    def profile_config_params
      params.require(:profile_config).permit(:default_home_my_appointments, :navbar_color)
    end

end
