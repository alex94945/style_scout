class StylesController < ApplicationController
	def index
		@styles= Style.all
	end

	 def create
	  	@appointment = current_user.appointments.find(params[:appointment_id])
	  	@appointment.styles.create(style_params)
	  	redirect_to appointment_path(@appointment)
	 end

	 def new
	  	@style = Style.new
	  	@appointment = current_user.appointments.find(params[:appointment_id])
	  	respond_to do |format|
	  		format.html {redirect_to appointment_path(@appointment)}
	  		format.js {render "new"}
	  	end
	  end

	  def edit
	  	@appointment = current_user.appointments.find(params[:appointment_id])
	      @style = @appointment.styles.find(params[:id]) 
	  end

	  def update
	      @style = Style.find(params[:id])
	      @appointment = current_user.appointments.find(params[:appointment_id])
	      @style.update(style_params)
	      redirect_to appointment_path(@appointment)
	  end

      def show
      	@appointment = current_user.appointments.find(params[:appointment_id])
	     @style = @appointment.styles.find(params[:id]) 
      end

      def destroy
      	@appointment = current_user.appointments.find(params[:id])
      	@appointment.styles.find(params[:id]).destroy
      	redirect_to appointment_path(@appointment)
      end

	  private
	  	def style_params
	  		params.require(:style).permit(:name, :category_name, :vendor_style_number, :wholesale_cost, :negotiated_cost, :retail_price)
	     end
end
