class DashboardBaseService

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params[:merch_month], :start, MerchCalendar::MerchWeek.from_date(Date.current).start_of_month)
    @end_date = format_date(params[:merch_month], :end, Date.today)
  end

  protected
  
    def format_date(value, period, default)
      return default unless value.present?

      MerchCalendar.send("#{period}_of_month", 2016, merch_month: value.to_i)
    end

end