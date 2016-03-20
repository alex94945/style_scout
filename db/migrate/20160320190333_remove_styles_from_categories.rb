class RemoveStylesFromCategories < ActiveRecord::Migration
  def change
    remove_column :styles, :category_id
    add_column :styles, :category_name, :string
  end
end
