class Appointment < ActiveRecord::Base
	has_many :styles, dependent: :destroy
      belongs_to :user

	def weighted_average_imu
          return 0 if styles.empty?
	    styles.map{ |style| style.quantity.nil? ? 0 : (style.quantity * style.initial_mark_up) }.inject(:+)  / styles.sum(:quantity) 
	end

end
