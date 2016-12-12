class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end

  def index
    @budgets = current_user.budgets.all
  end

  def create
    current_user.budgets.create(budget_params)
    redirect_to budgets_path
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
    def budget_params
      params.require(:budget).permit(:year, :value, :merch_month)
    end

end