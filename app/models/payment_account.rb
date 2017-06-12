class PaymentAccount < ActiveRecord::Base
  belongs_to :user

  enum status: [:active, :inactive]

  def stripe_customer
    @customer ||= Stripe::Customer.retrieve(self.stripe_customer_id.to_s)
  end


end
