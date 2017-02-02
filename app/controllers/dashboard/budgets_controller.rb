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

    private
      def budget_params
        params.require(:budget).permit(:year, :value, :merch_month)
      end
  end
end
