class AppointmentCollector
  
  def initialize(current_user)
    @current_user = current_user
  end

  def perform
    return nil unless @current_user
    @current_user.profile_config.default_home_my_appointments? ? @current_user.appointments : Appointment.all
  end

end