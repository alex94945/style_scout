class StylesController < ApplicationController
	def index
		@styles= Style.all
	end

	 def create
	  	@appointment = Appointment.find(params[:appointment_id])
	  	@appointment.styles.create(style_params)
	  	redirect_to appointment_path(@appointment)
	 end

	 def new
	  	@style = Style.new
	  	@appointment = Appointment.find(params[:appointment_id])
	  end

	  def edit
	      @style = Style.find(params[:id]) #do i need to do more with this? :style_id?
	      @appointment = Appointment.find(params[:appointment_id])
	  end

	  # def update
	  #     @appointment = Appointment.find(params[:id])
	  #     @appointment.update(appointment_params)
	  #     redirect_to root_url
	  # end
	  def update
	      @style = Style.find(params[:id])
	      @appointment = Appointment.find(params[:appointment_id])
	      @style.update(style_params)
	      redirect_to appointment_path(@appointment)
	  end

      def show
          @style = Style.find(params[:id])
      end

      def destroy
      	@appointment = Appointment.find(params[:id])
      	@appointment.destroy
      	redirect_to root_url
      end

	  private
	  	def style_params
	  		params.require(:style).permit(:name)
	     end
end
