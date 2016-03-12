class AppointmentsController < ApplicationController
	def index
		@appointments= Appointment.all
	end

	 def create
	  	@appointment = Appointment.create(appointment_params)
	  	redirect_to appointment_path(@appointment)
	 end

	 def new
	  	@appointment = Appointment.new
	  end

	  def edit
	      @appointment = Appointment.find(params[:id])
	  end

	  def update
	      @appointment = Appointment.find(params[:id])
	      @appointment.update(appointment_params)
	      redirect_to root_url
	  end

      def show
          @appointment = Appointment.find(params[:id])
      end

      def destroy
      	@appointment = Appointment.find(params[:id])
      	@appointment.destroy
      	redirect_to root_url
      end

	  private
	  	def appointment_params
	  		params.require(:appointment).permit(:name)
	     end
end
