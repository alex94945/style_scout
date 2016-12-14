class Budget < ActiveRecord::Base
  belongs_to :user
  validates :year, :merch_month, presence: true
  validates_uniqueness_of :merch_month, scope: :user

  def merch_month_date_range
    start_date = MerchCalendar.start_of_month(self.year, merch_month: self.merch_month)
    end_date = MerchCalendar.end_of_month(self.year, merch_month: self.merch_month)
    return "#{start_date} ... #{end_date}"
  end

  def self.for_current_period(params)
    if params[:merch_month].present?
      current_period_month = params[:merch_month]
    else
      current_period_month = MerchCalendar::MerchWeek.from_date(Date.current).merch_month
    end

    where(merch_month: current_period_month, year: Date.current.year).last
  end

end
