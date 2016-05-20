class Appointment < ActiveRecord::Base
	has_many :styles, dependent: :destroy
      belongs_to :user

	def weighted_average_imu
          return 0 if styles.empty? || styles.all?{ |s| s.quantity == 0 }
	    styles.open.map{ |style| style.quantity.nil? ? 0 : (style.quantity * style.initial_mark_up) }.inject(:+)  / styles.open.sum(:quantity) 
	end

      def average_initial_retail
          return 0 if styles.empty?
          styles.open.map{ |style| style.quantity.nil? ? 0 : (style.quantity * style.retail_price) }.inject(:+) / styles.open.sum(:quantity) 
      end

end