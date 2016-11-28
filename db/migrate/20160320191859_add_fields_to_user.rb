class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer
    add_column :users, :administrator, :boolean, default: false
  end
end
