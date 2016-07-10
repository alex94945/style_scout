class Appointment < ActiveRecord::Base
  has_many :styles, dependent: :destroy
  belongs_to :user

  def weighted_average_imu
    value = 0
    value = calculated_markup(styles.open.with_value, :initial_mark_up)
  end

  def average_initial_retail
    value = 0
    value = calculated_markup(styles.open.with_value, :retail_price)
  end


  private
    def calculated_markup(styles, field)
      return 0 if styles.empty?
      styles.map{ |style| (style.quantity * style.send(field)) }.inject(:+)  / styles.sum(:quantity) 

    end

end