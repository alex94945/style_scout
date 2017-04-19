class StyleDuplicatorService

  def initialize(style_id)
    @style = Style.find(style_id)
  end

  def perform
    duplicate_style = new_style

    if duplicate_style.valid?
      duplicate_style.save
    else
      duplicate_style = nil
    end

    return duplicate_style
  end

  private
    def new_style
      duplicate_style = @style.dup
      duplicate_style.vendor_style_number = 'DUPLICATE'

      return duplicate_style
    end

end