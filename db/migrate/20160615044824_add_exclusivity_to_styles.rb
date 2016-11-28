class AddExclusivityToStyles < ActiveRecord::Migration
  def change
    add_column :styles, :exclusive, :boolean, default: false
  end
end
