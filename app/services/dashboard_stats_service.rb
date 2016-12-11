class DashboardStatsService

  def initialize(params, current_user)
    @user = current_user
    @start_date = format_date(params[:start_date], Date.today.beginning_of_month)
    @end_date = format_date(params[:end_date], Date.today)
  end


  def perform
    {
      complete_appointments: complete_appointents,
      incomplete_appointments: incomplete_appointments,
      current_date_range_budget: 1200,
      incomplete_styles: incomplete_styles
    }
  end

  private

    def appointments
      @appointments ||= @user.appointments.includes(:styles).where(scout_date: @start_date..@end_date )
    end

    def complete_appointents
      appointments - incomplete_appointments
    end

    def incomplete_appointments
      appointments.joins(:styles).where(styles: {status: Style::INCOMPLETE_STYLES})
    end

    def incomplete_styles
      Style.includes(:appointment).where(appointment_id: @appointments.pluck(:id).uniq).incomplete
    end

    def format_date(date, default)
      return default unless date.present?
      Date.parse(date)
    end

end