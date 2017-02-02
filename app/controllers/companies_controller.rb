class CompaniesController < ApplicationController

  def update
    @company = current_user.company

    @company.update(company_params)

    redirect_to settings_path
  end

  private
    def company_params
      params.require(:company).permit(:name)
    end

end
