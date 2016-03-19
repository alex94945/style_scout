class AppointmentsController < ApplicationController
	def index
		@appointments= current_user.appointments.all
	end

	 def create
	  	@appointment = current_user.appointments.create(appointment_params)
	  	redirect_to appointment_path(@appointment)
	 end

	 def new
	  	@appointment = Appointment.new
	  end

	  def edit
	      @appointment = current_user.appointments.find(params[:id])
	  end

	  def update
	      @appointment = current_user.appointments.find(params[:id])
	      @appointment.update(appointment_params)
	      redirect_to root_url
	  end

      def show
          @appointment = current_user.appointments.find(params[:id])
      end

      def destroy
      	@appointment = current_user.appointments.find(params[:id])
      	@appointment.destroy
      	redirect_to root_url
      end

	  private
	  	def appointment_params
	  		params.require(:appointment).permit(:name, :buyer, :scout_date, :location)
	     end
end
