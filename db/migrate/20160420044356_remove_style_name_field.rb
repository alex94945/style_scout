class RemoveStyleNameField < ActiveRecord::Migration
  def change
    remove_column :styles, :name
  end
end
