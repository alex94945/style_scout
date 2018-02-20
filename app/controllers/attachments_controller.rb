class AttachmentsController < ApplicationController

  def index
    @product_set = ProductSet.find(params[:product_set_id])
    @style = @product_set.styles.find(params[:style_id])
    @attachments = @style.attachments
  end

  def create
    @product_set = ProductSet.find(params[:product_set_id])
    @style = @product_set.styles.find(params[:style_id])
    @style.upload_attachments(params[:style][:photos])
    redirect_to product_set_style_path(@product_set, @style)
  end

  def destroy
    @product_set = ProductSet.find(params[:product_set_id])
    @style = @product_set.styles.find(params[:style_id])
    @attachment = @style.attachments.find(params[:id])
    @attachment.destroy
    redirect_to product_set_style_path(@product_set, @style)
  end

end
