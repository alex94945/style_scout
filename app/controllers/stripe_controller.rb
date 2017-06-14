class StripeController < ApplicationController
  protect_from_forgery except: :webhook
  skip_before_action :authenticate_user!
  skip_before_action :check_payment_status

  def webhook
    puts JSON.parse(request.body.read)

    head :ok
  end

end