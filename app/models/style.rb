class Style < ActiveRecord::Base
	belongs_to :appointment
	has_many :variations, dependent: :destroy
end
