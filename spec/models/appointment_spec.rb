require "rails_helper"

describe Appointment do

  before do
    @appointment = Appointment.create
    10.times do
      @appointment.styles.create(quantity: Faker::Number.number(Random.rand(1...3)), negotiated_cost: Faker::Number.decimal(2), wholesale_cost: Faker::Number.decimal(2), retail_price: Faker::Number.decimal(2) )
    end
  end


  it "calculates weighted average IMU" do
    sum = 0

    @appointment.styles.each do |style|
        sum += style.quantity * style.initial_mark_up
    end
    
    imu = sum / @appointment.styles.sum(:quantity) 

    expect( @appointment.weighted_average_imu.round(5) ).to eq( imu.round(5) )
  end

end