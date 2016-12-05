class DashboardStatsService

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params[:start_date], Date.today.beginning_of_month)
    @end_date = format_date(params[:end_date], Date.today)
  end


  def perform
    {
      appointments: appointments,
      current_date_range_budget: 1200,
      styles: styles
    }
  end

  private

    def appointments
      @appointments ||= @user.appointments.where(scout_date: @start_date..@end_date )
    end

    def styles
      Style.where(id: @appointments.pluck(:id))
    end

    def format_date(date, default)
      return default unless date.present?
      Date.parse(date)
    end

end