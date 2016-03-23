class AddStatusToStyle < ActiveRecord::Migration
  def change
    add_column :styles, :status, :integer
  end
end
