class AttachmentsController < ApplicationController

   def create
      @appointment = Appointment.find(params[:appointment_id])
      @style = @appointment.styles.find(params[:style_id])
      @style.attachments.create(photo: params[:attachment][:photo])

      redirect_to appointment_style_path(@appointment, @style)
   end

   def edit
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @attachment = @style.attachments.find(params[:id])
   end

   def update
    @appointment = Appointment.find(params[:appointment_id])
    @style = @appointment.styles.find(params[:style_id])
    @attachment = @style.attachments.find(params[:id])
    @updater = AttachmentUpdaterService.new(@attachment, params).update
   end

end
