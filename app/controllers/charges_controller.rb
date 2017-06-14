class ChargesController < ApplicationController
  skip_before_action :check_payment_status
  before_action :amount_to_be_charged
  before_action :set_description
  before_action :authenticate_user!
  before_action :set_plan

  def new
  end

  def create

    membership = StripeService.new().create_membership(email: params[:stripeEmail],
                                         stripe_token: params[:stripeToken],
                                         plan: @plan) #creates customer in StripeService

    if membership
      #looks like the membership creation was successful, persist the data locally
      if current_user.payment_account.present?
        payment_account = current_user.payment_account
      else
        payment_account = PaymentAccount.new
      end

      payment_account.update(user: current_user,
                            stripe_customer_id: membership['id'],
                            plan_id: set_plan,
                            trial_period_active: true,
                            status: :active)
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
