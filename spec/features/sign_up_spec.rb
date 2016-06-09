require "rails_helper"

describe "signing up a new user", type: :feature, js: true do

  context 'with a valid user' do
    it "allows me to sign up" do 
      visit new_user_registration_path
      fill_in('user_name', with: "JOOSE")
      fill_in('user_email', with: "he@knowshernow.com")
      fill_in('user_password', with: "itsalljoosey1")
      fill_in('user_password_confirmation', with: "itsalljoosey1")
      click_button('Sign up')
      expect(User.count).to eq 1
    end
  end

  context 'with validation errors' do 
    before do
      User.create(email:'alex@already.com', name: 'Alex User', password: '1234567890', password_confirmation: '1234567890')
    end

    it 'shows me validation errors' do
      visit new_user_registration_path
      fill_in('user_name', with: "Alex Again")
      fill_in('user_email', with: "alex@already.com")
      fill_in('user_password', with: "itsalljoosey1")
      fill_in('user_password_confirmation', with: "itsalljoosey1")
      click_button('Sign up')
      expect(page.text).to include('Email has already been taken')
    end
  end

end