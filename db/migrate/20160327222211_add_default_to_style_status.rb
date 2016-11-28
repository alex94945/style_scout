class AddDefaultToStyleStatus < ActiveRecord::Migration
  def change
    change_column :styles, :status, :integer, :default => "0"
  end
end
