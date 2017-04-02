require "rails_helper"

describe "creating an appointment", type: :feature, js: true do

  before do
    @user = create(:user, company: create(:company))
    login_as(@user, scope: :user)
  end

  it "creates an appointment" do
    visit '/appointments'
    click_link('Add New Appointment')
    modal = page.find('#modal')

    @name = Faker::Company.name
    @location = Faker::Address.city
    @notes = Faker::Hipster.paragraph

    fill_in('appointment_name', with: @name)
    page.execute_script('$("#appointment_scout_date").val("2016-06-11") ' )
    fill_in('appointment_location', with: @location)
    fill_in('appointment_notes', with: @notes)

    click_button("Submit Appointment")

    expect(Appointment.first.name).to eql @name
    expect(Appointment.first.scout_date).to eql Date.parse('2016-06-11')
    expect(Appointment.first.location).to eql @location
    expect(Appointment.first.notes).to eql @notes

  end

end