module Dashboard
  class BudgetsController < ApplicationController

    def new
      @budget = Budget.new
      @params = params
    end

    def create
      @budget = current_user.budgets.create(budget_params)
      redirect_to root_path(params[:dashboard])
    end

    def edit
      @budget = current_user.budgets.find(params[:id])
    end

    def update
      @budget = current_user.budgets.find(params[:id])
      @budget.update(budget_params)
      redirect_to budgets_path
    end

    private
      def budget_params
        params.require(:budget).permit(:year, :value, :merch_month)
      end
  end
end
