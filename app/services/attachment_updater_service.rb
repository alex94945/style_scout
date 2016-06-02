class AttachmentUpdaterService
    
    def initialize(attachment, params)
      @attachment = attachment
      @params = params

    end


    def update
      @attachment.style.update(default_photo_id: @params[:attachment_id] ) if @params[:make_default_photo] == 1

      @attachment.update(photo_rotate_angle: @params[:attachment][:photo_rotate_angle])
    end

end