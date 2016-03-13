class Style < ActiveRecord::Base
	belongs_to :appointment
	belongs_to :category
	has_many :variations, dependent: :destroy
end
