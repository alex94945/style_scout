class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  helper_method :current_company

  protected

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:company_name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:company_name])
    end

    def current_company
      @current_company ||=  current_user.company
    end
end


