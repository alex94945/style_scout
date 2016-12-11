class DashboardBaseService

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params[:start_date], Date.today.beginning_of_month)
    @end_date = format_date(params[:end_date], Date.today)
  end

  protected
  
    def format_date(date, default)
      return default unless date.present?
      Date.parse(date)
    end

end