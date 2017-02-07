class BudgetsController < ApplicationController

  def new
    @budget = Budget.new
  end

  def index
    @budgets = current_user.budgets.all
  end

  def create
    @budget = current_user.budgets.create(budget_params)

    if @budget.valid?
      flash[:success] = "New Budget Created"
    else
      flash[:error] = @budget.errors.full_messages
    end
    redirect_to budgets_path
  end

  def edit
    @budget = current_user.budgets.find(params[:id])
  end

  def update
    @budget = current_user.budgets.find(params[:id])
    @budget.update(budget_params)
    redirect_to budgets_path
  end

  def destroy
    @budget = current_user.budgets.find(params[:id])
    @budget.destroy
    redirect_to budgets_path
  end

  private
    def budget_params
      params.require(:budget).permit(:year, :value, :merch_month)
    end

end