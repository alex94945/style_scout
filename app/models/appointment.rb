class Appointment < ActiveRecord::Base
	has_many :styles, dependent: :destroy
end
