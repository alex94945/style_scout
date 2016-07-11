class AttachmentsController < ApplicationController

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @style.upload_attachments(params[:style][:photos])
    redirect_to appointment_style_path(@appointment, @style)
  end

end