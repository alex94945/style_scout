class StripeService

  attr_accessor :errors

  def initialize(email: email, stripe_token: stripe_token, user: user)
    @plan = 9999
    @email = email
    @token = stripe_token
    @user = user
    @payment_account = @user.payment_account || PaymentAccount.new(user: user)
    @errors = nil
  end

  def perform
    create_membership
    create_or_update_payment_account
  end


  private
    def create_membership
      if @payment_account.stripe_customer_id.present?
        @membership = Stripe::Customer.retrieve(@payment_account.stripe_customer_id)
      else
        @membership = Stripe::Customer.create(email: @email, source: @stripe_token, plan: @plan)
      end

      @membership['id'].present?
    end

    def create_or_update_payment_account
      if @membership['id'].present?

        @payment_account.update(
                                stripe_customer_id: @membership['id'],
                                plan_id: @plan,
                                trial_period_active: true,
                                status: :active
                              )
      else
        @errors = 'there was a problem creating the customer'
      end
    end
end
