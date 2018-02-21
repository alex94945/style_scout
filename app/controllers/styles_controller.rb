class StylesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :render_styles_index_or_welcome, only: :index
  before_action :fetch_product_set, except: :index

  def index
    @styles = StyleFinderService.new(params, current_company).perform
  end

   def create
    @style = @product_set.styles.create(style_params.except(:photos) )
    @style.upload_attachments(params[:style][:photos])

    redirect_to product_set_path(@product_set)
   end

   def new
    @style = Style.new
    @product_set = ProductSet.find(params[:product_set_id])

  end

  def edit
    @style = @product_set.styles.find(params[:id])
    @inline = params[:inline]
  end

  def update
    @style = Style.find(params[:id])
    @style.update(style_params)

    if params[:inline] == 'true'
      redirect_to product_set_path(@product_set)
    else
      redirect_to product_set_style_path(@product_set, @style)
    end
  end

  def show
    @style = @product_set.styles.find(params[:id])
  end

  def destroy
    @product_set.styles.find(params[:id]).destroy
    redirect_to product_set_path(@product_set)
  end

  #remote true, looking for update_status.js.erb
  def update_status
    @style = @product_set.styles.find(params[:style_id])
    @style.update(style_params)
  end

  #TODO: non REST-ful route. Can refactor
  def duplicate
    @duplicate_style = StyleDuplicatorService.new(params[:style_id]).perform
    redirect_to product_set_path(@product_set)

  end

  private
    def render_styles_index_or_welcome
      render :welcome unless user_signed_in?
    end

    def fetch_product_set
      @product_set = ProductSet.find(params[:product_set_id])
    end

    def style_params
      params.require(:style).permit(:name, :category_name, :vendor_style_number, :wholesale_cost,
                    :negotiated_cost, :retail_price, :delivery_date, :quantity, :notes, :status,
                    :color, :exclusive, :default_attachment_id, :photos => [])
    end

end
