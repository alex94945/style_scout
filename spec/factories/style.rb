FactoryGirl.define do
  factory :style do
    vendor_style_number "123style-number"
    user

    trait :created do
      status "Created"
    end

    trait :pending do
      status "Pending"
    end

    trait :placed do
      status "Placed"
    end

  end
end
