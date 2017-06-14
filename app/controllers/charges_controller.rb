class ChargesController < ApplicationController
  before_action :amount_to_be_charged
  before_action :set_description
  before_action :authenticate_user!
  before_action :set_plan

  def new
  end

  def create
    if params[:subscription].include? 'yes'
      StripeTool.create_membership(email: params[:stripeEmail],
                                 stripe_token: params[:stripeToken],
                                 plan: @plan)
    else
      customer = StripeTool.create_customer(email: params[:stripeEmail],
                                            stripe_token: params[:stripeToken])
      charge = StripeTool.create_charge(customer_id: customer.id,
                                 amount: @amount,
                                 description: @description)
    end

    redirect_to thanks_path

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end

  private

    def set_plan
      @plan = 9999
    end

    def amount_to_be_charged
      @amount = 50 * 100 #cents
    end

    def set_description
      @description = 'Style Scout Monthly Fee'
    end

    def thanks
    end

end
