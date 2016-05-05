require "rails_helper"

describe "visiting the settings page", type: :feature, js: true do

  context "as an administrative user " do
     before do
        @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young', administrator: true)
        login_as(@user, scope: :user)
      end

    it 'shows the style categories options' do
      visit '/settings'
      expect(page.text).to include("Style Categories")
    end
  end

  context "as a non-administrative user" do
      before do
        @user = User.create(email: "test@test.com", password: "123456789", password_confirmation: '123456789', name: 'Alex Young', administrator: false)
        login_as(@user, scope: :user)
      end

    it 'doesn\'t show the style categories options ' do
      visit '/settings'
      expect(page.text).to_not include("Style Categories")
    end

  end

end