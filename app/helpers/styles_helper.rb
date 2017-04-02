module StylesHelper

  def style_sort_link(params)
    params = params.merge({sort_by: :scout_date, sort_direction: sort_direction})

    link_to "Scout Date #{sort_arrow}".html_safe, styles_path(params)
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

end
