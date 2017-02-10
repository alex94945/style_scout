module Dashboard
  class BudgetsController < ApplicationController

    def new
      @budget = Budget.new
      @params = params
    end

    def create
      @budget = current_user.budgets.create(budget_params)
      redirect_to root_path(budget_params)
    end

    def edit
      @budget = current_user.budgets.find(params[:id])
      @params = params
    end

    def update
      @budget = current_user.budgets.find(params[:id])
      @budget.update(budget_params)
      redirect_to root_path(budget_params)
    end

    private
      def budget_params
        params.require(:budget).permit(:merch_year, :value, :merch_month)
      end
  end
end
