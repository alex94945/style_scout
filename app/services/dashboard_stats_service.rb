class DashboardStatsService < DashboardBaseService

  def perform
    {
      complete_appointments: complete_appointents,
      incomplete_appointments: incomplete_appointments,
      current_date_range_budget: 1200,
      incomplete_styles: all_styles.select{ |s| s.status == 'incomplete'},
      created_styles: all_styles.select{ |s| s.status == 'created'},
      pending_styles: all_styles.select{ |s| s.status == 'pending'},
      placed_styles: all_styles.select{ |s| s.status == 'placed'}
    }
  end

  private

    def appointments
      @appointments ||= @user.appointments.includes(:styles).where(scout_date: @start_date..@end_date)
    end

    def complete_appointents
      appointments - incomplete_appointments
    end

    def incomplete_appointments
      appointments.joins(:styles).where(styles: {status: Style::INCOMPLETE_STATUSES}).distinct
    end

    def all_styles
      # calling .all hits the db, and memoizes the result 
      # into array containing all styles for these appointments, this no longer creates an n+1
      @all_styles ||= Style.includes(:appointment).where(appointment_id: appointments.uniq).all
    end

end
