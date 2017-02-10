class Budget < ActiveRecord::Base
  belongs_to :user
  validates :merch_year, :merch_month, presence: true
  validates_uniqueness_of :user_id, scope: [:merch_month, :merch_year]

  def merch_month_date_range
    start_date = MerchCalendar.start_of_month(self.merch_year, merch_month: self.merch_month)
    end_date = MerchCalendar.end_of_month(self.merch_year, merch_month: self.merch_month)
    return "#{start_date} ... #{end_date}"
  end

  def self.for_current_period(params)
    if params[:merch_month].present? && params[:merch_year].present?
      current_period_month = params[:merch_month]
      current_period_year = params[:merch_year]
    else
      current_period_month = MerchCalendar::MerchWeek.from_date(Date.current).merch_month
      current_period_year = MerchCalendar::MerchWeek.from_date(Date.current).year
    end

    where(merch_month: current_period_month, merch_year: current_period_year).last
  end

end
