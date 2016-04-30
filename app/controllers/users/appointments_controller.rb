class Users::AppointmentsController < ApplicationController

  def index
    @appointments = current_user.appointments
    render "appointments/index"
  end

end