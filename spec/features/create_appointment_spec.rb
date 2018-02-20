require "rails_helper"

describe "creating an product set", type: :feature, js: true do

  before do
    @user = create(:user, :with_valid_payment, company: create(:company))
    login_as(@user, scope: :user)
  end

  it "creates an product set" do
    visit '/product_sets'
    click_link('Add New Product Set')
    modal = page.find('#modal')

    @name = Faker::Company.name
    @location = Faker::Address.city
    @notes = Faker::Hipster.paragraph

    fill_in('appointment_name', with: @name)
    page.execute_script('$("#appointment_scout_date").val("2016-06-11") ' )
    fill_in('appointment_location', with: @location)
    fill_in('appointment_notes', with: @notes)

    click_button("Submit Product Set")

    expect(ProductSet.first.name).to eql @name
    expect(ProductSet.first.scout_date).to eql Date.parse('2016-06-11')
    expect(ProductSet.first.location).to eql @location
    expect(ProductSet.first.notes).to eql @notes

  end

end
