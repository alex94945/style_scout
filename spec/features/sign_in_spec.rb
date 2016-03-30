require "rails_helper"

describe "visiting the application", type: :feature, js: true do

  it "it shows appointments index if logged in" do 
    @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young')
    login_as(@user, scope: :user)
    visit '/'
    expect(page.text).to include(@user.name)
  end

  it "it shows the login page if not logged in" do 
    visit'/'
    expect(page).to have_css('h2', text: 'Log in')
  end

end