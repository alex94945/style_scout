class StylesController < ApplicationController
  before_action :fetch_appointment, except: :index

  def index
    @styles = StyleFinderService.new(params, current_company).perform
  end

   def create
    @style = @appointment.styles.create(style_params.except(:photos) )
    @style.upload_attachments(params[:style][:photos])

    redirect_to appointment_path(@appointment)
   end

   def new
    @style = Style.new
    @appointment = Appointment.find(params[:appointment_id])

  end

  def edit
      @style = @appointment.styles.find(params[:id])
  end

  def update
      @style = Style.find(params[:id])
      @style.update(style_params)
      redirect_to appointment_style_path(@appointment, @style)
  end

  def show
    @style = @appointment.styles.find(params[:id])
  end

  def destroy
    @appointment.styles.find(params[:id]).destroy
    redirect_to appointment_path(@appointment)
  end

  #remote true, looking for update_status.js.erb
  def update_status
    @style = @appointment.styles.find(params[:style_id])
    @style.update(style_params)
  end

  #TODO: non REST-ful route. Can refactor 
  def duplicate
    @duplicate_style = StyleDuplicatorService.new(params[:style_id]).perform
    redirect_to appointment_path(@appointment)

  end

  private
    def fetch_appointment
      @appointment = Appointment.find(params[:appointment_id])
    end

    def style_params
      params.require(:style).permit(:name, :category_name, :vendor_style_number, :wholesale_cost,
                    :negotiated_cost, :retail_price, :delivery_date, :quantity, :notes, :status, :color, :exclusive, :default_attachment_id, :photos => [])
           end

end
