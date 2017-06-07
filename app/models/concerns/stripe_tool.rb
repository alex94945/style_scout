module StripeTool

  def self.create_customer(email: stripe_email, stripe_token: stripe_token)
    customer = Stripe::Customer.create(
      email: email,
      source: stripe_token
    )
  end

  def self.create_charge(customer_id: customer_id, amount: amount, description: description)
    charge = Stripe::Charge.create(
      customer: customer_id,
      amount: amount,
      description: description,
      currency: 'usd'
    )
  end

end
