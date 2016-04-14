require "rails_helper"

describe "visiting the appointments index", type: :feature, js: true do

  before do
    @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young')
    6.times do 
      Appointment.create(name: "Example Appointment", user_id: @user.id)
    end



    login_as(@user, scope: :user)

  end

  it "renders jquery datatables" do 
    visit '/'
    expect(page.text).to include(" Showing 1 to #{@user.appointments.count} of #{@user.appointments.count} entries")


    #fill in other fields

    #click_button for the update button

    #expect(Appointment.first.name).to eql "SnoopityDoggitty"

  end

end