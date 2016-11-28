require "rails_helper"

describe User do
  it "has a name" do
    @user = User.create(name: "Alex")
    expect(@user.name).to eq "Alex"
  end
end