class ProductSetsController < ApplicationController

def index
  @product_sets = current_company.product_sets.includes(:styles, :user).paginate(page: params[:page], per_page: 20)
end

def create
	@product_set = ProductSet.create(product_set_params)
	redirect_to product_set_path(@product_set)
end

def new
	@product_set = ProductSet.new
end

def edit
  @product_set = current_company.product_sets.find(params[:id])
end

def update
  @product_set = current_company.product_sets.find(params[:id])
  @product_set.update(product_set_params)
  redirect_to product_set_path(@product_set)
end

def show
  @product_set = current_company.product_sets.includes(styles: :attachments).find(params[:id])
end

def destroy
	@product_set = current_company.product_sets.find(params[:id])
	@product_set.destroy
	redirect_to root_url
end

def export
  @product_set = current_company.product_sets.find(params[:product_set_id])
  @styles = @product_set.styles
  respond_to do |format|
    format.csv{ send_data @styles.to_csv, filename: "#{@product_set.name}.csv" }
  end
end

private
	def product_set_params
		params.require(:product_set).permit(:name, :user_id, :scout_date, :location, :notes)
   end

end
