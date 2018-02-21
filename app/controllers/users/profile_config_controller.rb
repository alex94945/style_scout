class Users::ProfileConfigController < ApplicationController

  def update
    current_user.profile_config.update(profile_config_params)
    redirect_to settings_path
  end

private
    def profile_config_params
      params.require(:profile_config).permit(:default_home_my_product_sets, :navbar_color)
    end

end
