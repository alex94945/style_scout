class Company < ActiveRecord::Base
  has_many :users
  has_many :appointments, through: :users
  has_many :styles, through: :appointments
end