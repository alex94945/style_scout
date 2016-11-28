class AddFieldsToStyle < ActiveRecord::Migration
  def change
  	remove_column :styles, :taxonomy
  	add_column :styles, :notes, :text
  	add_reference :styles, :category
  	rename_column :styles, :vendor_underscore_style_number, :vendor_style_number
  end
end
