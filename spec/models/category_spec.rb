require "rails_helper"

describe Category do
  it "lowercases name on save" do
    @category = Category.create(name: 'Alex')
    expect(@category.name).to eq('alex')
  end

  it "#display_name titleizes the name" do
    @category = Category.create(name:'alex')
    expect(@category.display_name).to eq('Alex')
  end


end