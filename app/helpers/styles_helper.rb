module StylesHelper

  def style_sort_link(params)
    params = params.merge({sort_by: :scout_date, sort_direction: sort_direction})

    link_to "Scout Date #{sort_direction}", styles_path(params)
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

end