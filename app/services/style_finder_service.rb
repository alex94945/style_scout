class StyleFinderService

  def initialize(params, company)
    @params = params
    @filters = params[:filters]
    @current_company = company
  end

  def perform
    @styles = @current_company.styles.includes(:attachments, :appointment).all

    return @styles unless @filters

    filter_by_appointment_name
    filter_by_status
  end


  private
    def filter_by_appointment_name
      if @filters[:appointment_name].present?
         @styles = @styles.includes(:appointment).where(appointments: {name: @filters[:appointment_name] })
      end

      return @styles
    end

    def filter_by_status
      if @filters[:status].present?
         @styles = @styles.where(status: @filters[:status])
      end

      return @styles
    end

end