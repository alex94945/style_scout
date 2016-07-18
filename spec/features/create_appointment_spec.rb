require "rails_helper"

describe "creating an appointment", type: :feature, js: true do

  before do
    @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young')
    login_as(@user, scope: :user)

  end

  it "creates an appointment" do 
    visit '/'
    click_link('Add New Appointment')
    modal = page.find('#modal')
    fill_in('appointment_name', with: "SnoopityDoggitty")
    page.execute_script('$("#appointment_scout_date").val("2016-06-11") ' )

    #TODO FIXME / HOMEWORK fill in other fields

    click_button("Submit Appointment")

    expect(Appointment.first.name).to eql "SnoopityDoggitty"
    expect(Appointment.first.scout_date).to eql Date.parse('2016-06-11')

  end

end