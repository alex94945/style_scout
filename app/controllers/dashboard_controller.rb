class DashboardController < ApplicationController

  def show
    @dashboard_stats = DashboardStatsService.new(params, current_user).perform
    @budget = BudgetService.new(params, current_user).perform
    @reminders = current_user.reminders.paginate(page: params[:page], per_page: 5)
  end

end