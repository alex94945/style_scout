class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :check_payment_status
  helper_method :current_company

  protected

    def check_payment_status
      return unless current_user #nobody is logged in
      redirect_to new_charge_path and return unless (current_user.payment_account.try(:active?) || current_user.payment_account.try(:trial_period_active?))
    end

    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name])
    end

    def current_company
      @current_company ||=  current_user.company
    end
end


