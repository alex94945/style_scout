class RemoveVariations < ActiveRecord::Migration
  def change
  	drop_table :variations
  end
end
