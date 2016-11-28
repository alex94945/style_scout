class AddDefaultQuantityToStyle < ActiveRecord::Migration
  def change
    change_column :styles, :quantity, :integer, default: 0, null: false
  end
end
