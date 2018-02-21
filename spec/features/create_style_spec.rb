require "rails_helper"

#TODO FIXME : test intermitently fails the 2nd context (full fields)

describe "creating a style", type: :feature, js: true do

  before do
    @user = create(:user, :with_valid_payment, company: create(:company))
    create(:product_set, user: @user)
    @product_set = ProductSet.last
    category_names = ["Sweaters", "Pants", "Accessories", "Shoes", "Shirts", "Dresses"]
    @category = category_names.each { |c| Category.create(name: c) }
    login_as(@user, scope: :user)
  end

context "without a photo" do

    it "creates a style with no attachments and only required fields" do

    @vendor_style_number = Random.rand(1..9).times.map { [*'0'..'9', *'a'..'z'].sample }.join

    visit "/product_sets/#{@product_set.id}"
    click_link('Add New Style')

    fill_in('style_vendor_style_number', with: @vendor_style_number)

    click_button("Submit Style")

    expect(@product_set.styles.last.vendor_style_number).to eql @vendor_style_number
    expect(@product_set.styles.last.attachments).to match_array([])

  end

  it "creates a style with no attachments and full fields" do

    @vendor_style_number = Random.rand(1..9).times.map { [*'0'..'9', *'a'..'z'].sample }.join
    @style_quantity = Faker::Number.number( Random.rand(1..4) ).to_i
    @status = ["Created", "Pending", "Placed", "Received", "Cancelled", "Deleted"].sample
    @wholesale_cost = Faker::Number.decimal(2).to_d
    @negotiated_cost = Faker::Number.decimal(2).to_d
    @retail_price = Faker::Number.decimal(2).to_d
    @color = Faker::Color.color_name
    @category = ["Sweaters", "Pants", "Accessories", "Shoes", "Shirts", "Dresses"].sample
    @notes = Faker::Hipster.paragraph

    visit "/product_sets/#{@product_set.id}"
    click_link('Add New Style')
    click_link('Advanced Fields')

    fill_in('style_vendor_style_number', with: @vendor_style_number)
    fill_in('style_quantity', with: @style_quantity )
    select @status, from: 'style_status'
    page.execute_script(' $("#style_delivery_date").val("2016-06-11") ')
    fill_in('style_wholesale_cost', with: @wholesale_cost )
    fill_in('style_negotiated_cost', with: @negotiated_cost )
    fill_in('style_retail_price', with: @retail_price )
    fill_in('style_color', with: @color)
    select @category, from: 'style_category_name'
    fill_in('style_notes', with: @notes)

    click_button("Submit Style")

    expect(@product_set.styles.last.vendor_style_number).to eql @vendor_style_number
    expect(@product_set.styles.last.quantity).to eql @style_quantity
    expect(@product_set.styles.last.status).to eql @status.humanize.downcase
    expect(@product_set.styles.last.delivery_date).to eql Date.parse('2016-06-11')
    expect(@product_set.styles.last.wholesale_cost).to eql @wholesale_cost
    expect(@product_set.styles.last.negotiated_cost).to eql @negotiated_cost
    expect(@product_set.styles.last.retail_price).to eql @retail_price
    expect(@product_set.styles.last.color).to eql @color
    expect(@product_set.styles.last.category_name).to eql @category.humanize.downcase
    expect(@product_set.styles.last.notes).to eql @notes
    expect(@product_set.styles.last.attachments).to match_array([])

  end

end

end
