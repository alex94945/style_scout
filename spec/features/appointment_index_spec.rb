require "rails_helper"

describe "visiting the appointments index", type: :feature, js: true do

  before do

    @user = create(:user, company: create(:company))
    6.times do
      create(:appointment, user: @user)
    end

    login_as(@user, scope: :user)

  end

end
