class ChargesController < ApplicationController
  skip_before_action :check_payment_status
  before_action :authenticate_user!
  before_action :amount_in_cents

  def new
  end

  def create
    service = StripeService.new(email: params[:stripeEmail], stripe_token: params[:stripeToken], user: current_user)

    if service.perform
      redirect_to thanks_path
    else
      flash[:error] = service.errors
      render :new
    end
  end

  private
    def amount_in_cents
      @amount = 50 * 100 #cents
    end

    def thanks
    end

end
