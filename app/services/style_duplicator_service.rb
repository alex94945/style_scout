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
      i = 1

      if duplicate_style.vendor_style_number[-3..-1] == "(#{i})"
        duplicate_style.vendor_style_number = duplicate_style.vendor_style_number.next
      elsif @style.vendor_style_number[-3..-1] == "(#{i})"
        i +=1
        duplicate_style.vendor_style_number += "(#{i})"
      else
        duplicate_style.vendor_style_number += "(#{i})"
        i +=1
      end

      return duplicate_style
    end

end
