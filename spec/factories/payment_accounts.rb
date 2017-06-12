FactoryGirl.define do
  factory :payment_account do
    user nil
    plan 1
    status "MyString"
    trial_period_active false
  end
end
