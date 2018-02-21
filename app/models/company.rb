class Company < ActiveRecord::Base
  has_many :users
  has_many :product_sets, through: :users
  has_many :styles, through: :product_sets
end
