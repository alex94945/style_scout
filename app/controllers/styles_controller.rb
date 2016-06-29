class StylesController < ApplicationController
     def index

            @styles = Style.all
     end

     def create
      @appointment = Appointment.find(params[:appointment_id])
      ActiveRecord::Base.transaction  do
        @style = @appointment.styles.create(style_params.except(:photos))
        params[:style][:photos].each do |photo|
          @style.attachments.create(photo: photo) if photo.present?
        end
      end

      redirect_to appointment_path(@appointment)
     end

     def new
        @style = Style.new
        @appointment = Appointment.find(params[:appointment_id])

        respond_to do |format|
          format.html {redirect_to appointment_path(@appointment)}
          format.js {render "new"}
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
      @style = Style.find(params[:style_id])
      @appointment = Appointment.find(params[:appointment_id])
      @style.update(style_params)
    end

    private
      def style_params
        params.require(:style).permit(:name, :category_name, :vendor_style_number, :wholesale_cost, 
                      :negotiated_cost, :retail_price, :delivery_date, :quantity, :notes, :status, :color, :photos, :exclusive)
             end

end
