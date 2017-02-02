class DashboardBaseService

  attr_reader :start_date, :end_date

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params, :start, MerchCalendar::MerchWeek.from_date(Date.current).start_of_month)
    @end_date = format_date(params, :end, MerchCalendar::MerchWeek.from_date(Date.current).end_of_month)
    @params = params
  end

  protected

    def format_date(params, period, default)
      return default unless params[:merch_month].present? && params[:merch_year].present?

      MerchCalendar.send("#{period}_of_month", params[:merch_year].to_i, merch_month: params[:merch_month].to_i)
    end

end
