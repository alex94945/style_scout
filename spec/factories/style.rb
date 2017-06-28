FactoryGirl.define do
  factory :style do
    vendor_style_number "123style-number"
    user
    association :appointment, :with_scout_date

    trait :created do
      status "Created"
    end

    trait :pending do
      status "Pending"
    end

    trait :placed do
      status "Placed"
    end

    trait :with_cost_and_qty do
      wholesale_cost 10
      quantity 10
    end

    trait :delivery_date_in_current_month do
      delivery_date Date.today
    end

  end
end
