class DashboardController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :render_dashboard_or_welcome, only: :show

  def show
    @dashboard_stats = DashboardStatsService.new(params, current_user).perform
    @budget = BudgetService.new(params, current_user).perform
  end

  private
    def render_dashboard_or_welcome
      render :welcome unless user_signed_in?
    end

end