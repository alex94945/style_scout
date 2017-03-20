class BudgetService < DashboardBaseService

  def perform
    {
      current_budget_id: budget.try(:id),
      total: total,
      budget: budget,
      pending: pending,
      placed: placed,
      open: open
    }
  end


  def total
    budget.try(:value) || 0
  end

  def pending
    quantity_times_cost(styles, :incomplete)
  end

  def placed
    quantity_times_cost(styles, :placed)
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

  def budget
    @budget ||= @user.budgets.for_current_period(@params)
  end

  private
    def quantity_times_cost(styles, field)
      return 0 if styles.empty?
      styles = styles.send(field)
      cost_array = styles.map(&:wholesale_or_negotiated_cost)
      qty_array = styles.map(&:quantity)
      sum_product, i, size = 0, 0, cost_array.size
      while i < size
        sum_product += cost_array[i] * qty_array[i]
        i += 1
      end
      return sum_product
    end


end
