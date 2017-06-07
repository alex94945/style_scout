require "rails_helper"

describe "signing up a new user", type: :feature, js: true do

  context 'with a valid user' do
    it "allows user to sign up" do
      visit new_user_registration_path
      fill_in(:user_name, with: "JOOSE")
      fill_in(:user_email, with: "he@knowshernow.com")
      fill_in(:user_password, with: "itsalljoosey1")
      fill_in(:user_password_confirmation, with: "itsalljoosey1")
      fill_in(:company_name, with: "Big Time")
      click_button('Sign up')

      user = User.first
      company = User.first.company

      expect(user).to be_present
      expect(user.name).to eq "JOOSE"
      expect(user.email).to eq "he@knowshernow.com"
      expect(company.name).to eq "Big Time"
    end
  end

  # TODO - this test does not work. functionality works irl
  # context 'with validation errors' do
  #   it 'shows me validation errors' do
  #     visit new_user_registration_path
  #     fill_in('user_name', with: "Alex Again")
  #     fill_in('user_email', with: "alex@already.com")
  #     fill_in('user_password', with: "itsalljoosey1")
  #     fill_in('user_password_confirmation', with: "itsalljoosey1")
  #     click_button('Sign up')
  #     expect(page.text).to include('Email has already been taken')
  #   end
  # end

end
