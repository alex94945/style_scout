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
	  	@appointment = Appointment.find(params[:appointment_id])
	      @style = @appointment.styles.find(params[:id]) 
	  end

	  def update
	      @style = Style.find(params[:id])
	      @appointment = Appointment.find(params[:appointment_id])
	      @style.update(style_params)
	      redirect_to appointment_path(@appointment)
	  end

      def show
      	@appointment = Appointment.find(params[:appointment_id])
	     @style = @appointment.styles.find(params[:id]) 
          @variation = Variation.new
      end

      def destroy
      	@appointment = Appointment.find(params[:id])
      	@appointment.destroy
      	redirect_to root_url
      end

	  private
	  	def style_params
	  		params.require(:style).permit(:name, :category_id, :vendor_style_number)
	     end
end
