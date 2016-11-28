class AppointmentsController < ApplicationController

def index
  @appointments = current_company.appointments.all
end

def create
	@appointment = Appointment.create(appointment_params)
	redirect_to appointment_path(@appointment)
end

def new
	@appointment = Appointment.new
end

def edit
  @appointment = current_company.appointments.find(params[:id])
end

def update
  @appointment = current_company.appointments.find(params[:id])
  @appointment.update(appointment_params)
  redirect_to appointment_path(@appointment)
end

def show
  @appointment = current_company.appointments.find(params[:id])
end

def destroy
	@appointment = current_company.appointments.find(params[:id])
	@appointment.destroy
	redirect_to root_url
end

def export
  @appointment = current_company.appointments.find(params[:appointment_id])
  @styles = @appointment.styles
  respond_to do |format|
    format.csv{ send_data @styles.to_csv, filename: "#{@appointment.name}.csv" }
  end
end

private
	def appointment_params
		params.require(:appointment).permit(:name, :user_id, :scout_date, :location, :notes)
   end

end
