class Category < ActiveRecord::Base
  before_save :downcase_name

  def display_name
    name.titleize
  end

  private
    def downcase_name
        self.name = name.downcase
    end
end
