require 'rails_helper'

describe DashboardHelper, type: :helper do

  month_numbers = (1..12)

  it "gets the start date of a given merch_month" do

    actual_start_dates = ["2016-01-31", "2016-02-28", "2016-04-03",
      "2016-05-01", "2016-05-29", "2016-07-03", "2016-07-31", "2016-08-28",
      "2016-10-02", "2016-10-30", "2016-11-27", "2017-01-01"]

    all_start_dates = []

    month_numbers.each do |m|
      start_date = MerchCalendar.start_of_month(Date.current.year, merch_month: m)
      all_start_dates << start_date.to_s
    end
  end

  it "gets the end date of a given merch_month" do

    actual_end_dates = ["2016-02-27", "2016-04-02", "2016-04-30", "2016-05-28",
      "2016-07-02", "2016-07-30", "2016-08-27", "2016-10-01", "2016-10-29",
      "2016-11-26", "2016-12-31", "2017-01-28"]

    all_end_dates = []

    month_numbers.each do |m|
      end_date = MerchCalendar.end_of_month(Date.current.year, merch_month: m)
      all_end_dates << end_date.to_s
    end
  end

  it "converts a date range to the corresponding merch month" do

    merch_months = [ "February", "March", "April", "May", "June", "July",
      "August", "September", "October", "November", "December", "January"]
    merch_months_all = []

    month_numbers.each do |m|
      start_date = MerchCalendar.start_of_month(Date.current.year,merch_month: m)
      end_date = MerchCalendar.end_of_month(Date.current.year,merch_month: m)
      # returns the month corresponding to each day in a given date range
      months_of_days = (start_date..end_date).map{ |date| date.strftime("%B") }

      counts = Hash.new 0

      months_of_days.each do |d|
        counts[d] += 1
      end

      most_days = counts.max_by{|k,v| v}
      merch_month_in_words = most_days[0]
      merch_months_all << merch_month_in_words
    end

    expect(merch_months_all).to eq (merch_months)

  end

end