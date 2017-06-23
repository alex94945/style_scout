FactoryGirl.define do
  factory :user do
    name "John Hoe"
    email 'fake@email.com'
    password '1234567890'
    password_confirmation '1234567890'
    company

    trait :with_trial_account do
      trail_period_account
    end

    trait :with_valid_payment do
      association :payment_account, :active_account
    end

    trait :with_invalid_payment do
      inactive_account
    end

    trait :who_is_administrator do
      administrator true
    end

  end
end
