require "rails_helper"

describe "visiting the dashboard", type: :feature, js: true do

  before do
    @user = create(:user, :with_valid_payment, company: create(:company))
    create(:appointment, user: @user)
    @appointment = Appointment.last
    login_as(@user, scope: :user)
    visit '/'
  end

  it "shows styles with due dates in current date range" do
    create(:style, :created, :with_cost_and_qty, :delivery_date_in_current_month)
  end

  it "shows styles with correct statuses" do
  end

end
