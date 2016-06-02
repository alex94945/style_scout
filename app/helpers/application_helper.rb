module ApplicationHelper


  def formatted_image_tag(source, options = {})
      options = options.symbolize_keys
      src = options[:src] = path_to_image(source)

      unless src =~ /^(?:cid|data):/ || src.blank?
        options[:alt] = options.fetch(:alt){ image_alt(src) }
      end

      options[:width], options[:height] = extract_dimensions(options.delete(:size)) if options[:size]
      options[:style] = '' unless options[:style]
      options[:style] += (";-webkit-transform: rotate(#{options[:rotate_angle]}deg);")
      options.delete(:rotate_angle)

      tag("img", options) 
  end

end
