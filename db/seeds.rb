# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

dates = [Date.today, 1.month.ago, 4.days.ago, 5.days.ago, 30.days.ago, 2.weeks.from_now]

50.times do
  Appointment.create(user: User.first, scout_date: dates.sample, name: Faker::Company.name )
end