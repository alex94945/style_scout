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

  # DELIVERY MONTHS AND YEARS
  def options_for_delivery_month_picker(params)
    html_months = "<option value=\"null\"> --- </option>"
    12.times do |i|
      month = i+1
      html_months += content_tag(:option, value: month, selected: current_or_active_delivery_month(params, month)) do
        Date::MONTHNAMES[month]
      end
    end
    return html_months.html_safe
  end

  def options_for_delivery_year_picker(params)
    html_years = "<option value=\"null\"> --- </option>"
    years = (Date.current.year-1)..(Date.current.year+4)
    years.each do |year|
      html_years += content_tag(:option, value: year, selected: current_or_active_delivery_year(params, year)) do
        year.to_s
      end
    end
    return html_years.html_safe
  end

  def current_or_active_delivery_month(params, month)
    if params[:filters].present?
      if params[:filters][:delivery_month] == month.to_s
        return 'selected'
      elsif params[:filters][:delivery_month] == '---'
        return 'selected'
      end
    else
      return 'selected' if month == '---'
    end
  end

  def current_or_active_delivery_year(params, year)
    if params[:filters].present?
      if params[:filters][:delivery_year] == year.to_s
        return 'selected'
      elsif params[:filters][:delivery_year] == '---'
        return 'selected'
      end
    else
      return 'selected' if year == '---'
    end
  end

# SCOUT MONTHS AND YEARS
  def options_for_scout_month_picker(params)
    html_months = "<option value=\"null\"> --- </option>"
    12.times do |i|
      month = i+1
      html_months += content_tag(:option, value: month, selected: current_or_active_scout_month(params, month)) do
        Date::MONTHNAMES[month]
      end
    end
    return html_months.html_safe
  end

  def options_for_scout_year_picker(params)
    html_years = "<option value=\"null\"> --- </option>"
    years = (Date.current.year-1)..(Date.current.year+4)
    years.each do |year|
      html_years += content_tag(:option, value: year, selected: current_or_active_scout_year(params, year)) do
        year.to_s
      end
    end
    return html_years.html_safe
  end

  def current_or_active_scout_month(params, month)
    if params[:filters].present?
      if params[:filters][:scout_month] == month.to_s
        return 'selected'
      elsif params[:filters][:scout_month] == '---'
        return 'selected'
      end
    else
      return 'selected' if month == '---'
    end
  end

  def current_or_active_scout_year(params, year)
    if params[:filters].present?
      if params[:filters][:scout_year] == year.to_s
        return 'selected'
      elsif params[:filters][:scout_year] == '---'
        return 'selected'
      end
    else
      return 'selected' if year == '---'
    end
  end

end
