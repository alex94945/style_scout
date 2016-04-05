require "rails_helper"

describe "visiting the application", type: :feature, js: true do

  before do
    @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young')
    login_as(@user, scope: :user)

  end

  it "creates an appointment" do 
    visit '/'
    click_link('Add New Appointment')
    modal = page.find('#modal')
    fill_in('appointment_name', with: 'SnoopityDoggitty')
    date = Date.tomorrow.strftime('%Y-%m-%d')
    page.execute_script('$("#appointment_scout_date").val("2016-06-11") ' )

    #fill in other fields

    #click_button for the update button

    #expect(Appointment.first.name).to eql "SnoopityDoggitty"

  end

end