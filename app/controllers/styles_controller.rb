class StylesController < ApplicationController
     
     def index
        @styles = StyleFinderService.new(params, current_company).perform
     end

     def create
      @appointment = Appointment.find(params[:appointment_id])
      @style = @appointment.styles.create(style_params.except(:photos) )
      @style.upload_attachments(params[:style][:photos])

      redirect_to appointment_path(@appointment)
     end

     def new
      @style = Style.new
      @appointment = Appointment.find(params[:appointment_id])
      respond_to do |format|
        format.html {redirect_to appointment_path(@appointment)}
        format.js
      end
    end

    def edit
        @appointment = Appointment.find(params[:appointment_id])
        @style = @appointment.styles.find(params[:id]) 
    end

    def update
        @style = Style.find(params[:id])
        @appointment = Appointment.find(params[:appointment_id])
        @style.update(style_params)
        redirect_to appointment_style_path(@appointment, @style)
    end

    def show
        @appointment = Appointment.find(params[:appointment_id])
        @style = @appointment.styles.find(params[:id]) 
    end

    def destroy
      @appointment = Appointment.find(params[:appointment_id])
      @appointment.styles.find(params[:id]).destroy
      redirect_to appointment_path(@appointment)
    end

    #remote true, looking for update_status.js.erb
    def update_status
      @appointment = Appointment.find(params[:appointment_id])
      @style = @appointment.styles.find(params[:style_id])
      @style.update(style_params)
    end

    private
      def style_params
        params.require(:style).permit(:name, :category_name, :vendor_style_number, :wholesale_cost, 
                      :negotiated_cost, :retail_price, :delivery_date, :quantity, :notes, :status, :color, :exclusive, :default_attachment_id, :photos => [])
             end

end
