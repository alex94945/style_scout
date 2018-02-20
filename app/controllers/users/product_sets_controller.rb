class Users::ProductSetsController < ApplicationController

  def index
    @product_sets = current_user.product_sets
    render "product_sets/index"
  end

end
