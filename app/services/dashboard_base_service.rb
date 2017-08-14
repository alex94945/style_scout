class DashboardBaseService

  attr_reader :start_date, :end_date

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params, :beginning, Date.current.beginning_of_month)
    @end_date = format_date(params, :end, Date.current.end_of_month)
    @params = params
  end

  protected

    def format_date(params, period, default)
      return default unless params[:merch_month].present? && params[:merch_year].present?
      DateTime.new(params[:merch_year].to_i, params[:merch_month].to_i).send("#{period}_of_month")
    end

end
