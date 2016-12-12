class BudgetService < DashboardBaseService

  def perform
    {
      total: total,
      pending: pending,
      placed: placed,
      open: open
    }
  end


    def total
      @user.budgets.for_current_period(@params).try(:value) || 0
    end

    def pending
      styles.incomplete.map(&:wholesale_or_negotiated_cost).sum()
    end

    def placed
      styles.order_placed.map(&:wholesale_or_negotiated_cost).sum()
    end

    def open
      total - (pending + placed)
    end

    def styles
      @styles ||=
        @user
          .styles
          .includes(:appointment)
          .where(appointments: {scout_date: @start_date..@end_date})
    end

end
