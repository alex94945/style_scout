class BudgetService < DashboardBaseService

  attr_reader :start_date, :end_date

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params, :beginning, Date.current.beginning_of_month)
    @end_date = format_date(params, :end, Date.current.end_of_month)
    @params = params
  end

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
        .where(styles: {delivery_date: @start_date..@end_date})
  end

  def budget
    @budget ||= @user.budgets.for_current_period(@params)
  end

  protected
    def format_date(params, period, default)
      return default unless params[:merch_month].present? && params[:merch_year].present?
      DateTime.new(params[:merch_year].to_i, params[:merch_month].to_i).send("#{period}_of_month")
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
