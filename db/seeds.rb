# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Create a Company
company = Company.create(name: 'Tech & Stuff')

#Create a User
user = User.create(name: 'Alex Alex', email: 'alex@alex.com', password:'1234567890', password_confirmation: '1234567890', company: company)

# Create a budget
budget = Budget.create(value: 100000, merch_month: DateTime.current.month, merch_year: DateTime.current.year)

#Create Appointments/Styles

dates = [3.months.ago, Date.tomorrow, Date.yesterday, Date.today, 1.month.ago, 4.days.ago, 5.days.ago, 30.days.ago, 2.weeks.from_now]

50.times do
  a = Appointment.create(user: user, scout_date: dates.sample, name: Faker::Company.name)
  10.times do
    a.styles.create(
      vendor_style_number: Faker::Number.number(10),
      negotiated_cost: Faker::Commerce.price,
      retail_price: Faker::Commerce.price,
      wholesale_cost: Faker::Commerce.price,
      status: [0,1,2,3,4,5].sample
    )
  end
end


