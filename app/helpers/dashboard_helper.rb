module DashboardHelper

  def options_for_merch_date_picker(params)
    html = ""
    12.times do |i|
      month = i+1
      html += content_tag(:option, value: month, selected: current_or_active_merch_month(params, month)) do
        month_range_to_month_name(month)
      end
    end
    return html.html_safe
  end

  def month_range_to_month_name(month)
    start_date = MerchCalendar.start_of_month(Date.current.year,merch_month: month)
    end_date = MerchCalendar.end_of_month(Date.current.year,merch_month: month)

    # returns the month corresponding to each day in a given date range
    months_of_days = (start_date..end_date).map{ |date| date.strftime("%B") }
    counts = Hash.new 0
    months_of_days.each do |d|
      counts[d] += 1
    end

    most_days = counts.max_by{|k,v| v}
    merch_month_in_words = most_days[0]
    return merch_month_in_words
  end

  def current_or_active_merch_month(params, month)
    if params[:merch_month].present?
      return 'selected' if params[:merch_month] == month.to_s
    else
      return 'selected' if month == MerchCalendar::MerchWeek.from_date(Date.current).merch_month
    end
  end


  def start_of_period(params = {})
    if params[:merch_month].present?
      MerchCalendar.start_of_month(Date.current.year, merch_month: params[:merch_month].to_i).strftime("%B %d, %Y")
    else
      month = MerchCalendar::MerchWeek.from_date(Date.current).merch_month
      MerchCalendar.start_of_month(Date.current.year, merch_month: month).strftime("%B %d, %Y")
    end
  end

  def end_of_period(params = {})
    if params[:merch_month].present?
      MerchCalendar.end_of_month(Date.current.year, merch_month: params[:merch_month].to_i).strftime("%B %d, %Y")
    else
      month = MerchCalendar::MerchWeek.from_date(Date.current).merch_month
      MerchCalendar.end_of_month(Date.current.year, merch_month: month).strftime("%B %d, %Y")
    end
  end
end