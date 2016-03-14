class Style < ActiveRecord::Base
	belongs_to :appointment
	belongs_to :category

	def initial_mark_up
		return 0 unless retail_price.present?
		( ( (retail_price) - wholesale_or_negotiated_cost) / retail_price ) * 100
	end

	private 
		def wholesale_or_negotiated_cost
			negotiated_cost.present? ? negotiated_cost : wholesale_cost || 0
		end
end
