class AttachmentsController < ApplicationController

  def index
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @attachments = @style.attachments
  end

  def create
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @style.upload_attachments(params[:style][:photos])
    redirect_to appointment_style_path(@appointment, @style)
  end

  def destroy
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @attachment = @style.attachments.find(params[:id])
    @attachment.destroy
    redirect_to appointment_style_path(@appointment, @style)
  end

end