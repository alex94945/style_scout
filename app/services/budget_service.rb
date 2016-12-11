class BudgetService

  def initialize(params, current_user)
  end

  def perform
    {
      total: total,
      pending: pending,
      placed: placed,
      open: open
    }
  end

  def total
    150000
  end

  def pending
    #styles that are  quantity * wholesale_or_negotiated_cost
    7500
  end

  def placed
    55000
  end

  def open
    #total - (pending + placed)

    25000
  end
end
