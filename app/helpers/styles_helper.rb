module StylesHelper

  def scout_date_sort_link(params)
    params = params.merge({sort_by: :scout_date, sort_direction: sort_direction})

    link_to "Scout Date #{sort_arrow}".html_safe, styles_path(params)
  end

  def delivery_date_sort_link(params)
    params = params.merge({sort_by: :delivery_date, sort_direction: sort_direction})

    link_to "Delivery Date #{sort_arrow}".html_safe, styles_path(params)
  end

  def sort_direction
    case params[:sort_direction]
      when 'ASC'
        'DESC'
      when 'DESC'
        'ASC'
      else
        'ASC'
    end
  end

  def sort_arrow
    if sort_direction == 'ASC'
      content_tag :span, nil, class: "caret"
    else
      content_tag :span, class: "dropup" do
        content_tag :span, nil, class: "caret"
      end
    end
  end

  def options_for_month_picker(params)
    html_month = ""
    12.times do |i|
      month = i+1
      html_month += content_tag(:option, value: month, selected: current_or_active_month(params, month)) do
        Date::MONTHNAMES[month]
      end
    end
    return html_month.html_safe
  end

  def options_for_year_picker(params)
    html_year = ""
    years = (Date.current.year-1)..(Date.current.year+4)
    years.each do |year|
      html_year += content_tag(:option, value: year, selected: current_or_active_year(params, year)) do
        year.to_s
      end
    end
    return html_year.html_safe
  end

  def current_or_active_month(params, month)
    if params[:filters].present?
      return 'selected' if params[:filters][:delivery_month] == month.to_s
    else
      return 'selected' if month == Date.current.month
    end
  end

  def current_or_active_year(params, year)
    if params[:filters].present?
      return 'selected' if params[:filters][:delivery_year] == year.to_s
    else
      return 'selected' if year == Date.current.year
    end
  end

end
