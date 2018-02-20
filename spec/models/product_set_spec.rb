require "rails_helper"

describe ProductSet do

  before do
    @product_set = ProductSet.create(name: 'Product Set Test Name')
    10.times do
      @product_set.styles.create(quantity: Faker::Number.number(Random.rand(1...3)), negotiated_cost: Faker::Number.decimal(2),
          wholesale_cost: Faker::Number.decimal(2), retail_price: Faker::Number.decimal(2), vendor_style_number: 'yeah' )
    end

    2.times do
      @product_set.styles.create(quantity: Faker::Number.number(Random.rand(1...3)), negotiated_cost: Faker::Number.decimal(2),
          wholesale_cost: Faker::Number.decimal(2), retail_price: Faker::Number.decimal(2), vendor_style_number: 'yeah', status: 4 )
    end

  end


  it "calculates weighted average IMU" do
    sumproduct = 0

    @product_set.styles.open.each do |style|
        sumproduct += style.quantity * style.initial_mark_up
    end

    imu = sumproduct / @product_set.styles.open.sum(:quantity)

    expect( @product_set.weighted_average_imu.round(5) ).to eq( imu.round(5) )
  end

  it "calculates average initial retail" do
    sumproduct = 0

    @product_set.styles.open.each do |style|
      sumproduct += style.quantity * style.retail_price
    end

    air = sumproduct / @product_set.styles.open.sum(:quantity)

    expect( @product_set.average_initial_retail.round(5)).to eq( air.round(5) )

  end

end
