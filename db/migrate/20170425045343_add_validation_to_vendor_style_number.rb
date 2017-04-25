class AddValidationToVendorStyleNumber < ActiveRecord::Migration
  def change
    change_column_null :styles, :vendor_style_number, false
  end
end
