require "rails_helper"

describe "visiting the application", type: :feature, js: true do

  it "it shows appointments index if signed in" do 
    @user = create(:user, company: create(:company))
    login_as(@user, scope: :user)
    visit '/'
    expect(page.text).to include(@user.name)
  end

  it "it shows the login page if not logged in" do 
    visit'/'
    expect(page).to have_css('h2', text: 'Sign in')
  end

end