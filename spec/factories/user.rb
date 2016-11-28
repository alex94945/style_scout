FactoryGirl.define do
  factory :user do
    name "John Hoe"
    email 'fake@email.com'
    password '1234567890'
    password_confirmation '1234567890'
    company
  end
end