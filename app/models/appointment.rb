class Appointment < ActiveRecord::Base
	has_many :styles, dependent: :destroy
      belongs_to :user

	def average_imu
		return 0 unless styles.any?
		styles.map(&:initial_mark_up).sum / styles.length
	end
end
