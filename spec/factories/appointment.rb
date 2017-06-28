FactoryGirl.define do
  factory :appointment do
    name "Appointment Name"
    user

    trait :with_scout_date do
      scout_date 3.months.ago
    end

  end
end
