require "rails_helper"

describe "creating a style", type: :feature, js: true do

  before do
    @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young')
    @appointment = Appointment.create(user_id: @user.id)
    login_as(@user, scope: :user)
  end

context "without a photo" do
  it "creates a style with no attachments" do 
    visit "/appointments/#{@appointment.id}"
    click_link('Add New Style')

    find("#modal", match: :first)
    fill_in('style_vendor_style_number', with: Random.rand(1..9).times.map { [*'0'..'9', *'a'..'z'].sample }.join)
    fill_in('style_quantity', with: Faker::Number.number( Random.rand(1..4) ) )
    select 'Approved', from: 'style_status'
    fill_in('style_wholesale_cost', with: Faker::Number.decimal(2))


    binding.pry
    click_button("Submit Style")


    expect(@appointment.styles.last.vendor_style_number).to eql "ABC123"
    expect(@appointment.styles.last.attachments).to match_array([])
  end
end

end