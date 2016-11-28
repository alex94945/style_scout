module Api
  module V1
    class AttachmentsController < ApplicationController
        skip_before_action :authenticate_user!
        skip_before_action :configure_permitted_parameters, if: :devise_controller?
        layout false

      def show
        @attachment = Attachment.find(params[:id])
      end
    end
  end
end