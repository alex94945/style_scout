class DashboardController < ApplicationController


  def show
    @dashboard_stats = DashboardStatsService.new(params, current_user).perform
    @budget = BudgetService.new(params, current_user).perform
  end

end