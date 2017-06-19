FactoryGirl.define do
  factory :payment_account do
    user nil
    plan_id 1
    # status "MyString"
    # trial_period_active false
    status "active"

    trait :active_account do
      status "active"
    end

    trait :trial_period_account do
      status "inactive"
      trial_period_active true
    end

    trait :inactive_account do
      status "inactive"
    end

  end
end
