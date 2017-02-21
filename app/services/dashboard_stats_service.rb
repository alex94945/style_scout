class DashboardStatsService < DashboardBaseService

  def perform
    {
      complete_appointments: complete_appointents,
      incomplete_appointments: incomplete_appointments,
      current_date_range_budget: 1200,
      # incomplete << created, pending, placed
      incomplete_styles: incomplete_styles,
      created_styles: created_styles,
      pending_styles: pending_styles,
      placed_styles: placed_styles
    }
  end

  private

    def appointments
      @appointments ||= @user.appointments.includes(:styles)
    end

    def complete_appointents
      appointments - incomplete_appointments
    end

    def incomplete_appointments
      appointments.joins(:styles).where(styles: {status: Style::INCOMPLETE_STATUSES}).distinct
    end

    def incomplete_styles
      Style.includes(:appointment).where(appointment_id: appointments.pluck(:id).uniq).incomplete
    end

    def created_styles
      Style.includes(:appointment).where(appointment_id: appointments.pluck(:id).uniq).created
    end

    def pending_styles
      Style.includes(:appointment).where(appointment_id: appointments.pluck(:id).uniq).pending
    end

    def placed_styles
      Style.includes(:appointment).where(appointment_id: appointments.pluck(:id).uniq).placed
    end

end
