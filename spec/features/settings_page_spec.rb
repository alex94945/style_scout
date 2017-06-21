require "rails_helper"

describe "visiting the settings page", type: :feature, js: true do

  context "as an administrative user " do
     before do
      @user = create(:user, :with_valid_payment, :who_is_administrator, company: create(:company))
        login_as(@user, scope: :user)
      end

    it 'shows the style categories options' do
      visit '/settings'
      expect(page.text).to include("Style Categories")
    end
  end

  context "as a non-administrative user" do
      before do
        @user = @user = create(:user, :with_valid_payment, company: create(:company))
        login_as(@user, scope: :user)
      end

    it 'doesn\'t show the style categories options ' do
      visit '/settings'
      expect(page.text).to_not include("Style Categories")
    end

  end

end
