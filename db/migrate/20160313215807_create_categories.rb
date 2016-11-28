class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string :name, null: false, default: "Category Name Needed"
      t.timestamps null: false
    end
  end
end
