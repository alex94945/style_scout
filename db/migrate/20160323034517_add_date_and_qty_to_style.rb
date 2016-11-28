class AddDateAndQtyToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :delivery_date, :date
    add_column :styles, :quantity, :integer
  end
end
